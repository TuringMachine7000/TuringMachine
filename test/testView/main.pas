unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
  var li : TListItem;
begin
  li := ListView1.Items.Add;
  li.Caption := 'bla';
  li.subItems.Add('abla');
  li.Caption := 'vlabla';
  li.subItems.Add('euyewgctygabla');
  li.SubItems.delete(0);
end;

end.

