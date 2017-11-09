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
    onStart:TNotifyEvent
    onStep:TNotifyEvent
    onStop:TNotifyEvent


type TuringCommand = class
  private

  public
    currState : Integer;
    currSymbol : Char;
    nextSymbol : Char;
    nexState : Integer;
    orientation : Integer;//-1, 0 и 1

implementation


end.

