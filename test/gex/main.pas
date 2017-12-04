unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    PB: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure PBPaint(Sender: TObject);

  private
    { private declarations }
  public
    const n = 5;
    const r = 50;
    procedure hexagon(x, y:Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
     PB.canvas.Brush.Color:=clGreen;
end;

procedure TForm1.PBPaint(Sender: TObject);
var rx, ry, x, y, xt, yt, i, j: Integer;
begin
     x := 500;
     y := 500;
     rx := round(0.5 * r);
     ry := round(sqrt(3)/2*r);
     PB.canvas.MoveTo(x, y);
     for j := 0 to (n-1) do
     begin
         for i := 0 to (n-1) do
         begin
              xt := x - i*(r + rx);
              yt := y - i*(ry);
              hexagon(xt, yt);
              PB.Canvas.MoveTo(xt, yt);
         end;
         y := y - 2*ry;
     end;
end;

procedure TForm1.hexagon(x, y: Integer);
begin
     Pb.Canvas.Pen.Color:=clGreen;
     PB.canvas.MoveTo(x, y);
     PB.canvas.Lineto(x+r,y);


     pb.canvas.MoveTo(x+r,y);
     PB.canvas.Lineto(x+r+round(0.5*r),y-round(sqrt(3)/2*r));

     Pb.Canvas.Pen.Color:=clBlack;
     PB.canvas.MoveTo(x+r+round(0.5*r),y-round(sqrt(3)/2*r));
     PB.canvas.LineTo(x+r,y-round(sqrt(3)*r));

     PB.canvas.MoveTo(x+r,y-round(sqrt(3)*r));
     PB.canvas.LineTo(x,y-round(sqrt(3)*r));

     PB.canvas.MoveTo(x,y-round(sqrt(3)*r));
     PB.canvas.LineTo(x-round(0.5*r),y-round(sqrt(3)/2*r));

     PB.canvas.MoveTo(x-round(0.5*r),y-round(sqrt(3)/2*r));
     PB.canvas.LineTo(x, y);

     PB.canvas.MoveTo(x,y);
end;

end.

