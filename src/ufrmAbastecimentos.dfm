object frmAbastecimentos: TfrmAbastecimentos
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Abastecimentos'
  ClientHeight = 450
  ClientWidth = 1059
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object pnl_Centro: TPanel
    Left = 0
    Top = 0
    Width = 1059
    Height = 450
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnl_Botom: TPanel
      Left = 0
      Top = 385
      Width = 1059
      Height = 65
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Label8: TLabel
        AlignWithMargins = True
        Left = 319
        Top = 4
        Width = 84
        Height = 58
        Align = alLeft
        Alignment = taCenter
        Caption = 'Total geral R$:'
        Layout = tlCenter
        ExplicitHeight = 17
      end
      object Panel_Botoes: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 310
        Height = 64
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Panel6: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 15
          Width = 90
          Height = 34
          Margins.Top = 15
          Margins.Bottom = 15
          Align = alLeft
          BevelOuter = bvNone
          Color = 12477460
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12477460
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object btn_Novo: TSpeedButton
            Left = 0
            Top = 0
            Width = 90
            Height = 34
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Novo'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btn_NovoClick
            ExplicitTop = -9
          end
        end
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 205
          Top = 15
          Width = 90
          Height = 34
          Margins.Top = 15
          Margins.Bottom = 15
          Align = alLeft
          BevelOuter = bvNone
          Color = 12477460
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12477460
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
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
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 99
          Top = 15
          Width = 100
          Height = 34
          Margins.Top = 15
          Margins.Bottom = 15
          Align = alLeft
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
          object btn_Salvar: TSpeedButton
            Left = 0
            Top = 0
            Width = 100
            Height = 34
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Salvar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btn_SalvarClick
            ExplicitTop = -9
          end
        end
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 959
        Top = 16
        Width = 90
        Height = 34
        Margins.Left = 5
        Margins.Top = 15
        Margins.Right = 10
        Margins.Bottom = 15
        Align = alRight
        BevelOuter = bvNone
        Color = 12477460
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12477460
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object btn_Fechar: TSpeedButton
          Left = 0
          Top = 0
          Width = 90
          Height = 34
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Fechar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btn_FecharClick
          ExplicitTop = -9
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1059
        Height = 1
        Align = alTop
        BevelOuter = bvNone
        Color = 15395562
        ParentBackground = False
        TabOrder = 2
      end
      object Edit_TotalGeral: TEdit
        AlignWithMargins = True
        Left = 409
        Top = 21
        Width = 126
        Height = 24
        Margins.Top = 20
        Margins.Bottom = 20
        TabStop = False
        Align = alLeft
        Color = clBtnFace
        Enabled = False
        MaxLength = 999
        ReadOnly = True
        TabOrder = 3
        ExplicitHeight = 25
      end
    end
    object pnl_Client: TPanel
      Left = 0
      Top = 41
      Width = 1059
      Height = 344
      Align = alClient
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Panel_Entradas: TPanel
        Left = 0
        Top = 0
        Width = 1059
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 6
          Width = 89
          Height = 17
          Caption = 'N'#176' Documento:'
        end
        object Label2: TLabel
          Left = 140
          Top = 6
          Width = 42
          Height = 17
          Caption = 'Cliente:'
        end
        object Label3: TLabel
          Left = 299
          Top = 6
          Width = 44
          Height = 17
          Caption = 'Bomba:'
        end
        object Label4: TLabel
          Left = 520
          Top = 6
          Width = 61
          Height = 17
          Caption = 'Qtd Litros:'
        end
        object Label5: TLabel
          Left = 813
          Top = 6
          Width = 31
          Height = 17
          Caption = 'Total:'
        end
        object Label6: TLabel
          Left = 678
          Top = 6
          Width = 63
          Height = 17
          Caption = 'Imposto %'
        end
        object Label7: TLabel
          Left = 598
          Top = 6
          Width = 42
          Height = 17
          Caption = 'Vlr Uni:'
        end
        object ComboBox_Cliente: TComboBox
          Left = 140
          Top = 26
          Width = 145
          Height = 25
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'Thiago Fassina'
          Items.Strings = (
            'Thiago Fassina'
            'Fran Fassina')
        end
        object ComboBox_Bomba: TComboBox
          Left = 299
          Top = 26
          Width = 206
          Height = 25
          Style = csDropDownList
          TabOrder = 1
          OnChange = ComboBox_BombaChange
          Items.Strings = (
            'Bomba 1 tanque Gasolina'
            'Bomba 2 tanque Gasolina'
            'Bomba 1 tanque Diesel'
            'Bomba 2 tanque Diesel')
        end
        object Edit_QtdLitros: TEdit
          Left = 520
          Top = 26
          Width = 67
          Height = 25
          TabOrder = 2
          OnExit = Edit_QtdLitrosExit
          OnKeyPress = Edit_QtdLitrosKeyPress
        end
        object edt_Total: TEdit
          Left = 813
          Top = 26
          Width = 126
          Height = 25
          TabStop = False
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object edt_Documento: TEdit
          Left = 8
          Top = 26
          Width = 121
          Height = 25
          TabStop = False
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object edt_Imposto: TEdit
          Left = 678
          Top = 26
          Width = 121
          Height = 25
          TabStop = False
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 5
          Text = '13'
        end
        object Panel5: TPanel
          AlignWithMargins = True
          Left = 947
          Top = 16
          Width = 90
          Height = 35
          Margins.Left = 5
          Margins.Top = 15
          Margins.Right = 10
          Margins.Bottom = 15
          BevelOuter = bvNone
          Color = 12477460
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6802177
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
          object btn_Lancar: TSpeedButton
            Left = 0
            Top = 0
            Width = 90
            Height = 35
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Lan'#231'ar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btn_LancarClick
            ExplicitLeft = -2
            ExplicitTop = 8
          end
        end
        object edt_VlrUni: TEdit
          Left = 598
          Top = 26
          Width = 67
          Height = 25
          TabStop = False
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object DBGrid_Lancamentos: TDBGrid
        Left = 0
        Top = 65
        Width = 1059
        Height = 279
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Data_Movimento'
            Title.Caption = 'Data'
            Width = 100
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Documento'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cliente'
            Width = 150
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Tanque'
            Width = 80
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Bomba'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Combustivel'
            Width = 120
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Qtd_Litros'
            Title.Caption = 'Qtd Litros'
            Width = 100
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Valor_Uni'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 110
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Imposto'
            Width = 80
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Total'
            Width = 115
            Visible = True
          end>
      end
    end
    object Panel_Top: TPanel
      Left = 0
      Top = 0
      Width = 1059
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lbl_Titulo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 173
        Height = 34
        Align = alLeft
        Caption = 'Lan'#231'ar Abastecimentos'
        Color = 12477460
        Font.Charset = ANSI_CHARSET
        Font.Color = 12477460
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 18
      end
      object pnl_barra: TPanel
        Left = 0
        Top = 40
        Width = 1059
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = 15395562
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
  object FDMemTable: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 216
    Top = 201
    object FDMemTableCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object FDMemTableData_Movimento: TDateField
      FieldName = 'Data_Movimento'
    end
    object FDMemTableCliente: TStringField
      FieldName = 'Cliente'
    end
    object FDMemTableDocumento: TIntegerField
      FieldName = 'Documento'
    end
    object FDMemTableTanque: TIntegerField
      FieldName = 'Tanque'
    end
    object FDMemTableBomba: TIntegerField
      FieldName = 'Bomba'
    end
    object FDMemTableCombustivel: TStringField
      FieldName = 'Combustivel'
    end
    object FDMemTableQtd_Litros: TFloatField
      FieldName = 'Qtd_Litros'
    end
    object FDMemTableValor_Uni: TCurrencyField
      FieldName = 'Valor_Uni'
    end
    object FDMemTableImposto: TFloatField
      FieldName = 'Imposto'
      currency = True
    end
    object FDMemTableTotal: TCurrencyField
      FieldName = 'Total'
    end
    object FDMemTableTotalGeral: TAggregateField
      FieldName = 'TotalGeral'
      ReadOnly = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(Total)'
    end
  end
  object DataSource: TDataSource
    DataSet = FDMemTable
    Left = 304
    Top = 201
  end
end
