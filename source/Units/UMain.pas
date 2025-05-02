unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, system.JSON,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    Panel4: TPanel;
    mmoJSon: TMemo;
    mmoClass: TMemo;
    btnGenerate: TButton;
    procedure btnGenerateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

Uses UJSonToClass;

procedure TFMain.btnGenerateClick(Sender: TObject);
var
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
  Output: TStrings;
begin
  try
    JSONValue := TJSONObject.ParseJSONValue(mmoJSON.Text);
    if not Assigned(JSONValue) then
      raise Exception.Create('El texto no es un JSON válido.');

    if JSONValue is TJSONObject then
    begin
      JSONObject := JSONValue as TJSONObject;
      // Ahora podés usar JSONObject con tu clase generadora
      GenerateFromJSONObject(JSONObject, mmoClass.Lines, 'TRoot');
    end
    else
      raise Exception.Create('El JSON raíz debe ser un objeto.');

  finally
    JSONValue.Free;
  end;
end;

end.
