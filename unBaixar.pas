unit unBaixar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, IdComponent,
  IdBaseComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TfmDownlaod = class(TForm)
    edLink: TEdit;
    lbLink: TLabel;
    btIniciar: TButton;
    pbDownlaod: TProgressBar;
    lbProgresso: TLabel;
    btProgresso: TButton;
    btParar: TButton;
    btHistorico: TButton;
    lbUsuario: TLabel;
    btFechar: TButton;
    lbStatus: TLabel;
    lbsituacao: TLabel;
    IdHTTP: TIdHTTP;
    dlgSave: TSaveDialog;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    lbporcentagem: TLabel;
    function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function RetornaKiloBytes(ValorAtual: real): string;
    procedure btFecharClick(Sender: TObject);
    procedure btPararClick(Sender: TObject);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btIniciarClick(Sender: TObject);
    procedure btProgressoClick(Sender: TObject);
    procedure btHistoricoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDownlaod: TfmDownlaod;
  datainicial,datafinal: tdate;

implementation

{$R *.dfm}

Uses

unComponentes,unHistorico;

function TfmDownlaod.RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
var
resultado: Real;
begin
  resultado := ((ValorAtual * 100) / ValorMaximo);
  Result    := FormatFloat('0%', resultado);
end;

function TfmDownlaod.RetornaKiloBytes(ValorAtual: real): string;
var
resultado : real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result    := FormatFloat('0.000 KBs', resultado);
end;

procedure TfmDownlaod.btFecharClick(Sender: TObject);
begin
  if IdHTTP.Connected Then
  Begin
    if Application.MessageBox (PChar ('Existe um download em andamento, deseja interrompe-lo ?'),
     'Confirmação', MB_YESNO) = mrYes then
     Begin
       IdHTTP.Disconnect;
       pbDownlaod.Position := 0;
       fmDownlaod.close;
     End

  End
  Else
  fmDownlaod.close;

end;

procedure TfmDownlaod.btHistoricoClick(Sender: TObject);
begin
  fmHistorico.ShowModal;
end;

procedure TfmDownlaod.btIniciarClick(Sender: TObject);
var
fileDownload: TFileStream;
vrLin: String;
codigo: Integer;

 begin
   if edLink.Text <> '' then
   Begin

     dlgSave.Filter := '|*' + ExtractFileExt(edLink.Text);
     dlgSave.FileName := '';
     if dlgSave.Execute then
     begin
       fileDownload := TFileStream.Create(dlgSave.FileName + ExtractFileExt(edLink.Text), fmCreate);
       pbDownlaod.Visible := True;
       btIniciar.Enabled   := false;
       Try
         IdHTTP.Get(edLink.Text, fileDownload);
         vrlin := 'SELECT COUNT(CODIGO) contagem FROM LOGDOWNLOAD';
         fmComponentes.qyTemp.SQL.Clear;
         fmComponentes.qyTemp.SQL.Add(vrLin);
         FmComponentes.qyTemp.Open;
         codigo := fmComponentes.qyTemp.FieldByName('contagem').AsInteger + 1;
         fmComponentes.qyTemp.Close;
         fmComponentes.qyTemp.sql.clear;
         fmComponentes.qyTemp.sql.add('BEGIN TRANSACTION');
         fmComponentes.qyTemp.execsql;
         vrlin := 'INSERT INTO LOGDOWNLOAD (CODIGO,URL,DATAINICIO,DATAFIM) VALUES (' + inttostr(codigo) + ',';
         vrlin := vrlin + chr(39) + edLink.Text + chr(39) + ',';
         vrlin := vrlin + chr(39) + datetostr(datainicial) + chr(39) + ',';
         vrlin := vrlin + chr(39) + datetostr(datafinal) + chr(39) + ')';
         fmComponentes.qyTemp.SQL.Clear;
         fmComponentes.qyTemp.SQL.Add(vrLin);
          Try fmComponentes.qyTemp.execsql;
                fmComponentes.qyTemp.sql.clear;
                fmComponentes.qyTemp.sql.add('COMMIT');
                fmComponentes.qyTemp.execsql;
          Except
                fmComponentes.qyTemp.sql.clear;
                fmComponentes.qyTemp.sql.add('ROLLBACK');
                fmComponentes.qyTemp.execsql;
                ShowMessage('Não Foi possivel Inserir dados Verique!');
          End;
       Finally
         fileDownload.Free;
         IdHTTP.Disconnect;
       End;

     end;

   End
   Else
   ShowMessage('Insira o Link Para Download!');
 end;

procedure TfmDownlaod.btPararClick(Sender: TObject);
 begin
   IdHTTP.Disconnect;
   pbDownlaod.Position := 0;
   btIniciar.Enabled := True;
 end;

procedure TfmDownlaod.btProgressoClick(Sender: TObject);
begin
  Showmessage(lbporcentagem.Caption);
end;

procedure TfmDownlaod.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  datainicial:=Now;
  pbDownlaod.Max     := AworkCountMax;
 lbsituacao.Caption    := 'Baixando ... ';
end;

procedure TfmDownlaod.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  lbsituacao.Caption    := 'Baixando ... ' + RetornaKiloBytes(AWorkCount);
  lbporcentagem.Caption := ' Download em ... ' + RetornaPorcentagem(pbDownlaod.Max, AWorkCount);
  pbDownlaod.Position   := AWorkCount;

end;

procedure TfmDownlaod.IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  pbDownlaod.Position := 0;
  lbsituacao.Caption    := 'Download Finalizado ...';
  btIniciar.Enabled    := true;
  datafinal:= Now;
end;

end.
