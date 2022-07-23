object fmComponentes: TfmComponentes
  Left = 0
  Top = 0
  Caption = 'fmcomponetes'
  ClientHeight = 293
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fdConexão: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Pedro\Documents\Embarcadero\Studio\Projects\Do' +
        'wnloads\DB\dbTeste .db'
      'DriverID=SQLite')
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime]
    Connected = True
    Left = 216
    Top = 64
  end
  object qyUsuario: TFDQuery
    Connection = fdConexão
    Left = 208
    Top = 144
  end
  object qyTemp: TFDQuery
    Connection = fdConexão
    Left = 296
    Top = 128
  end
  object qyHistorico: TFDQuery
    Connection = fdConexão
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime]
    SQL.Strings = (
      
        'select codigo,to_date(datainicio,'#39'DD-MM-YYYY'#39'),to_date(datafim,'#39 +
        'DD-MM-YYYY'#39'),url from LOGDOWNLOAD')
    Left = 416
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = qyHistorico
    Left = 392
    Top = 64
  end
end
