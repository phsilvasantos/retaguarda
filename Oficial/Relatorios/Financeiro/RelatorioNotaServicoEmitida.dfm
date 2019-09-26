inherited FormRelatorioNotaServicoEmitidas: TFormRelatorioNotaServicoEmitidas
  Left = 295
  Top = 60
  Caption = 'Relat'#243'rio de Notas de Servi'#231'o Emitidas'
  ClientHeight = 596
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Progresso: TProgressBar
    Top = 580
  end
  inherited ScrollBox: TScrollBox
    Height = 580
    inherited PanelCentro: TPanel
      Left = 182
      Width = 461
      Height = 394
      inherited BtnVisualizar: TSpeedButton
        Top = 356
      end
      inherited EmpresaGroup: TGroupBox
        Left = 0
        Width = 457
      end
      inherited GroupBox1: TGroupBox
        Left = 0
        Top = 160
        Width = 244
      end
      object RadioOrder: TRadioGroup
        Left = 244
        Top = 160
        Width = 213
        Height = 41
        Caption = ' Ordenar Por '
        Columns = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemIndex = 1
        Items.Strings = (
          'Cliente'
          'Emiss'#227'o'
          'Nro NFSe')
        ParentFont = False
        TabOrder = 2
      end
      object GroupFiltro: TGroupBox
        Left = 0
        Top = 203
        Width = 457
        Height = 142
        Caption = ' Filtros '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label5: TLabel
          Left = 9
          Top = 16
          Width = 37
          Height = 13
          Caption = 'Status'
        end
        object Label7: TLabel
          Left = 9
          Top = 54
          Width = 86
          Height = 13
          Caption = 'Tipo de Servi'#231'o'
        end
        object Label8: TLabel
          Left = 9
          Top = 94
          Width = 39
          Height = 13
          Caption = 'Cliente'
        end
        object ComboTipoServico: TRxDBLookupCombo
          Left = 9
          Top = 71
          Width = 443
          Height = 21
          DropDownCount = 8
          LookupField = 'ID_SERVICO'
          LookupDisplay = 'NOME_SERVICO'
          LookupSource = DSSQLTipoServico
          TabOrder = 1
        end
        object ComboCliente: TRxDBLookupCombo
          Left = 9
          Top = 109
          Width = 444
          Height = 21
          DropDownCount = 8
          LookupField = 'CLIEA13ID'
          LookupDisplay = 'CLIEA60RAZAOSOC'
          LookupSource = DSSQLCliente
          TabOrder = 2
        end
        object ComboStatus: TComboBox
          Left = 9
          Top = 30
          Width = 193
          Height = 21
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 0
          Text = 'Encerrada'
          Items.Strings = (
            'Aberta'
            'Encerrada'
            'Cancelada')
        end
        object GroupBox5: TGroupBox
          Left = 204
          Top = 15
          Width = 249
          Height = 40
          Caption = ' Intervalo de Notas Servi'#231'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label10: TLabel
            Left = 126
            Top = 18
            Width = 19
            Height = 13
            Caption = 'at'#233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8404992
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 8
            Top = 18
            Width = 15
            Height = 13
            Caption = '&De'
            FocusControl = De
            Font.Charset = ANSI_CHARSET
            Font.Color = 8404992
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EditNroInicial: TEdit
            Left = 29
            Top = 14
            Width = 90
            Height = 21
            TabOrder = 0
          end
          object EditNroFinal: TEdit
            Left = 154
            Top = 14
            Width = 90
            Height = 21
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited TblTemporaria: TTable
    TableName = 'NotaServico.Db'
    object TblTemporariaID: TIntegerField
      FieldName = 'ID'
    end
    object TblTemporariaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
    end
    object TblTemporariaNUMERO_RPS: TStringField
      FieldName = 'NUMERO_RPS'
    end
    object TblTemporariaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object TblTemporariaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 5
    end
    object TblTemporariaID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
    end
    object TblTemporariaVALOR_SERVICO: TFloatField
      FieldName = 'VALOR_SERVICO'
    end
    object TblTemporariaVALOR_DEDUCAO: TFloatField
      FieldName = 'VALOR_DEDUCAO'
    end
    object TblTemporariaALIQUOTA_ISS: TFloatField
      FieldName = 'ALIQUOTA_ISS'
    end
    object TblTemporariaVALOR_ISS: TFloatField
      FieldName = 'VALOR_ISS'
    end
    object TblTemporariaVALOR_PIS: TFloatField
      FieldName = 'VALOR_PIS'
    end
    object TblTemporariaVALOR_COFINS: TFloatField
      FieldName = 'VALOR_COFINS'
    end
    object TblTemporariaVALOR_INSS: TFloatField
      FieldName = 'VALOR_INSS'
    end
    object TblTemporariaVALOR_IRPJ: TFloatField
      FieldName = 'VALOR_IRPJ'
    end
    object TblTemporariaVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object TblTemporariaVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
    end
    object TblTemporariaVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object TblTemporariaCLIEA60RAZAOSOC: TStringField
      FieldName = 'CLIEA60RAZAOSOC'
      Size = 60
    end
    object TblTemporariaNOME_SERVICO: TStringField
      FieldName = 'NOME_SERVICO'
      Size = 50
    end
    object TblTemporariaEMPRICOD: TIntegerField
      FieldName = 'EMPRICOD'
    end
    object TblTemporariaBASE_CALCULO_ISS: TFloatField
      FieldName = 'BASE_CALCULO_ISS'
    end
  end
  inherited AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler
    Left = 543
  end
  object SQLNotaServico: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      
        'select NFS.ID, NFS.NUMERO_NOTA, NFS.NUMERO_RPS, NFS.DATA_EMISSAO' +
        ', NFS.STATUS, NFS.ID_SERVICO,'
      
        '       NFS.VALOR_SERVICO, NFS.VALOR_DEDUCAO, NFS.ALIQUOTA_ISS, N' +
        'FS.VALOR_ISS, NFS.VALOR_PIS, NFS.VALOR_COFINS,'
      
        '       NFS.VALOR_INSS, NFS.VALOR_IRPJ, NFS.VALOR_TOTAL, NFS.VALO' +
        'R_DESCONTO, NFS.VALOR_FRETE, C.CLIEA60RAZAOSOC,'
      '       S.NOME_SERVICO, NFS.EMPRICOD, NFS.BASE_CALCULO_ISS'
      'from NOTASERVICO NFS'
      'inner join CLIENTE C on C.CLIEA13ID = NFS.CLIEA13ID'
      'inner join SERVICO S on S.ID_SERVICO = NFS.ID_SERVICO'
      'where %EMPRESA and'
      '      (%CAMPODATA between %DATAINICIAL and %DATAFINAL) and'
      '      (%STATUS) and'
      '      (%SERVICO) and'
      '      (%SERIE) and'
      '      (%CLIENTE) and'
      '      (%NROINICIAL) and'
      '      (%NROFINAL)'
      'order by %MORDEM')
    Macros = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'CAMPODATA'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'DATAINICIAL'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'DATAFINAL'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'SERVICO'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'SERIE'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'CLIENTE'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'NROINICIAL'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'NROFINAL'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MORDEM'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 421
    Top = 5
    object SQLNotaServicoID: TIntegerField
      FieldName = 'ID'
    end
    object SQLNotaServicoNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
    end
    object SQLNotaServicoNUMERO_RPS: TStringField
      FieldName = 'NUMERO_RPS'
    end
    object SQLNotaServicoDATA_EMISSAO: TDateTimeField
      FieldName = 'DATA_EMISSAO'
    end
    object SQLNotaServicoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 5
    end
    object SQLNotaServicoID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
    end
    object SQLNotaServicoVALOR_SERVICO: TFloatField
      FieldName = 'VALOR_SERVICO'
    end
    object SQLNotaServicoVALOR_DEDUCAO: TFloatField
      FieldName = 'VALOR_DEDUCAO'
    end
    object SQLNotaServicoALIQUOTA_ISS: TFloatField
      FieldName = 'ALIQUOTA_ISS'
    end
    object SQLNotaServicoVALOR_ISS: TFloatField
      FieldName = 'VALOR_ISS'
    end
    object SQLNotaServicoVALOR_PIS: TFloatField
      FieldName = 'VALOR_PIS'
    end
    object SQLNotaServicoVALOR_COFINS: TFloatField
      FieldName = 'VALOR_COFINS'
    end
    object SQLNotaServicoVALOR_INSS: TFloatField
      FieldName = 'VALOR_INSS'
    end
    object SQLNotaServicoVALOR_IRPJ: TFloatField
      FieldName = 'VALOR_IRPJ'
    end
    object SQLNotaServicoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object SQLNotaServicoVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
    end
    object SQLNotaServicoVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object SQLNotaServicoCLIEA60RAZAOSOC: TStringField
      FieldName = 'CLIEA60RAZAOSOC'
      FixedChar = True
      Size = 60
    end
    object SQLNotaServicoNOME_SERVICO: TStringField
      FieldName = 'NOME_SERVICO'
      Size = 50
    end
    object SQLNotaServicoEMPRICOD: TIntegerField
      FieldName = 'EMPRICOD'
    end
    object SQLNotaServicoBASE_CALCULO_ISS: TFloatField
      FieldName = 'BASE_CALCULO_ISS'
    end
  end
  object DSSQLOperEstoque: TDataSource
    Left = 452
    Top = 5
  end
  object DSSQLCliente: TDataSource
    DataSet = SQLCliente
    Left = 580
    Top = 5
  end
  object SQLCliente: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'Select '
      'CLIEA13ID, CLIEA60RAZAOSOC'
      'From'
      'Cliente'
      ''
      'Order By'
      'CLIEA60RAZAOSOC')
    Macros = <>
    Left = 608
    Top = 5
  end
  object SQLTipoServico: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'select ID_SERVICO, NOME_SERVICO'
      'from SERVICO'
      'order by NOME_SERVICO  ')
    Macros = <>
    Left = 512
    Top = 5
    object SQLTipoServicoID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
      Origin = 'DB.SERVICO.ID_SERVICO'
    end
    object SQLTipoServicoNOME_SERVICO: TStringField
      FieldName = 'NOME_SERVICO'
      Origin = 'DB.SERVICO.NOME_SERVICO'
      Size = 50
    end
  end
  object DSSQLTipoServico: TDataSource
    DataSet = SQLTipoServico
    Left = 484
    Top = 5
  end
  object Report: TCrpe
    About = 'Version and Credits...'
    DesignControls = 'Design-Time Window Controls'
    Version.Major = 0
    Version.Minor = 0
    ReportName = 
      'C:\Desenv\UnitGestao Oficial\Relatorios\Listagem Itens Pedidos d' +
      'e Venda.rpt'
    Margins.Left = -1
    Margins.Right = -1
    Margins.Top = -1
    Margins.Bottom = -1
    DiscardSavedData = True
    PrintDate.Day = 0
    PrintDate.Month = 0
    PrintDate.Year = 0
    Subreports.NLinks = 0
    Subreports.OnDemand = False
    Tables.Number = -1
    SortFields.Number = -1
    GroupSortFields.Number = -1
    GroupCondition.Number = -1
    GroupCondition.GroupType = gtOther
    GroupOptions.Number = -1
    GroupOptions.GroupType = gtOther
    GroupOptions.RepeatGH = cDefault
    GroupOptions.KeepTogether = cDefault
    GroupOptions.TopNOptions = tnDefault
    GroupOptions.TopNGroups = -1
    GroupOptions.TopNDiscardOthers = cDefault
    ParamFields.ParamType = pfString
    ParamFields.ParamSource = psReport
    ParamFields.Info.AllowNull = cDefault
    ParamFields.Info.AllowEditing = cDefault
    ParamFields.Info.AllowMultipleValues = cDefault
    ParamFields.Info.ValueType = vtDiscrete
    ParamFields.Info.PartOfGroup = cDefault
    ParamFields.Info.MutuallyExclusiveGroup = cDefault
    ParamFields.Info.GroupNum = -1
    ParamFields.ValueLimit = cDefault
    ParamFields.Ranges.Number = -1
    ParamFields.Ranges.RangeBounds = IncludeStartAndEnd
    ParamFields.PLDescriptionOnly = cDefault
    ParamFields.PLSortMethod = psmDefaultSort
    ParamFields.PLSortByDescription = cDefault
    SectionFormat.BackgroundColor = clNone
    SectionHeight.Height = 0
    SQL.Params.ParamType = spChar
    LogOnInfo.Table = -1
    SessionInfo.Table = -1
    SessionInfo.Propagate = True
    Export.Excel.Constant = 9.000000000000000000
    Export.Excel.Area = 'D'
    Export.CharSepQuote = ' '
    WindowZoom.Magnification = -1
    WindowState = wsMaximized
    WindowButtonBar.CloseBtn = True
    WindowButtonBar.PrintSetupBtn = True
    WindowButtonBar.SearchBtn = True
    WindowCursor.GroupArea = wcDefault
    WindowCursor.GroupAreaField = wcDefault
    WindowCursor.DetailArea = wcDefault
    WindowCursor.DetailAreaField = wcDefault
    WindowCursor.Graph = wcDefault
    GraphType.Number = -1
    GraphType.Style = barSideBySide
    GraphText.Number = -1
    GraphText.TitleFont.Charset = DEFAULT_CHARSET
    GraphText.TitleFont.Color = clWindowText
    GraphText.TitleFont.Height = -11
    GraphText.TitleFont.Name = 'MS Sans Serif'
    GraphText.TitleFont.Style = []
    GraphText.SubTitleFont.Charset = DEFAULT_CHARSET
    GraphText.SubTitleFont.Color = clWindowText
    GraphText.SubTitleFont.Height = -11
    GraphText.SubTitleFont.Name = 'MS Sans Serif'
    GraphText.SubTitleFont.Style = []
    GraphText.FootNoteFont.Charset = DEFAULT_CHARSET
    GraphText.FootNoteFont.Color = clWindowText
    GraphText.FootNoteFont.Height = -11
    GraphText.FootNoteFont.Name = 'MS Sans Serif'
    GraphText.FootNoteFont.Style = []
    GraphText.GroupsTitleFont.Charset = DEFAULT_CHARSET
    GraphText.GroupsTitleFont.Color = clWindowText
    GraphText.GroupsTitleFont.Height = -11
    GraphText.GroupsTitleFont.Name = 'MS Sans Serif'
    GraphText.GroupsTitleFont.Style = []
    GraphText.DataTitleFont.Charset = DEFAULT_CHARSET
    GraphText.DataTitleFont.Color = clWindowText
    GraphText.DataTitleFont.Height = -11
    GraphText.DataTitleFont.Name = 'MS Sans Serif'
    GraphText.DataTitleFont.Style = []
    GraphText.LegendFont.Charset = DEFAULT_CHARSET
    GraphText.LegendFont.Color = clWindowText
    GraphText.LegendFont.Height = -11
    GraphText.LegendFont.Name = 'MS Sans Serif'
    GraphText.LegendFont.Style = []
    GraphText.GroupLabelsFont.Charset = DEFAULT_CHARSET
    GraphText.GroupLabelsFont.Color = clWindowText
    GraphText.GroupLabelsFont.Height = -11
    GraphText.GroupLabelsFont.Name = 'MS Sans Serif'
    GraphText.GroupLabelsFont.Style = []
    GraphText.DataLabelsFont.Charset = DEFAULT_CHARSET
    GraphText.DataLabelsFont.Color = clWindowText
    GraphText.DataLabelsFont.Height = -11
    GraphText.DataLabelsFont.Name = 'MS Sans Serif'
    GraphText.DataLabelsFont.Style = []
    GraphOptions.Number = -1
    GraphOptions.Max = -1.000000000000000000
    GraphOptions.Min = -1.000000000000000000
    GraphOptions.DataValues = cDefault
    GraphOptions.GridLines = cDefault
    GraphOptions.Legend = cDefault
    GraphOptions.BarDirection = bdDefault
    GraphOptionInfo.Number = -1
    GraphOptionInfo.Color = gcDefault
    GraphOptionInfo.Legend = glDefault
    GraphOptionInfo.PieSize = gpsDefault
    GraphOptionInfo.PieSlice = gslDefault
    GraphOptionInfo.BarSize = gbsDefault
    GraphOptionInfo.BarDirection = bdDefault
    GraphOptionInfo.MarkerSize = gmsDefault
    GraphOptionInfo.MarkerShape = gshDefault
    GraphOptionInfo.DataPoints = gdpDefault
    GraphOptionInfo.NumberFormat = gnfDefault
    GraphOptionInfo.ViewingAngle = gvaDefault
    GraphData.Number = -1
    GraphData.RowGroupN = -1
    GraphData.ColGroupN = -1
    GraphData.SummarizedFieldN = -1
    GraphData.Direction = Unknown
    GraphAxis.Number = -1
    GraphAxis.GridLineX = gglDefault
    GraphAxis.GridLineY = gglDefault
    GraphAxis.GridLineY2 = gglDefault
    GraphAxis.GridLineZ = gglDefault
    GraphAxis.DataValuesY = gdvDefault
    GraphAxis.DataValuesY2 = gdvDefault
    GraphAxis.DataValuesZ = gdvDefault
    GraphAxis.NumberFormatY = gnfDefault
    GraphAxis.NumberFormatY2 = gnfDefault
    GraphAxis.NumberFormatZ = gnfDefault
    GraphAxis.DivisionTypeY = gdvDefault
    GraphAxis.DivisionTypeY2 = gdvDefault
    GraphAxis.DivisionTypeZ = gdvDefault
    GraphAxis.DivisionsY = 0
    GraphAxis.DivisionsY2 = 0
    GraphAxis.DivisionsZ = 0
    Left = 242
    Top = 5
  end
end
