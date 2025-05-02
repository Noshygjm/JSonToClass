unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, system.JSON,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Menus;

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
    Panel5: TPanel;
    Label1: TLabel;
    edtClassName: TEdit;
    MainMenu1: TMainMenu;
    JSOn1: TMenuItem;
    Class1: TMenuItem;
    Help1: TMenuItem;
    JSon2: TMenuItem;
    JSon3: TMenuItem;
    Exit1: TMenuItem;
    Help2: TMenuItem;
    Help3: TMenuItem;
    procedure btnGenerateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
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
  vJSONValue: TJSONValue;
  vJSONObject: TJSONObject;
  vClassName: String;
begin
  mmoClass.Lines.Clear;

  vClassName := Trim(edtClassName.Text);

  if vClassName.Length <= 0 then
  begin
    raise Exception.Create('Enter the class name. (Required)');
  end;

  try
    vJSONValue := TJSONObject.ParseJSONValue(mmoJSON.Text);
    if not Assigned(vJSONValue) then
      raise Exception.Create('El texto no es un JSON válido.');

    if vJSONValue is TJSONArray then
    begin

    end
    else if vJSONValue is TJSONObject then
    begin
      vJSONObject := vJSONValue as TJSONObject;
      // Ahora podés usar JSONObject con tu clase generadora
      GenerateFromJSONObject(vJSONObject, mmoClass.Lines, vClassName);
    end
    else
      raise Exception.Create('The root JSON must be an object.');

  finally
    vJSONValue.Free;
  end;
end;

procedure TFMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMain.FormShow(Sender: TObject);
begin
  { Inputo Default }
  edtClassName.Text := 'TRoot';

  mmoJSon.Lines.Clear;
  mmoClass.Lines.Clear;

  mmoJSon.SetFocus;
end;

end.
