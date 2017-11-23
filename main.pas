unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls, TuringMod;

type

  { TForm1 }

  TForm1 = class(TForm)
    addcom: TButton;
    commands: TListBox;
    Panel1: TPanel;
    step: TButton;
    start: TButton;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure startClick(Sender: TObject);
    procedure stepClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender : TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    theMachine : TuringMachine;
    procedure machineError(Sender: TObject);
    procedure machineStart(Sender:TObject);
    procedure machineStop(Sender: TObject);
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.stepClick(Sender: TObject);
begin
     theMachine.step;
     Edit1.Caption:=theMachine.getTape;
end;

procedure TForm1.startClick(Sender: TObject);
begin
  step.Enabled := True;
  Edit1.ReadOnly := True;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  theMachine.setTape(Edit1.Caption);
end;

procedure TForm1.FormCreate(Sender:TObject);
begin
          theMachine := TuringMachine.Create();
          theMachine.onStart := @machineStart;
          theMachine.onStop:=@machineStop;
          theMachine.onError:=@machineError;
          step.Enabled := False;
          start.Enabled := False;
end;


procedure TForm1.MenuItem1Click(Sender: TObject);
begin
     if Assigned(theMachine) then theMachine.new;
     Edit1.Caption := theMachine.getTape;
     step.Enabled := False;
     Edit1.Enabled:= True;
end;

procedure TForm1.machineStart(Sender: TObject);
begin
     Edit1.ReadOnly := True;
end;

procedure TForm1.machineError(Sender: TObject);
begin
     ShowMessage('Ошибка! Команда не найдена');
end;

procedure TForm1.machineStop(Sender: TObject);
begin
     step.Enabled := False;
end;





{ TForm1 }



end.

