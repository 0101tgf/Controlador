object frmFiltroRelAbastecimento: TfrmFiltroRelAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de abastecimentos por per'#237'odo'
  ClientHeight = 107
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 58
    Top = 22
    Width = 17
    Height = 13
    Caption = 'De:'
  end
  object Label2: TLabel
    Left = 175
    Top = 22
    Width = 21
    Height = 13
    Caption = 'At'#233':'
  end
  object DateInicial: TDateTimePicker
    Left = 81
    Top = 19
    Width = 89
    Height = 21
    Date = 44630.000000000000000000
    Time = 0.383350810181582300
    TabOrder = 0
  end
  object DateFinal: TDateTimePicker
    Left = 201
    Top = 19
    Width = 89
    Height = 21
    Date = 44630.000000000000000000
    Time = 0.383350810181582300
    TabOrder = 1
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 200
    Top = 58
    Width = 90
    Height = 34
    Margins.Top = 15
    Margins.Bottom = 15
    BevelOuter = bvNone
    Color = 12477460
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12477460
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object btn_Cancelar: TSpeedButton
      Left = 0
      Top = 0
      Width = 90
      Height = 34
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_CancelarClick
      ExplicitTop = -9
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 79
    Top = 58
    Width = 90
    Height = 34
    Margins.Top = 15
    Margins.Bottom = 15
    BevelOuter = bvNone
    Color = 12477460
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12477460
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    object btn_Confirmar: TSpeedButton
      Left = 0
      Top = 0
      Width = 90
      Height = 34
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Confirmar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_ConfirmarClick
      ExplicitLeft = 2
    end
  end
  object DataSource_RelatorioAbastecimento: TDataSource
    DataSet = FDQuery_RelatorioAbastecimento
    Left = 88
    Top = 10
  end
  object FDQuery_RelatorioAbastecimento: TFDQuery
    AggregatesActive = True
    Connection = dm.conexao
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 500
    SQL.Strings = (
      'select Data_Movimento,Tanque,Combustivel,Bomba, '
      'sum(Total) as Total from TAB_ABASTECIMENTOS '
      
        'where Data_Movimento between :DataIni and :DataFim group by Data' +
        '_Movimento,Tanque,Bomba '
      'order by 1')
    Left = 266
    Top = 7
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
end
