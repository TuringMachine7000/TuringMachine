unit TuringMod;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type TuringCommand = class
  private

  public
    currState : Integer;
    currSymbol : Char;
    nextSymbol : Char;
    nextState : Integer;
    orientation : Integer;//-1, (0) и 1
  end;

type

{ TuringMachine }

 TuringMachine = class
  private
    tape : String;     //Лента
    position : Integer;//Текущая позиция курсора
    state : Integer;   //текущее состояние
    theProgram : TList;//список комманд
  public
    onStart : TNotifyEvent;
    onStep : TNotifyEvent;
    onStop : TNotifyEvent;
    onError : TNotifyEvent;
    function getRightCommand : TuringCommand;
    function getState: Integer;
    function getTape: String;
    function getPosition : Integer;
    function getTheProgram : TList;

    procedure setTape (t : String);
    procedure addCommand (x : TuringCommand);
    procedure new;
    procedure start(s:String);
    procedure Step ;
    constructor Create;
  end;

implementation

    function TuringMachine.getState : Integer;
    begin
         result := state;
    end;
    function TuringMachine.getTape : String;
    begin
         result := tape;
    end;

    function TuringMachine.getPosition : Integer;
    begin
         result := position;
    end;

    function TuringMachine.getTheProgram : TList;
    begin
         result := theProgram;
    end;

    procedure TuringMachine.setTape (t : String);
    begin
         tape := t;
    end;

    procedure TuringMachine.addCommand(x : TuringCommand);
    begin
         theProgram.add(x);
    end;

    procedure TuringMachine.new;
    var c1 : TuringCommand;
    begin
         state := 1;
         tape := '111111';
         position := 1;
         c1 := TuringCommand.Create;
         c1.orientation:=1;
         c1.currState:=1;
         c1.currSymbol:='1';
         c1.nextState:=1;
         c1.nextSymbol:='0';
         addCommand(c1);
    end;

    procedure TuringMachine.start(s: String);
    begin
      tape := s;
      position:=1;
      state := 1;
    end;

    function TuringMachine.getRightCommand : TuringCommand;
    var i : Integer;
    var s :Integer;
    var t : String;
    var p :Integer;
    var tp : TList;
    begin
         s := getState();
         t := getTape();
         p := getPosition();
         tp := getTheProgram();
         result := nil;
         for i := 0 to theProgram.Count-1 do
             if ((t[p] = TuringCommand(tp[i]).currSymbol) and (s = TuringCommand(tp[i]).currState)) then
                begin
                       result := TuringCommand(tp[i]);
                       break;
                end;
    end;

    procedure TuringMachine.Step;
    var rc : TuringCommand;
    begin
      rc := getRightCommand();
      if (getState = 0) then
      begin
         if Assigned(onStop) then onStop(self);
         exit;
      end;
      if (rc = nil) then
      begin
         if (Assigned(onError) and Assigned(onStop))then
            begin
                 onError(self);
                 onStop(self);
            end;
         exit;
      end;
      tape[position] := rc.nextSymbol;
      state := rc.nextState;
      position := position + rc.orientation;
    end;

    constructor TuringMachine.Create;
    begin
      TheProgram := TList.Create;
    end;




end.


