inherited FormRelatorioMotoboy: TFormRelatorioMotoboy
  Left = 281
  Top = 110
  Caption = 'Relat'#243'rio Motoboy'
  ClientHeight = 498
  ClientWidth = 808
  PixelsPerInch = 96
  TextHeight = 13
  inherited Progresso: TProgressBar
    Top = 482
    Width = 808
  end
  inherited ScrollBox: TScrollBox
    Width = 808
    Height = 482
    inherited PanelCentro: TPanel
      Height = 314
      inherited BtnVisualizar: TSpeedButton
        Top = 288
      end
      inherited GroupBox1: TGroupBox
        Top = 160
      end
      object GroupBox3: TGroupBox
        Left = 12
        Top = 202
        Width = 407
        Height = 40
        Caption = 'Motoboy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object ComboMotoboy: TRxDBLookupCombo
          Left = 8
          Top = 14
          Width = 393
          Height = 21
          DropDownCount = 8
          DisplayEmpty = 'Todos...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LookupField = 'MTBYICOD'
          LookupDisplay = 'MTBYA30DESCR'
          LookupSource = DSSQLMotoboy
          ParentFont = False
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 12
        Top = 243
        Width = 407
        Height = 40
        Caption = 'Cidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object ComboCidade: TRxDBLookupCombo
          Left = 8
          Top = 14
          Width = 393
          Height = 21
          DropDownCount = 8
          DisplayEmpty = 'Todos...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = DSSQLCidade
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    inherited ScrollBoxTopo: TScrollBox
      Width = 804
      inherited PanelCabecalho: TPanel
        Width = 804
        inherited PanelNavigator: TPanel
          Width = 804
          inherited AdvPanelNavigator: TAdvOfficeStatusBar
            Width = 804
          end
        end
      end
    end
  end
  inherited TblTemporaria: TTable
    TableName = 'RelMotoboy.db'
    object TblTemporariaCLIEA60RAZAOSOC: TStringField
      DisplayWidth = 60
      FieldName = 'CLIEA60RAZAOSOC'
      Size = 60
    end
    object TblTemporariaMTBYA30DESCR: TStringField
      DisplayWidth = 60
      FieldName = 'MTBYA30DESCR'
      Size = 60
    end
    object TblTemporariaCUPODEMIS: TDateField
      FieldName = 'CUPODEMIS'
    end
    object TblTemporariaVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object TblTemporariaCLIEA60CIDRES: TStringField
      FieldName = 'CLIEA60CIDRES'
      Size = 60
    end
    object TblTemporariaCLIEA60BAIRES: TStringField
      FieldName = 'CLIEA60BAIRES'
      Size = 60
    end
  end
  object SQLMotoboy: TQuery
    OnCalcFields = SQLEmpresaCalcFields
    DatabaseName = 'DB'
    SQL.Strings = (
      'select * from MOTOBOY'
      'order by MTBYA30DESCR')
    Left = 478
    Top = 5
    object SQLMotoboyMTBYICOD: TIntegerField
      FieldName = 'MTBYICOD'
      Origin = 'DB.MOTOBOY.MTBYICOD'
    end
    object SQLMotoboyMTBYA30DESCR: TStringField
      FieldName = 'MTBYA30DESCR'
      Origin = 'DB.MOTOBOY.MTBYA30DESCR'
      FixedChar = True
      Size = 30
    end
  end
  object SQLCidade: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'select *'
      'from CIDADE'
      'where %MCIDADE')
    Macros = <
      item
        DataType = ftString
        Name = 'MCIDADE'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 544
    Top = 5
    object SQLCidadeID: TStringField
      FieldName = 'ID'
      Origin = 'DB.CIDADE.ID'
      Size = 10
    end
    object SQLCidadeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'DB.CIDADE.NOME'
      Size = 30
    end
    object SQLCidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'DB.CIDADE.SIGLA'
      Size = 2
    end
  end
  object DSSQLCidade: TDataSource
    DataSet = SQLCidade
    Left = 572
    Top = 5
  end
  object DSSQLMotoboy: TDataSource
    DataSet = SQLMotoboy
    Left = 506
    Top = 5
  end
  object SQLVendas: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'select CL.CLIEA60RAZAOSOC, MB.MTBYA30DESCR, CF.CUPODEMIS,'
      
        '       (CF.CUPON2TOTITENS - coalesce(CF.CUPON2DESC, 0) - coalesc' +
        'e(CF.CUPON2DESCITENS, 0)) VALOR_TOTAL, CL.CLIEA60CIDRES,'
      '       CL.CLIEA60BAIRES'
      'from CUPOM CF'
      'left join CLIENTE CL on CL.CLIEA13ID = CF.CLIEA13ID'
      'left join MOTOBOY MB on MB.MTBYICOD = CF.MTBYICOD'
      'where CF.MTBYICOD > 0 and'
      '      CF.CUPOCSTATUS <> '#39'C'#39' and'
      '      (%MEMPRESA) and'
      '      (%MDATA) and'
      '      (%MMOTOBOY) and'
      '      (%MCIDADE)')
    Macros = <
      item
        DataType = ftString
        Name = 'MEMPRESA'
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
        Name = 'MMOTOBOY'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MCIDADE'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 248
    Top = 5
    object SQLVendasCLIEA60RAZAOSOC: TStringField
      FieldName = 'CLIEA60RAZAOSOC'
      FixedChar = True
      Size = 60
    end
    object SQLVendasMTBYA30DESCR: TStringField
      FieldName = 'MTBYA30DESCR'
      FixedChar = True
      Size = 30
    end
    object SQLVendasCUPODEMIS: TDateTimeField
      FieldName = 'CUPODEMIS'
    end
    object SQLVendasVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object SQLVendasCLIEA60CIDRES: TStringField
      FieldName = 'CLIEA60CIDRES'
      FixedChar = True
      Size = 60
    end
    object SQLVendasCLIEA60BAIRES: TStringField
      FieldName = 'CLIEA60BAIRES'
      FixedChar = True
      Size = 60
    end
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
