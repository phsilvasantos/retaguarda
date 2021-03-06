inherited FormRelatorioRepresentanteNSerie: TFormRelatorioRepresentanteNSerie
  Left = 229
  Top = 106
  Caption = 'Relat�rio N�mero de S�rie por Representante'
  ClientHeight = 506
  ClientWidth = 827
  PixelsPerInch = 96
  TextHeight = 13
  inherited Progresso: TProgressBar
    Top = 490
    Width = 827
  end
  inherited ScrollBox: TScrollBox
    Width = 827
    Height = 490
    inherited PanelCentro: TPanel
      Height = 363
      inherited BtnVisualizar: TSpeedButton
        Top = 318
      end
      object GroupBox4: TGroupBox
        Left = 12
        Top = 205
        Width = 407
        Height = 40
        Caption = 'Representante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object ComboRepresentante: TRxDBLookupCombo
          Left = 6
          Top = 14
          Width = 391
          Height = 21
          DropDownCount = 8
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LookupField = 'REPRICOD'
          LookupDisplay = 'REPRA60RAZAOSOC'
          LookupSource = DSSQLRepresentante
          ParentFont = False
          TabOrder = 0
        end
      end
      object GroupProduto: TGroupBox
        Left = 12
        Top = 245
        Width = 407
        Height = 40
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object ComboProduto: TRxDBLookupCombo
          Left = 6
          Top = 14
          Width = 391
          Height = 21
          DropDownCount = 8
          DisplayAllFields = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LookupField = 'PRODICOD'
          LookupDisplay = 'PRODICOD;PRODA60DESCR'
          LookupDisplayIndex = 1
          LookupSource = DSSQLProduto
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    inherited ScrollBoxTopo: TScrollBox
      Width = 823
      inherited PanelCabecalho: TPanel
        Width = 823
        inherited PanelNavigator: TPanel
          Width = 823
          inherited AdvPanelNavigator: TAdvOfficeStatusBar
            Width = 823
          end
        end
      end
    end
  end
  inherited TblTemporaria: TTable
    TableName = 'RepresNSerie.db'
    object TblTemporariaREPRICOD: TIntegerField
      FieldName = 'REPRICOD'
    end
    object TblTemporariaREPRA60RAZAOSOC: TStringField
      FieldName = 'REPRA60RAZAOSOC'
      Size = 60
    end
    object TblTemporariaPRODICOD: TIntegerField
      FieldName = 'PRODICOD'
    end
    object TblTemporariaPRODA60DESCR: TStringField
      FieldName = 'PRODA60DESCR'
      Size = 60
    end
    object TblTemporariaPRSEA60NROSERIE: TStringField
      FieldName = 'PRSEA60NROSERIE'
      Size = 60
    end
    object TblTemporariaDATA_REGISTRO: TDateField
      FieldName = 'DATA_REGISTRO'
    end
  end
  object SQLRepresNSerie: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      
        'select PR.REPRICOD, R.REPRA60RAZAOSOC, PR.PRODICOD, P.PRODA60DES' +
        'CR, PR.PRSEA60NROSERIE, PR.DATA_REGISTRO'
      'from PRODUTOREPRESENTANTE PR'
      
        'left join PRODUTOSERIE PS on PR.PRSEA60NROSERIE = PS.PRSEA60NROS' +
        'ERIE'
      'left join REPRESENTANTE R on PR.REPRICOD = R.REPRICOD'
      'left join PRODUTO P on PR.PRODICOD = P.PRODICOD'
      'where PS.PRSECSTATUS = ''U'' and'
      '      %MEMPRESA AND'
      '      %MREPRESENTANTE and'
      '      %MDATA and'
      '      %MPRODUTO'
      'order by PR.REPRICOD, P.PRODICOD, PS.PRSEA60NROSERIE  ')
    Macros = <
      item
        DataType = ftString
        Name = 'MEMPRESA'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MREPRESENTANTE'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MDATA'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MPRODUTO'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 250
    Top = 5
    object SQLRepresNSerieREPRICOD: TIntegerField
      FieldName = 'REPRICOD'
    end
    object SQLRepresNSerieREPRA60RAZAOSOC: TStringField
      FieldName = 'REPRA60RAZAOSOC'
      FixedChar = True
      Size = 60
    end
    object SQLRepresNSeriePRODICOD: TIntegerField
      FieldName = 'PRODICOD'
    end
    object SQLRepresNSeriePRODA60DESCR: TStringField
      FieldName = 'PRODA60DESCR'
      FixedChar = True
      Size = 60
    end
    object SQLRepresNSeriePRSEA60NROSERIE: TStringField
      FieldName = 'PRSEA60NROSERIE'
      FixedChar = True
      Size = 60
    end
    object SQLRepresNSerieDATA_REGISTRO: TDateTimeField
      FieldName = 'DATA_REGISTRO'
    end
  end
  object DSSQLProduto: TDataSource
    DataSet = SQLProduto
    Left = 507
    Top = 5
  end
  object SQLProduto: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'Select PRODICOD, PRODA60REFER, PRODA60DESCR from PRODUTO'
      'Order by PRODA60DESCR')
    Macros = <>
    Left = 479
    Top = 5
  end
  object SQLRepresentante: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      
        'Select REPRICOD, REPRA60RAZAOSOC, REPRA60NOMEFANT from REPRESENT' +
        'ANTE'
      'Order by REPRICOD')
    Macros = <>
    Left = 543
    Top = 5
    object SQLRepresentanteREPRICOD: TIntegerField
      FieldName = 'REPRICOD'
      Origin = 'DB.REPRESENTANTE.REPRICOD'
    end
    object SQLRepresentanteREPRA60RAZAOSOC: TStringField
      FieldName = 'REPRA60RAZAOSOC'
      Origin = 'DB.REPRESENTANTE.REPRA60RAZAOSOC'
      FixedChar = True
      Size = 60
    end
    object SQLRepresentanteREPRA60NOMEFANT: TStringField
      FieldName = 'REPRA60NOMEFANT'
      Origin = 'DB.REPRESENTANTE.REPRA60NOMEFANT'
      FixedChar = True
      Size = 60
    end
  end
  object DSSQLRepresentante: TDataSource
    DataSet = SQLRepresentante
    Left = 571
    Top = 5
  end
  object Report: TCrpe
    About = 'Version and Credits...'
    DesignControls = 'Design-Time Window Controls'
    Version.Major = 0
    Version.Minor = 0
    ReportName = 'C:\Desenv\GestaoOficial\Relatorios\Produtos Vendidos.rpt'
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
    Formulas.Formula.Strings = (
      '"Empresa"')
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
    Left = 192
    Top = 5
  end
end
