unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  TuringMod;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}
procedure test;
    var theMachine : TuringMachine;
    c1 : TuringCommand;
    i : Integer;
    begin
    TheMachine := TuringMachine.Create;

    c1 := TuringCommand.Create;
    c1.currState:=1;
    c1.currSymbol:='1';
    c1.nextState:=1;
    c1.nextSymbol:='0';
    c1.orientation:=1;
    Themachine.addCommand(c1);

    TheMachine.start('111111');
    for i := 1 to 10 do
    begin
         //ShowMessage('кря');
         TheMachine.step;
         ShowMessage(IntToStr(TheMachine.getState) + ' '+ TheMachine.getTape);
    end;
    end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  test;
end;

end.

