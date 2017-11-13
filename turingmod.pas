unit TuringMod;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type TuringMachine = class
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

    function addCommand (x : TuringCommand): TList;

    procedure Step ;

type TuringCommand = class
  private

  public
    currState : Integer;
    currSymbol : Char;
    nextSymbol : Char;
    nexState : Integer;
    orientation : Integer;//-1, (0) и 1

implementation

    function TuringMachine.getState : Integer;
    begin
         result := state;
    end;

    function TuringMachine.getTape : Integer;
    begin
         result := tape;
    end;

    function TuringMachine.getPosition : Integer;
    begin
         result := position;
    end;

    function TuringMachine.getTheProgram : Integer;
    begin
         result := theProgram;
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
         for i := 0 to Count(theProgram)-1 do
             if (t[p] = TuringCommand(tp[i]).currSymbol and s = TuringCommand(tp[i]).currState) then
                begin
                       result := TuringCommand(tp[i]);
                       break;
                end;
    end;

    procedure TuringMachine.Step
    var rc
    begin

      if (getState = 0) then
      begin
         if Assigned(onStop) then onStop(self);
         exit;
      end;
      if (getRightCommand() = nil then
      begin
         if Assigned(onError) then onError(self);
         exit;
      end;
      // дописать что делать, если всё хорошо


    end;
end.


