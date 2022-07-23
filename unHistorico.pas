unit unHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfmHistorico = class(TForm)
    btFechar: TButton;
    lvhistorico: TListView;
    btPesquisa: TButton;
    procedure btFecharClick(Sender: TObject);
    procedure btPesquisaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHistorico: TfmHistorico;

implementation

{$R *.dfm}

Uses
unComponentes,unBaixar;

procedure TfmHistorico.btFecharClick(Sender: TObject);
begin
  fmComponentes.qyHistorico.Close;
  lvhistorico.Clear;
  fmHistorico.Close;
end;

procedure TfmHistorico.btPesquisaClick(Sender: TObject);
var
lista:TlistItem;
i:integer;
vrlin:string;

begin
  fmComponentes.qyHistorico.SQL.Clear;
  vrlin := 'Select codigo, ';
  vrlin := vrlin + 'to_date(datainicio,' + chr(39) + 'dd/MM/yyyy' + chr(39) + ') datainicio,';
  vrlin := vrlin + 'to_date(datafim,' + chr(39) + 'dd/MM/yyyy' + chr(39) + ') datafim,';
  vrlin := vrlin + 'url from logdownload';
  fmComponentes.qyHistorico.SQL.Add(vrlin);
  fmComponentes.qyHistorico.Open;
  for I := 0 to fmComponentes.qyHistorico.RowsAffected - 1 do

  Begin
    lista:= lvhistorico.Items.Add;
    lista.Caption := fmComponentes.qyHistorico.FieldValues['CODIGO'];
    Lista.SubItems.Add(fmComponentes.qyHistorico.FieldValues['DATAINICIO']);
    Lista.SubItems.Add(fmComponentes.qyHistorico.FieldValues['DATAFIM']);
    Lista.SubItems.Add(fmComponentes.qyHistorico.FieldValues['URL']);
  End;
end;

end.
