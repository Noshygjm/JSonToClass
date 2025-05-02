program JSonToClass;

uses
  Vcl.Forms,
  UMain in '..\..\source\Units\UMain.pas' {FMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Graphite');
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
