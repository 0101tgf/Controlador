object frmRelAbastecimentos: TfrmRelAbastecimentos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios de Abastecimentos'
  ClientHeight = 597
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = -5
    Top = 0
    Width = 794
    Height = 1123
    DataSource = frmFiltroRelAbastecimento.DataSource_RelatorioAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand_Cab: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 15
        Width = 382
        Height = 22
        Caption = 'Relat'#243'rio de abastecimentos por per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 42
        Width = 718
        Height = 17
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object RLBand_Rodape: TRLBand
      Left = 38
      Top = 183
      Width = 718
      Height = 40
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 21
        Width = 68
        Height = 17
        Info = itFullDate
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 617
        Top = 17
        Width = 48
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 582
        Top = 17
        Width = 100
        Height = 17
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 685
        Top = 17
        Width = 8
        Height = 16
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 587
        Top = 17
        Width = 128
        Height = 17
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
    end
    object RLBand_Detail: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 31
      object RLDBText1: TRLDBText
        Left = 5
        Top = 6
        Width = 114
        Height = 17
        Alignment = taCenter
        DataField = 'Data_Movimento'
        DataSource = frmFiltroRelAbastecimento.DataSource_RelatorioAbastecimento
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 130
        Top = 6
        Width = 54
        Height = 17
        Alignment = taCenter
        DataField = 'Tanque'
        DataSource = frmFiltroRelAbastecimento.DataSource_RelatorioAbastecimento
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 194
        Top = 6
        Width = 86
        Height = 17
        Alignment = taCenter
        DataField = 'Combustivel'
        DataSource = frmFiltroRelAbastecimento.DataSource_RelatorioAbastecimento
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 296
        Top = 6
        Width = 52
        Height = 17
        Alignment = taCenter
        DataField = 'Bomba'
        DataSource = frmFiltroRelAbastecimento.DataSource_RelatorioAbastecimento
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 360
        Top = 6
        Width = 65
        Height = 17
        Alignment = taCenter
        DataField = 'Total'
        DataSource = frmFiltroRelAbastecimento.DataSource_RelatorioAbastecimento
        Text = ''
      end
    end
    object RLBand_CHeader: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object RLLabel4: TRLLabel
        Left = 5
        Top = 6
        Width = 115
        Height = 18
        Alignment = taCenter
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 126
        Top = 6
        Width = 58
        Height = 18
        Alignment = taCenter
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 190
        Top = 6
        Width = 95
        Height = 18
        Alignment = taCenter
        Caption = 'Combustivel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 294
        Top = 6
        Width = 54
        Height = 18
        Alignment = taCenter
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 360
        Top = 6
        Width = 65
        Height = 18
        Alignment = taCenter
        Caption = 'Total R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand_CFoo: TRLBand
      Left = 38
      Top = 152
      Width = 718
      Height = 31
      BandType = btSummary
      object RLLabel9: TRLLabel
        Left = 3
        Top = 12
        Width = 110
        Height = 18
        Alignment = taCenter
        Caption = 'Total Geral R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult1: TRLDBResult
        Left = 110
        Top = 12
        Width = 81
        Height = 17
        DataField = 'Total'
        DataSource = frmFiltroRelAbastecimento.DataSource_RelatorioAbastecimento
        Info = riSum
        Text = ''
      end
    end
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 576
    Top = 37
  end
  object RLXLSFilter: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 649
    Top = 38
  end
end
