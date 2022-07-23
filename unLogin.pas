unit unLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfmLogin = class(TForm)
    lblogin: TLabel;
    lbsenha: TLabel;
    edlogin: TEdit;
    edsenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fmLogin: TfmLogin;

implementation

{$R *.dfm}

Uses
unComponentes,unBaixar;


procedure TfmLogin.Button1Click(Sender: TObject);
begin
  if (edLogin.Text='') then
    Begin
      Showmessage('Preencha o seu codigo de Acesso!');
      edLogin.SetFocus;
    End
  Else if  (edSenha.Text='') then
    Begin
      Showmessage('Preencha o Campo Senha');
      edSenha.SetFocus;
    End
  Else
    Begin
      fmComponentes.qyUsuario.Close;
      fmComponentes.qyUsuario.SQL.Text:=('select codigo,usuariobd,nome from dnusuario where codigo='+edLogin.Text);
      fmComponentes.qyUsuario.Open;
      if (fmComponentes.qyUsuario.RowsAffected = 0)   then
        Begin
          Showmessage('Login Não Encontrado, Verifique Sua Permissão!');
          edLogin.SetFocus;
        End
      else if (fmComponentes.qyUsuario.FieldByName('usuariobd').Text=edSenha.Text) and (fmComponentes.qyUsuario.FieldByName('codigo').Text=edLogin.Text) then
        Begin
          fmDownlaod.lbUsuario.Caption := fmComponentes.qyUsuario.FieldByName('nome').Text;
          fmDownlaod.ShowModal;
        End;
    End;
end;

procedure TfmLogin.Button2Click(Sender: TObject);
begin
  fmLogin.Close;
end;

end.
