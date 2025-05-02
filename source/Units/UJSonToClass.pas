unit UJSonToClass;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.JSON.Types, System.JSON.Utils ;

/// <summary>
/// Genera definiciones de clases Pascal a partir de un objeto JSON.
/// </summary>
/// <param name="AObject">TJSONObject raíz a procesar.</param>
/// <param name="AOutput">TStrings donde se irán añadiendo las líneas de código.</param>
/// <param name="ClassName">Nombre de la clase a generar para el objeto raíz.</param>
procedure GenerateFromJSONObject(const AObject: TJSONObject; AOutput: TStrings; const ClassName: string = 'TRoot');

implementation

procedure Generate(const AJSON: TJSONObject; AOutput: TStrings; const AClassName: string);
var
  Pair: TJSONPair;
  PropName, FieldName, DelphiType: string;
  Value: TJSONValue;
begin
  AOutput.Add('unit ' + AClassName + ';');
  AOutput.Add('');
  AOutput.Add('interface');
  AOutput.Add('');
  AOutput.Add('uses');
  AOutput.Add('  System.Classes, System.Generics.Collections;');
  AOutput.Add('');
  AOutput.Add('type');
  AOutput.Add('  ' + AClassName + ' = class');
  AOutput.Add('  private');

  // --- Campos privados ---
  for Pair in AJSON do
  begin
    PropName := Pair.JsonString.Value;
    FieldName := 'F' + PropName;
    Value := Pair.JsonValue;

    if Value is TJSONString then
      DelphiType := 'string'
    else if Value is TJSONNumber then
      DelphiType := 'Double'
    else if Value is TJSONBool then
      DelphiType := 'Boolean'
    else if Value is TJSONObject then
      DelphiType := 'T' + PropName
    else if Value is TJSONArray then
      DelphiType := 'TList<T' + PropName + '>'
    else
      DelphiType := 'Variant';

    AOutput.Add(Format('    %s: %s;', [FieldName, DelphiType]));
  end;

  AOutput.Add('  public');

  // --- Propiedades públicas ---
  for Pair in AJSON do
  begin
    PropName := Pair.JsonString.Value;
    FieldName := 'F' + PropName;
    Value := Pair.JsonValue;

    if Value is TJSONString then
      DelphiType := 'string'
    else if Value is TJSONNumber then
      DelphiType := 'Double'
    else if Value is TJSONBool then
      DelphiType := 'Boolean'
    else if Value is TJSONObject then
      DelphiType := 'T' + PropName
    else if Value is TJSONArray then
      DelphiType := 'TList<T' + PropName + '>'
    else
      DelphiType := 'Variant';

    AOutput.Add(Format('    property %s: %s read %s write %s;',
      [PropName, DelphiType, FieldName, FieldName]));
  end;

  AOutput.Add('  end;');
  AOutput.Add('');
  AOutput.Add('implementation');
  AOutput.Add('');
  AOutput.Add('end.');
end;


procedure GenerateFromJSONObject(const AObject: TJSONObject; AOutput: TStrings; const ClassName: string = 'TRoot');
begin
  AOutput.Add('// Auto-generated classes from JSON object');
  AOutput.Add('unit GeneratedClasses;');
  AOutput.Add('');
  AOutput.Add('interface');
  AOutput.Add('');
  AOutput.Add('uses System.Generics.Collections;');
  AOutput.Add('');

  // Procesar el objeto raíz
  Generate(AObject, AOutput, ClassName);

  AOutput.Add('');
  AOutput.Add('implementation');
  AOutput.Add('');
  AOutput.Add('end.');
end;

end.
