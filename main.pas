unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls, ComCtrls, ActnList, TuringMod;

type

  { TForm1 }

  TForm1 = class(TForm)
    addcom: TButton;
    ok: TButton;
    cancel: TButton;
    orient: TEdit;
    symb2: TEdit;
    state2: TEdit;
    state1: TButton;
    symb1: TEdit;
    Save: TMenuItem;
    SaveAs: TMenuItem;
    Open: TMenuItem;
    stop: TButton;
    StatusBar: TLabel;
    ListView1: TListView;
    Panel1: TPanel;
    Panel2: TPanel;
    Tape: TScrollBox;
    step: TButton;
    start: TButton;
    MainMenu1: TMainMenu;
    FileMenu: TMenuItem;
    NewProject: TMenuItem;
    procedure addcomClick(Sender: TObject);
    procedure NewProjectClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure startClick(Sender: TObject);
    procedure state1Click(Sender: TObject);
    procedure stepClick(Sender: TObject);
    procedure FormCreate(Sender : TObject);
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

end;

procedure TForm1.startClick(Sender: TObject);
begin
  step.Enabled := True;
  stop.Enabled := True;
end;

procedure TForm1.state1Click(Sender: TObject);
begin

end;

procedure TForm1.addcomClick(Sender: TObject);
begin
     symb1.Left:=0;
     state1.Left:=88;
     state2.Left:=184;
     symb2.Left:=264;
     orient.Left:=344;
     ok.Left:=472;
     cancel.Left:=504;
end;

procedure TForm1.NewProjectClick(Sender: TObject);
begin
     theMachine.new;
     start.Enabled:=True;
     addcom.Enabled:=True;
end;

procedure TForm1.OpenClick(Sender: TObject);
begin

end;

procedure TForm1.SaveAsClick(Sender: TObject);
begin

end;

procedure TForm1.SaveClick(Sender: TObject);
begin

end;


procedure TForm1.FormCreate(Sender:TObject);
begin
          theMachine := TuringMachine.Create();
          theMachine.onStart := @machineStart;
          theMachine.onStop:=@machineStop;
          theMachine.onError:=@machineError;
          step.Enabled := False;
          start.Enabled := False;
          addcom.Enabled := False;
          stop.Enabled := False;
          symb1.Left:=-1000;
          state1.Left:=-1000;
          state2.Left:=-1000;
          symb2.Left:=-1000;
          orient.Left:=-1000;
          ok.Left:=-1000;
          cancel.Left:=-1000;

end;


procedure TForm1.machineStart(Sender: TObject);
begin
end;

procedure TForm1.machineError(Sender: TObject);
begin
     ShowMessage('Ошибка! Команда не найдена');
end;

procedure TForm1.machineStop(Sender: TObject);
begin
     step.Enabled := False;
     stop.Enabled:=False;
end;





{ TForm1 }



end.

