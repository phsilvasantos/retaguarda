object FormCadastroProdutoRapidoTodos: TFormCadastroProdutoRapidoTodos
  Left = 338
  Top = 168
  Width = 585
  Height = 318
  Caption = 'Cadastro R'#225'pido de Produtos'
  Color = 16249066
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 12
    Top = 133
    Width = 124
    Height = 13
    Caption = 'Unidade Venda Varejo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label34: TLabel
    Left = 286
    Top = 133
    Width = 151
    Height = 13
    Caption = 'Al'#237'quota do ICMS de Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 15
    Top = 96
    Width = 44
    Height = 13
    Caption = 'Cole'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 285
    Top = 96
    Width = 129
    Height = 13
    Caption = 'Grupo / Departamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbMarcaAdd: TLabel
    Left = 260
    Top = 106
    Width = 16
    Height = 29
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = lbMarcaAddClick
  end
  object lbGrupoAdd: TLabel
    Left = 525
    Top = 105
    Width = 16
    Height = 29
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = lbGrupoAddClick
  end
  object lbl2: TLabel
    Left = 12
    Top = 174
    Width = 100
    Height = 13
    Caption = '% Margem Lucro '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ScrollBoxTopo: TScrollBox
    Left = 0
    Top = 0
    Width = 569
    Height = 80
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBlack
    ParentColor = False
    TabOrder = 0
    object PanelCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 569
      Height = 80
      Align = alTop
      BevelOuter = bvNone
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LabelTitulo: TLabel
        Left = 2
        Top = 3
        Width = 303
        Height = 26
        Caption = 'Cadastro R'#225'pido de Produtos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PanelNavigator: TPanel
        Left = 0
        Top = 48
        Width = 569
        Height = 32
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object AdvPanelNavigator: TAdvOfficeStatusBar
          Left = 0
          Top = 0
          Width = 569
          Height = 32
          AnchorHint = False
          Align = alClient
          Panels = <
            item
              AppearanceStyle = psLight
              DateFormat = 'mm/dd/yyyy'
              Progress.BackGround = clNone
              Progress.Indication = piPercentage
              Progress.Min = 0
              Progress.Max = 100
              Progress.Position = 0
              Progress.Level0Color = clLime
              Progress.Level0ColorTo = 14811105
              Progress.Level1Color = clYellow
              Progress.Level1ColorTo = 13303807
              Progress.Level2Color = 5483007
              Progress.Level2ColorTo = 11064319
              Progress.Level3Color = clRed
              Progress.Level3ColorTo = 13290239
              Progress.Level1Perc = 70
              Progress.Level2Perc = 90
              Progress.BorderColor = clBlack
              Progress.ShowBorder = False
              Progress.Stacked = False
              TimeFormat = 'hh:mm:ss'
              Width = 50
            end>
          SimplePanel = False
          SizeGrip = False
          URLColor = clBlue
          Styler = AdvOfficeStatusBarOfficeStyler1
          Version = '1.3.0.2'
          object BtnFecharTela: TSpeedButton
            Tag = 3
            Left = 421
            Top = 4
            Width = 76
            Height = 25
            Cursor = crHandPoint
            Hint = 'Fechar Tela'
            Caption = '&Fechar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              76060000424D7606000000000000360400002800000018000000180000000100
              08000000000040020000130B0000130B0000000100000001000000000000DCE4
              E4007975BE00817DC6002D2D2D004F4D8A005B579E005F5EA7006866AF00716D
              B6008986CD0008080800FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000B
              0B0B0B0B0B0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0001010000000000000C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0001010101000000000C0C0C0C0C0C0C0C0C0C0C
              0C0C00000001010101010100000C0C0C0C0C0C0C0C0C0C0C0C0C000200010101
              01010100000C0C0C0C0C0C0C0C000000000000020300010101010100000C0C0C
              0C0C0C0C0C00050607080902030A000101010100000C0C0C0C0C0C0C0C000506
              07080902030A000100040100000C0C0C0C0C0C0C0C0000000000000203000101
              04000100000C0C0C0C0C0C0C0C0C0C0C0C0C00020001010101010100000C0C0C
              0C0C0C0C0C0C0C0C0C0C00000001010101010100000C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0001010101010100000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00010101
              01010100000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C}
            ParentFont = False
            OnClick = BtnFecharTelaClick
          end
          object LabelGravar: TSpeedButton
            Tag = 3
            Left = 14
            Top = 4
            Width = 79
            Height = 25
            Cursor = crHandPoint
            Caption = 'Gravar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              C2040000424DC204000000000000420000002800000018000000180000000100
              1000030000008004000000000000000000000000000000000000007C0000E003
              00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7F00000911742E4B199B6F524200000000FF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00006C19742E742E7B6BBD77D652
              7B6B313EA4100000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7F0000D746742E4B19DD77A50C95367B6F9C73D65A6B2100000000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000112EB63A742E185FDE7B2A197B6B
              9C739B6F7B6F313E742EA50C00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              0000D746742E742E4B193967DD77DD77BC739C73D6520911742E081185080000
              FF7FFF7FFF7FFF7FFF7FFF7FFF7F00008D21B63ABD73BD73742E742E0811B552
              BD779C730821742E4B19742EE7140000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
              184FBD73DE7B304ADE77BD73742E742E0811E7146C19742E4B19742E0000FF7F
              FF7FFF7FFF7FFF7FFF7FFF7F00008D21B63ADD77DE7B304A00000000DE77BD73
              742E742E4B194B19742EE7140000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001853
              BD73DE7B304ADE7BCD626339000000009B6FBD73742E742E742E0000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7F0000EF31D746DD77DE7B304ADE7BDE7B0000EC6AE845
              0000DE7BBD73742EE7140000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000D7463957
              7C6BDE7BDE7B304ADE7BDE7B0000EC6AE8450000BD73742E0000FF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7F00000000B63A39575B63DE7BDE7BDE7BDE7B0000
              EC6AE8450000A50C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              000000005B6318535B63DE7BDE7BDE7B0000EC6AE8450000FF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000005B6318535B63DE7B
              DD770000EC6AE8450000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7F000000005B631853BD73742E0000EC6AE8450000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
              742EE71400000000EC6AE8450000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F0000EC6AE8450000
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7F0000EC6A0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7F}
            Margin = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Spacing = 1
            OnClick = LabelGravarClick
          end
        end
      end
    end
  end
  object ComboUnidade: TRxDBLookupCombo
    Left = 12
    Top = 146
    Width = 245
    Height = 21
    DropDownCount = 8
    DisplayAllFields = True
    DisplayEmpty = '...'
    LookupField = 'UNIDICOD'
    LookupDisplay = 'UNIDA15DESCR'
    LookupSource = DSSQLUnidade
    TabOrder = 3
  end
  object ComboICMS: TRxDBLookupCombo
    Left = 282
    Top = 146
    Width = 239
    Height = 21
    DropDownCount = 8
    DisplayEmpty = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookupField = 'ICMSICOD'
    LookupDisplay = 'ICMSA60DESCR'
    LookupSource = DSSQLIcms
    ParentFont = False
    TabOrder = 4
  end
  object ComboColecao: TRxDBLookupCombo
    Left = 12
    Top = 109
    Width = 245
    Height = 21
    DropDownCount = 8
    DisplayEmpty = '...'
    LookupField = 'COLEICOD'
    LookupDisplay = 'COLEA60DESCR'
    LookupSource = DSSQLColecao
    TabOrder = 1
    OnKeyDown = ComboColecaoKeyDown
  end
  object ComboGrupo: TRxDBLookupCombo
    Left = 282
    Top = 109
    Width = 239
    Height = 21
    DropDownCount = 8
    DisplayEmpty = '...'
    LookupField = 'GRUPICOD'
    LookupDisplay = 'GRUPA60DESCR'
    LookupSource = DSSQLGrupo
    TabOrder = 2
    OnKeyDown = ComboGrupoKeyDown
  end
  object editFixaVarejo: TAdvEdit
    Left = 12
    Top = 189
    Width = 101
    Height = 21
    EditAlign = eaRight
    EditType = etFloat
    Precision = 2
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    Enabled = True
    TabOrder = 6
    Text = '0,00'
    Visible = True
    Version = '2.8.6.1'
  end
  object AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler
    BorderColor = 14986888
    PanelAppearanceLight.BorderColor = 14922381
    PanelAppearanceLight.BorderColorHot = clGray
    PanelAppearanceLight.BorderColorDown = 10240783
    PanelAppearanceLight.Color = 16440774
    PanelAppearanceLight.ColorTo = 14854530
    PanelAppearanceLight.ColorHot = 13958143
    PanelAppearanceLight.ColorHotTo = 6538487
    PanelAppearanceLight.ColorDown = 9232890
    PanelAppearanceLight.ColorDownTo = 1940207
    PanelAppearanceLight.ColorMirror = 14854530
    PanelAppearanceLight.ColorMirrorTo = 14854530
    PanelAppearanceLight.ColorMirrorHot = 6538487
    PanelAppearanceLight.ColorMirrorHotTo = 6538487
    PanelAppearanceLight.ColorMirrorDown = 1940207
    PanelAppearanceLight.ColorMirrorDownTo = 1940207
    PanelAppearanceLight.TextColor = clBlack
    PanelAppearanceLight.TextColorHot = clBlack
    PanelAppearanceLight.TextColorDown = clBlack
    PanelAppearanceLight.TextStyle = []
    PanelAppearanceDark.BorderColor = clNone
    PanelAppearanceDark.BorderColorHot = clGray
    PanelAppearanceDark.BorderColorDown = 10240783
    PanelAppearanceDark.Color = 14986888
    PanelAppearanceDark.ColorTo = 14986888
    PanelAppearanceDark.ColorHot = 13958143
    PanelAppearanceDark.ColorHotTo = 6538487
    PanelAppearanceDark.ColorDown = 9232890
    PanelAppearanceDark.ColorDownTo = 1940207
    PanelAppearanceDark.ColorMirror = 14986888
    PanelAppearanceDark.ColorMirrorTo = 14986888
    PanelAppearanceDark.ColorMirrorHot = 6538487
    PanelAppearanceDark.ColorMirrorHotTo = 6538487
    PanelAppearanceDark.ColorMirrorDown = 1940207
    PanelAppearanceDark.ColorMirrorDownTo = 1940207
    PanelAppearanceDark.TextColor = clWhite
    PanelAppearanceDark.TextColorHot = clWhite
    PanelAppearanceDark.TextColorDown = clWhite
    PanelAppearanceDark.TextStyle = []
    Left = 412
    Top = 1
  end
  object DSTemplate: TDataSource
    AutoEdit = False
    DataSet = SQLTemplate
    Left = 365
    Top = 1
  end
  object SQLTemplate: TRxQuery
    Tag = 1
    DatabaseName = 'DB'
    RequestLive = True
    SQL.Strings = (
      'Select * From '
      '  PRODUTO '
      'Where '
      '  PRODICOD is null')
    Macros = <>
    Left = 336
    Top = 1
    object SQLTemplatePRODICOD: TIntegerField
      Tag = 1
      FieldName = 'PRODICOD'
      Origin = 'DB.PRODUTO.PRODICOD'
      Visible = False
    end
    object SQLTemplatePRODIAGRUPGRADE: TIntegerField
      DisplayLabel = 'Cod.Agrupamento'
      FieldName = 'PRODIAGRUPGRADE'
      Origin = 'DB.PRODUTO.PRODIAGRUPGRADE'
    end
    object SQLTemplatePRODA30ADESCRREDUZ: TStringField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Descri'#231#227'o Reduzida'
      FieldName = 'PRODA30ADESCRREDUZ'
      Origin = 'DB.PRODUTO.PRODA30ADESCRREDUZ'
      FixedChar = True
      Size = 30
    end
    object SQLTemplateGRADICOD: TIntegerField
      DisplayLabel = 'Cod.Grade'
      FieldName = 'GRADICOD'
      Origin = 'DB.PRODUTO.GRADICOD'
    end
    object SQLTemplateGRTMICOD: TIntegerField
      FieldName = 'GRTMICOD'
      Origin = 'DB.PRODUTO.GRTMICOD'
    end
    object SQLTemplateCORICOD: TIntegerField
      DisplayLabel = 'Cod.Cor'
      FieldName = 'CORICOD'
      Origin = 'DB.PRODUTO.CORICOD'
    end
    object SQLTemplateICMSICOD: TIntegerField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Cod.Icms'
      FieldName = 'ICMSICOD'
      Origin = 'DB.PRODUTO.ICMSICOD'
    end
    object SQLTemplateCLFSICOD: TIntegerField
      FieldName = 'CLFSICOD'
      Origin = 'DB.PRODUTO.CLFSICOD'
    end
    object SQLTemplateUNIDICOD: TIntegerField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Cod.UN'
      FieldName = 'UNIDICOD'
      Origin = 'DB.PRODUTO.UNIDICOD'
    end
    object SQLTemplateMARCICOD: TIntegerField
      DisplayLabel = 'Cod.Marca'
      FieldName = 'MARCICOD'
      Origin = 'DB.PRODUTO.MARCICOD'
    end
    object SQLTemplateGRUPICOD: TIntegerField
      DisplayLabel = 'Cod.Grupo'
      FieldName = 'GRUPICOD'
      Origin = 'DB.PRODUTO.GRUPICOD'
    end
    object SQLTemplateSUBGICOD: TIntegerField
      FieldName = 'SUBGICOD'
      Origin = 'DB.PRODUTO.SUBGICOD'
    end
    object SQLTemplateVARIICOD: TIntegerField
      FieldName = 'VARIICOD'
      Origin = 'DB.PRODUTO.VARIICOD'
    end
    object SQLTemplatePRODICODPAI: TIntegerField
      FieldName = 'PRODICODPAI'
      Origin = 'DB.PRODUTO.PRODICODPAI'
    end
    object SQLTemplatePRODCTIPOBAIXA: TStringField
      FieldName = 'PRODCTIPOBAIXA'
      Origin = 'DB.PRODUTO.PRODCTIPOBAIXA'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODA60CODBAR: TStringField
      DisplayLabel = 'Cod.Barras'
      DisplayWidth = 30
      FieldName = 'PRODA60CODBAR'
      Origin = 'DB.PRODUTO.PRODA60CODBAR'
      FixedChar = True
      Size = 30
    end
    object SQLTemplatePRODA60REFER: TStringField
      DisplayLabel = 'Ref.Fabrica'
      FieldName = 'PRODA60REFER'
      Origin = 'DB.PRODUTO.PRODA60REFER'
      FixedChar = True
      Size = 60
    end
    object SQLTemplatePRODICODBALANCA: TIntegerField
      DisplayLabel = 'Cod.Balan'#231'a'
      FieldName = 'PRODICODBALANCA'
      Origin = 'DB.PRODUTO.PRODICODBALANCA'
    end
    object SQLTemplatePRODA15APAVIM: TStringField
      FieldName = 'PRODA15APAVIM'
      Origin = 'DB.PRODUTO.PRODA15APAVIM'
      FixedChar = True
      Size = 15
    end
    object SQLTemplatePRODA15RUA: TStringField
      FieldName = 'PRODA15RUA'
      Origin = 'DB.PRODUTO.PRODA15RUA'
      FixedChar = True
      Size = 15
    end
    object SQLTemplatePRODA15PRATEL: TStringField
      FieldName = 'PRODA15PRATEL'
      Origin = 'DB.PRODUTO.PRODA15PRATEL'
      FixedChar = True
      Size = 15
    end
    object SQLTemplatePRODN3PESOBRUTO: TFloatField
      FieldName = 'PRODN3PESOBRUTO'
      Origin = 'DB.PRODUTO.PRODN3PESOBRUTO'
    end
    object SQLTemplatePRODN3PESOLIQ: TFloatField
      FieldName = 'PRODN3PESOLIQ'
      Origin = 'DB.PRODUTO.PRODN3PESOLIQ'
    end
    object SQLTemplatePRODN3CAPACEMBAL: TFloatField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODN3CAPACEMBAL'
      Origin = 'DB.PRODUTO.PRODN3CAPACEMBAL'
    end
    object SQLTemplatePRODDCAD: TDateTimeField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'PRODDCAD'
      Origin = 'DB.PRODUTO.PRODDCAD'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object SQLTemplatePRODDULTALTER: TDateTimeField
      DisplayLabel = 'Dt.Ult.altera'#231#227'o'
      FieldName = 'PRODDULTALTER'
      Origin = 'DB.PRODUTO.PRODDULTALTER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object SQLTemplatePRODDINIPROMO: TDateTimeField
      DisplayLabel = 'Dt.Prom.In'#237'cio'
      DisplayWidth = 18
      FieldName = 'PRODDINIPROMO'
      Origin = 'DB.PRODUTO.PRODDINIPROMO'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object SQLTemplatePRODDFIMPROMO: TDateTimeField
      DisplayLabel = 'Dt.Prom.Final'
      DisplayWidth = 18
      FieldName = 'PRODDFIMPROMO'
      Origin = 'DB.PRODUTO.PRODDFIMPROMO'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object SQLTemplatePRODN2COMISVISTA: TFloatField
      FieldName = 'PRODN2COMISVISTA'
      Origin = 'DB.PRODUTO.PRODN2COMISVISTA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODN3VLRCOMPRA: TFloatField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Valor Compra'
      FieldName = 'PRODN3VLRCOMPRA'
      Origin = 'DB.PRODUTO.PRODN3VLRCOMPRA'
      DisplayFormat = '#,##0.00000'
      EditFormat = '#,##0.00000'
    end
    object SQLTemplatePRODN3VLRCOMPRAMED: TFloatField
      FieldName = 'PRODN3VLRCOMPRAMED'
      Origin = 'DB.PRODUTO.PRODN3VLRCOMPRAMED'
      DisplayFormat = '#,##0.00000'
      EditFormat = '#,##0.00000'
    end
    object SQLTemplatePRODN3VLRCUSTO: TFloatField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Valor Custo'
      FieldName = 'PRODN3VLRCUSTO'
      Origin = 'DB.PRODUTO.PRODN3VLRCUSTO'
      DisplayFormat = '#,##0.00000'
      EditFormat = '#,##0.00000'
    end
    object SQLTemplatePRODDIMOBOLIZ: TDateTimeField
      FieldName = 'PRODDIMOBOLIZ'
      Origin = 'DB.PRODUTO.PRODDIMOBOLIZ'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object SQLTemplatePRODN3VLRVENDA: TFloatField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Vlr.Venda Varejo'
      FieldName = 'PRODN3VLRVENDA'
      Origin = 'DB.PRODUTO.PRODN3VLRVENDA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SQLTemplatePRODN3QTDEBAIXA: TFloatField
      FieldName = 'PRODN3QTDEBAIXA'
      Origin = 'DB.PRODUTO.PRODN3QTDEBAIXA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODA60DESCR: TStringField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Descri'#231#227'o Principal'
      FieldName = 'PRODA60DESCR'
      Origin = 'DB.PRODUTO.PRODA60DESCR'
      FixedChar = True
      Size = 60
    end
    object SQLTemplatePRODN3VLRVENDAPROM: TFloatField
      DisplayLabel = 'Vlr.Venda Promo'#231#227'o'
      FieldName = 'PRODN3VLRVENDAPROM'
      Origin = 'DB.PRODUTO.PRODN3VLRVENDAPROM'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SQLTemplatePRODN3VLRCUSTOMED: TFloatField
      FieldName = 'PRODN3VLRCUSTOMED'
      Origin = 'DB.PRODUTO.PRODN3VLRCUSTOMED'
      DisplayFormat = '#,##0.00000'
      EditFormat = '#,##0.00000'
    end
    object SQLTemplatePRODN3PERCIPI: TFloatField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'IPI %'
      FieldName = 'PRODN3PERCIPI'
      Origin = 'DB.PRODUTO.PRODN3PERCIPI'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODN3PERCMARGLUCR: TFloatField
      DisplayLabel = 'Marg.Lucro Varejo'
      FieldName = 'PRODN3PERCMARGLUCR'
      Origin = 'DB.PRODUTO.PRODN3PERCMARGLUCR'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODCATIVO: TStringField
      FieldName = 'PRODCATIVO'
      Origin = 'DB.PRODUTO.PRODCATIVO'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODCSERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'PRODCSERVICO'
      Origin = 'DB.PRODUTO.PRODCSERVICO'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODCGERACOMIS: TStringField
      FieldName = 'PRODCGERACOMIS'
      Origin = 'DB.PRODUTO.PRODCGERACOMIS'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePENDENTE: TStringField
      DisplayLabel = 'Pendente'
      FieldName = 'PENDENTE'
      Origin = 'DB.PRODUTO.PENDENTE'
      FixedChar = True
      Size = 1
    end
    object SQLTemplateREGISTRO: TDateTimeField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
      Origin = 'DB.PRODUTO.REGISTRO'
    end
    object SQLTemplatePRODN2COMISPRAZO: TFloatField
      FieldName = 'PRODN2COMISPRAZO'
      Origin = 'DB.PRODUTO.PRODN2COMISPRAZO'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODIORIGEM: TIntegerField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODIORIGEM'
      Origin = 'DB.PRODUTO.PRODIORIGEM'
    end
    object SQLTemplatePRODDULTATUALIZ: TDateTimeField
      FieldName = 'PRODDULTATUALIZ'
      Origin = 'DB.PRODUTO.PRODDULTATUALIZ'
    end
    object SQLTemplatePRODA60DIMENSAO: TStringField
      FieldName = 'PRODA60DIMENSAO'
      Origin = 'DB.PRODUTO.PRODA60DIMENSAO'
      FixedChar = True
      Size = 60
    end
    object SQLTemplatePRODISITTRIB: TIntegerField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Sit.Tribut.(SN)'
      FieldName = 'PRODISITTRIB'
      Origin = 'DB.PRODUTO.PRODISITTRIB'
    end
    object SQLTemplatePRODICODETIQBAL: TIntegerField
      FieldName = 'PRODICODETIQBAL'
      Origin = 'DB.PRODUTO.PRODICODETIQBAL'
    end
    object SQLTemplatePRODIDIASVALIDADE: TIntegerField
      FieldName = 'PRODIDIASVALIDADE'
      Origin = 'DB.PRODUTO.PRODIDIASVALIDADE'
    end
    object SQLTemplatePRODN3DOLARCUSTO: TFloatField
      FieldName = 'PRODN3DOLARCUSTO'
      Origin = 'DB.PRODUTO.PRODN3DOLARCUSTO'
      DisplayFormat = '#,##0.00'
    end
    object SQLTemplatePRODN3DOLARCOMPRA: TFloatField
      FieldName = 'PRODN3DOLARCOMPRA'
      Origin = 'DB.PRODUTO.PRODN3DOLARCOMPRA'
      DisplayFormat = '#,##0.00'
    end
    object SQLTemplatePRODN3DOLARVENDA: TFloatField
      FieldName = 'PRODN3DOLARVENDA'
      Origin = 'DB.PRODUTO.PRODN3DOLARVENDA'
      DisplayFormat = '#,##0.00'
    end
    object SQLTemplatePRODITIPOPRODBALAN: TStringField
      FieldName = 'PRODITIPOPRODBALAN'
      Origin = 'DB.PRODUTO.PRODITIPOPRODBALAN'
      FixedChar = True
      Size = 15
    end
    object SQLTemplatePRODBIMAGEM: TBlobField
      FieldName = 'PRODBIMAGEM'
      Origin = 'DB.PRODUTO.PRODBIMAGEM'
      Size = 1
    end
    object SQLTemplatePRODCSUBSTRIB: TStringField
      DisplayLabel = 'Subst.Tribut (SN)'
      FieldName = 'PRODCSUBSTRIB'
      Origin = 'DB.PRODUTO.PRODCSUBSTRIB'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODCTEMNROSERIE: TStringField
      FieldName = 'PRODCTEMNROSERIE'
      Origin = 'DB.PRODUTO.PRODCTEMNROSERIE'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODN2PERCFRETE: TFloatField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODN2PERCFRETE'
      Origin = 'DB.PRODUTO.PRODN2PERCFRETE'
    end
    object SQLTemplatePRODA03GARANTIA: TStringField
      FieldName = 'PRODA03GARANTIA'
      Origin = 'DB.PRODUTO.PRODA03GARANTIA'
      FixedChar = True
      Size = 3
    end
    object SQLTemplatePRODA30INF01ETQBARRAS: TStringField
      FieldName = 'PRODA30INF01ETQBARRAS'
      Origin = 'DB.PRODUTO.PRODA30INF01ETQBARRAS'
      FixedChar = True
      Size = 30
    end
    object SQLTemplatePRODA30INF02ETQBARRAS: TStringField
      FieldName = 'PRODA30INF02ETQBARRAS'
      Origin = 'DB.PRODUTO.PRODA30INF02ETQBARRAS'
      FixedChar = True
      Size = 30
    end
    object SQLTemplateCOLEICOD: TIntegerField
      FieldName = 'COLEICOD'
      Origin = 'DB.PRODUTO.COLEICOD'
    end
    object SQLTemplatePRODCTIPO: TStringField
      FieldName = 'PRODCTIPO'
      Origin = 'DB.PRODUTO.PRODCTIPO'
      FixedChar = True
      Size = 5
    end
    object SQLTemplatePRODN2PERDA: TFloatField
      FieldName = 'PRODN2PERDA'
      Origin = 'DB.PRODUTO.PRODN2PERDA'
    end
    object SQLTemplatePRODN2PIS: TFloatField
      FieldName = 'PRODN2PIS'
      Origin = 'DB.PRODUTO.PRODN2PIS'
    end
    object SQLTemplatePRODN3ALTURA: TFloatField
      FieldName = 'PRODN3ALTURA'
      Origin = 'DB.PRODUTO.PRODN3ALTURA'
    end
    object SQLTemplatePRODN3COMPRIMENTO: TFloatField
      FieldName = 'PRODN3COMPRIMENTO'
      Origin = 'DB.PRODUTO.PRODN3COMPRIMENTO'
    end
    object SQLTemplatePRODN3DIMENTOTAL: TFloatField
      FieldName = 'PRODN3DIMENTOTAL'
      Origin = 'DB.PRODUTO.PRODN3DIMENTOTAL'
    end
    object SQLTemplatePRODN3LARGURA: TFloatField
      FieldName = 'PRODN3LARGURA'
      Origin = 'DB.PRODUTO.PRODN3LARGURA'
    end
    object SQLTemplatePRODN2PERCDESP: TFloatField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODN2PERCDESP'
      Origin = 'DB.PRODUTO.PRODN2PERCDESP'
    end
    object SQLTemplatePRODN2PERCSUBST: TFloatField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODN2PERCSUBST'
      Origin = 'DB.PRODUTO.PRODN2PERCSUBST'
    end
    object SQLTemplatePRODN3PERCMARGLUC2: TFloatField
      DisplayLabel = 'Marg.Lucro Atacado'
      FieldName = 'PRODN3PERCMARGLUC2'
      Origin = 'DB.PRODUTO.PRODN3PERCMARGLUC2'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODN3PERCMGLVFIXA: TFloatField
      FieldName = 'PRODN3PERCMGLVFIXA'
      Origin = 'DB.PRODUTO.PRODN3PERCMGLVFIXA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODN3PERCMGLAFIXA: TFloatField
      FieldName = 'PRODN3PERCMGLAFIXA'
      Origin = 'DB.PRODUTO.PRODN3PERCMGLAFIXA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODDULTCOMPRA: TDateTimeField
      FieldName = 'PRODDULTCOMPRA'
      Origin = 'DB.PRODUTO.PRODDULTCOMPRA'
    end
    object SQLTemplatePRODDULTVENDA: TDateTimeField
      FieldName = 'PRODDULTVENDA'
      Origin = 'DB.PRODUTO.PRODDULTVENDA'
    end
    object SQLTemplatePRODN3QTDULTCOMPRA: TFloatField
      FieldName = 'PRODN3QTDULTCOMPRA'
      Origin = 'DB.PRODUTO.PRODN3QTDULTCOMPRA'
    end
    object SQLTemplatePRODN2PERCDIFICM: TFloatField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODN2PERCDIFICM'
      Origin = 'DB.PRODUTO.PRODN2PERCDIFICM'
    end
    object SQLTemplatePRODIPRINCIPAL: TIntegerField
      DisplayLabel = 'Cod.Principal'
      FieldName = 'PRODIPRINCIPAL'
      Origin = 'DB.PRODUTO.PRODIPRINCIPAL'
    end
    object SQLTemplatePRODCPERMITETROCA: TStringField
      FieldName = 'PRODCPERMITETROCA'
      Origin = 'DB.PRODUTO.PRODCPERMITETROCA'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODDPREVCOMPRA: TDateTimeField
      FieldName = 'PRODDPREVCOMPRA'
      Origin = 'DB.PRODUTO.PRODDPREVCOMPRA'
    end
    object SQLTemplatePRODCCOFINS: TStringField
      FieldName = 'PRODCCOFINS'
      Origin = 'DB.PRODUTO.PRODCCOFINS'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODN3VLRVENDA2: TFloatField
      FieldName = 'PRODN3VLRVENDA2'
      Origin = 'DB.PRODUTO.PRODN3VLRVENDA2'
    end
    object SQLTemplatePRODCIMPETIQCDBAR: TStringField
      FieldName = 'PRODCIMPETIQCDBAR'
      Origin = 'DB.PRODUTO.PRODCIMPETIQCDBAR'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODN3QTDVOLUME: TFloatField
      FieldName = 'PRODN3QTDVOLUME'
      Origin = 'DB.PRODUTO.PRODN3QTDVOLUME'
    end
    object SQLTemplatePRODCVDESTNEG: TStringField
      FieldName = 'PRODCVDESTNEG'
      Origin = 'DB.PRODUTO.PRODCVDESTNEG'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODA2CSTIPI: TStringField
      FieldName = 'PRODA2CSTIPI'
      EditMask = '99;0;_'
      Size = 2
    end
    object SQLTemplatePRODA2CSTCOFINS: TStringField
      FieldName = 'PRODA2CSTCOFINS'
      EditMask = '99;0;_'
      Size = 2
    end
    object SQLTemplatePRODA2CSTPIS: TStringField
      FieldName = 'PRODA2CSTPIS'
      EditMask = '99;0;_'
      Size = 2
    end
    object SQLTemplatePRODN2ALIQCOFINS: TFloatField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODN2ALIQCOFINS'
      Origin = 'DB.PRODUTO.PRODN2ALIQCOFINS'
      Precision = 9
    end
    object SQLTemplatePRODN2ALIQPIS: TFloatField
      ConstraintErrorMessage = '1'
      FieldName = 'PRODN2ALIQPIS'
      Origin = 'DB.PRODUTO.PRODN2ALIQPIS'
      Precision = 9
    end
    object SQLTemplatePRODCBLOQVPRAZO: TStringField
      FieldName = 'PRODCBLOQVPRAZO'
      Origin = 'DB.PRODUTO.PRODCBLOQVPRAZO'
      FixedChar = True
      Size = 1
    end
    object SQLTemplateNCMICOD: TIntegerField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Cod.NCM'
      FieldName = 'NCMICOD'
      Origin = 'DB.PRODUTO.NCMICOD'
    end
    object SQLTemplatePRODA1TIPO: TStringField
      FieldName = 'PRODA1TIPO'
      Origin = 'DB.PRODUTO.PRODA1TIPO'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODA1MODBCST: TStringField
      FieldName = 'PRODA1MODBCST'
      Origin = 'DB.PRODUTO.PRODA1MODBCST'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODA1MODBC: TStringField
      FieldName = 'PRODA1MODBC'
      Origin = 'DB.PRODUTO.PRODA1MODBC'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODN2DESCMAX: TFloatField
      FieldName = 'PRODN2DESCMAX'
      Origin = 'DB.PRODUTO.PRODN2DESCMAX'
    end
    object SQLTemplatePRODA20BARRAUNIDADE: TStringField
      FieldName = 'PRODA20BARRAUNIDADE'
      Origin = 'DB.PRODUTO.PRODA20BARRAUNIDADE'
    end
    object SQLTemplatePRODA2TIPOITEM: TStringField
      FieldName = 'PRODA2TIPOITEM'
      Origin = 'DB.PRODUTO.PRODA2TIPOITEM'
      FixedChar = True
      Size = 2
    end
    object SQLTemplatePRODA30COZINHA: TStringField
      FieldName = 'PRODA30COZINHA'
      Origin = 'DB.PRODUTO.PRODA30COZINHA'
      Size = 30
    end
    object SQLTemplatePRODCIMPCOZINHA: TStringField
      FieldName = 'PRODCIMPCOZINHA'
      Origin = 'DB.PRODUTO.PRODCIMPCOZINHA'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODCIMPVALE: TStringField
      FieldName = 'PRODCIMPVALE'
      Origin = 'DB.PRODUTO.PRODCIMPVALE'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODA3CSTIPIENTRADA: TStringField
      FieldName = 'PRODA3CSTIPIENTRADA'
      Origin = 'DB.PRODUTO.PRODA3CSTIPIENTRADA'
      Size = 3
    end
    object SQLTemplatePRODA3CSTCOFINSENTRADA: TStringField
      FieldName = 'PRODA3CSTCOFINSENTRADA'
      Origin = 'DB.PRODUTO.PRODA3CSTCOFINSENTRADA'
      Size = 3
    end
    object SQLTemplatePRODA3CSTPISENTRADA: TStringField
      FieldName = 'PRODA3CSTPISENTRADA'
      Origin = 'DB.PRODUTO.PRODA3CSTPISENTRADA'
      Size = 3
    end
    object SQLTemplatePRODN2PERCIPIENTRADA: TFloatField
      FieldName = 'PRODN2PERCIPIENTRADA'
      Origin = 'DB.PRODUTO.PRODN2PERCIPIENTRADA'
      Precision = 9
    end
    object SQLTemplatePRODA1CSTSERVICO: TStringField
      FieldName = 'PRODA1CSTSERVICO'
      Origin = 'DB.PRODUTO.PRODA1CSTSERVICO'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODICODLISTASERVICO: TIntegerField
      FieldName = 'PRODICODLISTASERVICO'
      Origin = 'DB.PRODUTO.PRODICODLISTASERVICO'
    end
    object SQLTemplateUNIDICOD2: TIntegerField
      FieldName = 'UNIDICOD2'
      Origin = 'DB.PRODUTO.UNIDICOD2'
    end
    object SQLTemplatePRODCRAPIDO: TStringField
      FieldName = 'PRODCRAPIDO'
      Origin = 'DB.PRODUTO.PRODCRAPIDO'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODCMIX: TStringField
      FieldName = 'PRODCMIX'
      Origin = 'DB.PRODUTO.PRODCMIX'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODN3QTDVENDA2835D: TFloatField
      FieldName = 'PRODN3QTDVENDA2835D'
      Origin = 'DB.PRODUTO.PRODN3QTDVENDA2835D'
    end
    object SQLTemplatePRODN3QTDVENDA283542D: TFloatField
      FieldName = 'PRODN3QTDVENDA283542D'
      Origin = 'DB.PRODUTO.PRODN3QTDVENDA283542D'
    end
    object SQLTemplatePRODN2VLRVENDA2835D: TFloatField
      FieldName = 'PRODN2VLRVENDA2835D'
      Origin = 'DB.PRODUTO.PRODN2VLRVENDA2835D'
    end
    object SQLTemplatePRODN2VLRVENDA283542D: TFloatField
      FieldName = 'PRODN2VLRVENDA283542D'
      Origin = 'DB.PRODUTO.PRODN2VLRVENDA283542D'
    end
    object SQLTemplatePRODA255DESCRTEC: TMemoField
      FieldName = 'PRODA255DESCRTEC'
      Origin = 'DB.PRODUTO.PRODA255DESCRTEC'
      BlobType = ftMemo
      Size = 2000
    end
    object SQLTemplatePRODN2MGVENDA283542D: TFloatField
      FieldName = 'PRODN2MGVENDA283542D'
      Origin = 'DB.PRODUTO.PRODN2MGVENDA283542D'
    end
    object SQLTemplatePRODN2MGVENDA2835D: TFloatField
      FieldName = 'PRODN2MGVENDA2835D'
      Origin = 'DB.PRODUTO.PRODN2MGVENDA2835D'
    end
    object SQLTemplateTABCEST: TStringField
      FieldName = 'TABCEST'
      Origin = 'DB.PRODUTO.TABCEST'
      Size = 10
    end
  end
  object DSSQLUnidade: TDataSource
    DataSet = SQLUnidade
    Left = 376
    Top = 46
  end
  object SQLUnidade: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'SELECT UNIDICOD, UNIDA5DESCR, UNIDA15DESCR FROM UNIDADE'
      'ORDER BY UNIDA5DESCR')
    Macros = <>
    Left = 344
    Top = 46
    object SQLUnidadeUNIDICOD: TIntegerField
      FieldName = 'UNIDICOD'
      Origin = 'DB.UNIDADE.UNIDICOD'
    end
    object SQLUnidadeUNIDA5DESCR: TStringField
      FieldName = 'UNIDA5DESCR'
      Origin = 'DB.UNIDADE.UNIDA5DESCR'
      FixedChar = True
      Size = 5
    end
    object SQLUnidadeUNIDA15DESCR: TStringField
      FieldName = 'UNIDA15DESCR'
      Origin = 'DB.UNIDADE.UNIDA15DESCR'
      FixedChar = True
      Size = 15
    end
  end
  object DSSQLIcms: TDataSource
    DataSet = SQLIcms
    Left = 447
    Top = 86
  end
  object SQLIcms: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'SELECT ICMSICOD, ICMSA60DESCR, ICMSN2ALIQUOTA, '
      'ICMSICODSITTRIB  FROM ICMS')
    Macros = <>
    Left = 419
    Top = 86
    object SQLIcmsICMSICOD: TIntegerField
      FieldName = 'ICMSICOD'
      Origin = 'DB.ICMS.ICMSICOD'
    end
    object SQLIcmsICMSA60DESCR: TStringField
      FieldName = 'ICMSA60DESCR'
      Origin = 'DB.ICMS.ICMSA60DESCR'
      FixedChar = True
      Size = 60
    end
    object SQLIcmsICMSN2ALIQUOTA: TFloatField
      FieldName = 'ICMSN2ALIQUOTA'
      Origin = 'DB.ICMS.ICMSN2ALIQUOTA'
    end
    object SQLIcmsICMSICODSITTRIB: TIntegerField
      FieldName = 'ICMSICODSITTRIB'
      Origin = 'DB.ICMS.ICMSICODSITTRIB'
    end
  end
  object DSSQLGrupo: TDataSource
    AutoEdit = False
    DataSet = SQLGrupo
    Left = 517
    Top = 78
  end
  object SQLGrupo: TRxQuery
    DatabaseName = 'DB'
    RequestLive = True
    SQL.Strings = (
      'SELECT GRUPICOD, GRUPA60DESCR FROM GRUPO'
      'ORDER BY GRUPA60DESCR')
    Macros = <>
    Left = 489
    Top = 78
    object SQLGrupoGRUPICOD: TIntegerField
      FieldName = 'GRUPICOD'
      Origin = 'DB.GRUPO.GRUPICOD'
    end
    object SQLGrupoGRUPA60DESCR: TStringField
      FieldName = 'GRUPA60DESCR'
      Origin = 'DB.GRUPO.GRUPA60DESCR'
      FixedChar = True
      Size = 60
    end
  end
  object SQLColecao: TRxQuery
    DatabaseName = 'DB'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM Colecao'
      'ORDER BY COLEA60DESCR')
    Macros = <>
    Left = 168
    Top = 49
    object SQLColecaoCOLEICOD: TIntegerField
      FieldName = 'COLEICOD'
      Origin = 'DB.COLECAO.COLEICOD'
    end
    object SQLColecaoCOLEA60DESCR: TStringField
      FieldName = 'COLEA60DESCR'
      Origin = 'DB.COLECAO.COLEA60DESCR'
      FixedChar = True
      Size = 60
    end
    object SQLColecaoPENDENTE: TStringField
      FieldName = 'PENDENTE'
      Origin = 'DB.COLECAO.PENDENTE'
      FixedChar = True
      Size = 1
    end
    object SQLColecaoREGISTRO: TDateTimeField
      FieldName = 'REGISTRO'
      Origin = 'DB.COLECAO.REGISTRO'
    end
  end
  object DSSQLColecao: TDataSource
    DataSet = SQLColecao
    Left = 200
    Top = 49
  end
  object sqlMax: TRxQuery
    DatabaseName = 'DB'
    Macros = <>
    Left = 280
    Top = 50
  end
end
