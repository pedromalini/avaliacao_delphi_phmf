object fmDownlaod: TfmDownlaod
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Baixar Aplicativos'
  ClientHeight = 133
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbLink: TLabel
    Left = 8
    Top = 27
    Width = 97
    Height = 13
    Caption = 'Link Para Download:'
  end
  object lbProgresso: TLabel
    Left = 53
    Top = 90
    Width = 52
    Height = 13
    Caption = 'Progresso:'
  end
  object lbUsuario: TLabel
    Left = 8
    Top = 118
    Width = 274
    Height = 13
    Alignment = taRightJustify
  end
  object lbStatus: TLabel
    Left = 74
    Top = 55
    Width = 35
    Height = 13
    Caption = 'Status:'
  end
  object lbsituacao: TLabel
    Left = 115
    Top = 55
    Width = 162
    Height = 13
  end
  object lbporcentagem: TLabel
    Left = 632
    Top = 115
    Width = 3
    Height = 13
    Visible = False
  end
  object edLink: TEdit
    Left = 111
    Top = 24
    Width = 490
    Height = 21
    MaxLength = 255
    TabOrder = 0
    TextHint = 'Link Para Download'
  end
  object btIniciar: TButton
    Left = 403
    Top = 51
    Width = 96
    Height = 25
    Caption = 'Iniciar Download'
    TabOrder = 1
    OnClick = btIniciarClick
  end
  object pbDownlaod: TProgressBar
    Left = 111
    Top = 86
    Width = 176
    Height = 17
    TabOrder = 2
  end
  object btProgresso: TButton
    Left = 293
    Top = 51
    Width = 96
    Height = 25
    Caption = 'Exibir Mensagem'
    TabOrder = 3
    OnClick = btProgressoClick
  end
  object btParar: TButton
    Left = 505
    Top = 51
    Width = 96
    Height = 25
    Caption = 'Parar Download'
    TabOrder = 4
    OnClick = btPararClick
  end
  object btHistorico: TButton
    Left = 408
    Top = 77
    Width = 193
    Height = 25
    Caption = 'Exibir Historico de Downloads'
    TabOrder = 5
    OnClick = btHistoricoClick
  end
  object btFechar: TButton
    Left = 512
    Top = 103
    Width = 89
    Height = 25
    Caption = 'Fechar Sistema'
    TabOrder = 6
    OnClick = btFecharClick
  end
  object IdHTTP: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    OnWork = IdHTTPWork
    OnWorkBegin = IdHTTPWorkBegin
    OnWorkEnd = IdHTTPWorkEnd
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = []
    Left = 624
    Top = 16
  end
  object dlgSave: TSaveDialog
    Left = 624
    Top = 64
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 368
    Top = 80
  end
end
