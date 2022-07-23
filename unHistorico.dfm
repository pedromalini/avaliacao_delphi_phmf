object fmHistorico: TfmHistorico
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Historico de Downloads'
  ClientHeight = 220
  ClientWidth = 757
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
  object btFechar: TButton
    Left = 674
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btFecharClick
  end
  object lvhistorico: TListView
    Left = 0
    Top = 34
    Width = 749
    Height = 150
    Columns = <
      item
        Caption = 'Codigo'
      end
      item
        Caption = 'Data Inicial'
        Width = 120
      end
      item
        Caption = 'Data Final'
        Width = 120
      end
      item
        Caption = 'Url'
        Width = 640
      end>
    TabOrder = 1
    ViewStyle = vsReport
  end
  object btPesquisa: TButton
    Left = 8
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btPesquisaClick
  end
end
