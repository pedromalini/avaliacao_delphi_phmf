object fmLogin: TfmLogin
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Teste Pr'#225'tico'
  ClientHeight = 220
  ClientWidth = 323
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
  object lblogin: TLabel
    Left = 64
    Top = 96
    Width = 29
    Height = 13
    Caption = 'Login:'
  end
  object lbsenha: TLabel
    Left = 64
    Top = 123
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object edlogin: TEdit
    Left = 112
    Top = 93
    Width = 121
    Height = 21
    MaxLength = 20
    NumbersOnly = True
    TabOrder = 0
    TextHint = 'Login'
  end
  object edsenha: TEdit
    Left = 112
    Top = 120
    Width = 121
    Height = 21
    CharCase = ecLowerCase
    MaxLength = 20
    PasswordChar = '#'
    TabOrder = 1
    TextHint = 'Senha'
  end
  object Button1: TButton
    Left = 112
    Top = 147
    Width = 57
    Height = 25
    Caption = 'Logar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 175
    Top = 147
    Width = 58
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = Button2Click
  end
end
