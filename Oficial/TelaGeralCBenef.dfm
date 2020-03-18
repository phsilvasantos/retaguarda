inherited FormTelaGeralCBenef: TFormTelaGeralCBenef
  Left = 297
  Top = 122
  Width = 1062
  Caption = 'Consulta C'#243'digo do Benef'#237'cio Fiscal'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxFundo: TScrollBox
    Width = 1046
    inherited PanelCentral: TPanel
      Top = 108
      Width = 1042
      Height = 239
      inherited PanelBarra: TPanel
        Width = 2
        Height = 239
      end
      object DBGridLista: TDBGrid
        Left = 2
        Top = 0
        Width = 1040
        Height = 239
        Align = alClient
        BorderStyle = bsNone
        Color = 16249066
        DataSource = dsSQLCBenef
        FixedColor = 10053171
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgAlwaysShowSelection, dgConfirmDelete]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Title.Alignment = taCenter
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Width = 279
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTINICIO'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTFINAL'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_00'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_10'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_20'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_30'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_40'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_41'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_50'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_51'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_60'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_70'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST_90'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
    inherited ScrollBoxTopo: TScrollBox
      Width = 1042
      inherited PanelCabecalho: TPanel
        Width = 1042
        inherited PanelNavigator: TPanel
          Width = 1042
          inherited AdvPanelNavigator: TAdvOfficeStatusBar
            Width = 1042
            object BtnSelecionarDoc: TSpeedButton
              Tag = 3
              Left = 2
              Top = 4
              Width = 100
              Height = 25
              Cursor = crHandPoint
              Hint = 'Selecionar'
              Caption = '&Selecionar'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                96040000424D9604000000000000360000002800000012000000140000000100
                18000000000060040000CE0E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000084A8B491B1BB9CB9C29CB9C284A8
                B484A8B443555C000000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF00000069869091B1BB9CB9C29CB9C291B1BB84A8B484A8B4546B7300
                0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000546B7384
                A8B484A8B49CB9C29CB9C29CB9C284A8B484A8B469869043555C000000FFFFFF
                00000000000000000000000000000000000000006986909CB9C29CB9C29CB9C2
                9CB9C291B1BB84A8B484A8B4698690546B73000000FFFFFF0000000000E0E4E0
                E0E4E0E0E4E0000000546B7384A8B491B1BB9CB9C29CB9C291B1BB9CB9C284A8
                B484A8B484A8B4698690000000FFFFFF0000000000E0E4E0E0E4E0E0E4E00000
                0069869084A8B49CB9C29CB9C29CB9C29CB9C291B1BB84A8B484A8B484A8B469
                86903544490000000000000000E0E4E0E0E4E0000000698690708F9991B1BB9C
                B9C29CB9C29CB9C291B1BB9CB9C284A8B484A8B484A8B484A8B443555C000000
                000000000000000000000000000084A8B400000084A8B49CB9C29CB9C291B1BB
                9CB9C284A8B484A8B484A8B484A8B484A8B4546B730000000000000000E0E4E0
                E0E4E000000084A8B400000099B7C09CB9C29CB9C291B1BB91B1BB84A8B484A8
                B484A8B484A8B484A8B4546B730000000000000000E0E4E0E0E4E00000006986
                9000000099B7C091B1BB69869084A8B484A8B469869084A8B484A8B484A8B484
                A8B46986900000000000000000E0E4E0E0E4E0000000546B7300000099B7C069
                869000000084A8B469869000000084A8B4698690000000698690546B73000000
                000000000000000000000000000000000000000099B7C069869000000084A8B4
                546B730000006D8B94546B730000000000000000000000000000000000E0E4E0
                E0E4E0E0E4E0E0E4E0000000AAC3CA6986900000005A737A3240430708080000
                000000008C9C94E0E4E0E0E4E00000000000000000E0E4E0E0E4E0E0E4E0E0E4
                E0000000AAC3CA698690000000000000000000A3A5A3E0E4E0E0E4E0E0E4E0E0
                E4E0E0E4E00000000000000000E0E4E0E0E4E0E0E4E0E0E4E0000000B8CDD369
                86900000008C9C94E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0000000
                0000000000000000000000000000000000000000AAC3CA698690000000000000
                0000000000000000000000000000000000000000000000000000000000E0E4E0
                E0E4E0E0E4E0E0E4E0000000698690546B730000008C9C94E0E4E0E0E4E0E0E4
                E0E0E4E0E0E4E0E0E4E0E0E4E00000000000000000E0E4E0E0E4E0E0E4E0E0E4
                E0E0E4E00000000000008C9C94E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0
                E4E0E0E4E00000000000000000E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0
                E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0E0E4E0000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              ParentFont = False
              Spacing = 10
              OnClick = BtnSelecionarDocClick
            end
          end
        end
      end
    end
    object PanelTopBxDocREc: TPanel
      Left = 0
      Top = 80
      Width = 1042
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      Color = 16249066
      TabOrder = 2
      object Label1: TLabel
        Left = 14
        Top = 9
        Width = 41
        Height = 13
        Caption = '&C'#243'digo:'
        FocusControl = CodCBenef
        Font.Charset = ANSI_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CodCBenef: TEdit
        Left = 63
        Top = 1
        Width = 86
        Height = 21
        TabOrder = 0
        OnKeyDown = CodCBenefKeyDown
      end
    end
  end
  object dsSQLCBenef: TDataSource
    DataSet = SQLCBenef
    Left = 290
    Top = 5
  end
  object SQLCBenef: TRxQuery
    Tag = 2
    DatabaseName = 'DB'
    SQL.Strings = (
      'SELECT * FROM cbenef'
      'WHERE %MCodigo')
    Macros = <
      item
        DataType = ftString
        Name = 'MCodigo'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 322
    Top = 5
    object SQLCBenefID: TIntegerField
      FieldName = 'ID'
      Origin = 'DB.CBENEF.ID'
    end
    object SQLCBenefCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'DB.CBENEF.CODIGO'
      Size = 8
    end
    object SQLCBenefUF: TStringField
      FieldName = 'UF'
      Origin = 'DB.CBENEF.UF'
      Size = 2
    end
    object SQLCBenefDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DB.CBENEF.DESCRICAO'
      Size = 250
    end
    object SQLCBenefOBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Origin = 'DB.CBENEF.OBS'
      Size = 250
    end
    object SQLCBenefDTINICIO: TDateTimeField
      DisplayLabel = 'In'#237'cio '
      FieldName = 'DTINICIO'
      Origin = 'DB.CBENEF.DTINICIO'
    end
    object SQLCBenefDTFINAL: TDateTimeField
      DisplayLabel = 'Final'
      FieldName = 'DTFINAL'
      Origin = 'DB.CBENEF.DTFINAL'
    end
    object SQLCBenefCST_00: TStringField
      DisplayLabel = 'CST 00'
      FieldName = 'CST_00'
      Origin = 'DB.CBENEF.CST_00'
      Size = 1
    end
    object SQLCBenefCST_10: TStringField
      DisplayLabel = 'CST 10'
      FieldName = 'CST_10'
      Origin = 'DB.CBENEF.CST_10'
      Size = 1
    end
    object SQLCBenefCST_20: TStringField
      DisplayLabel = 'CST 20'
      FieldName = 'CST_20'
      Origin = 'DB.CBENEF.CST_20'
      Size = 1
    end
    object SQLCBenefCST_30: TStringField
      DisplayLabel = 'CST 30'
      FieldName = 'CST_30'
      Origin = 'DB.CBENEF.CST_30'
      Size = 1
    end
    object SQLCBenefCST_40: TStringField
      DisplayLabel = 'CST 40'
      FieldName = 'CST_40'
      Origin = 'DB.CBENEF.CST_40'
      Size = 1
    end
    object SQLCBenefCST_41: TStringField
      DisplayLabel = 'CST 41'
      FieldName = 'CST_41'
      Origin = 'DB.CBENEF.CST_41'
      Size = 1
    end
    object SQLCBenefCST_50: TStringField
      DisplayLabel = 'CST 50'
      FieldName = 'CST_50'
      Origin = 'DB.CBENEF.CST_50'
      Size = 1
    end
    object SQLCBenefCST_51: TStringField
      DisplayLabel = 'CST 51'
      FieldName = 'CST_51'
      Origin = 'DB.CBENEF.CST_51'
      Size = 1
    end
    object SQLCBenefCST_60: TStringField
      DisplayLabel = 'CST 60'
      FieldName = 'CST_60'
      Origin = 'DB.CBENEF.CST_60'
      Size = 1
    end
    object SQLCBenefCST_70: TStringField
      DisplayLabel = 'CST 70'
      FieldName = 'CST_70'
      Origin = 'DB.CBENEF.CST_70'
      Size = 1
    end
    object SQLCBenefCST_90: TStringField
      DisplayLabel = 'CST 90'
      FieldName = 'CST_90'
      Origin = 'DB.CBENEF.CST_90'
      Size = 1
    end
  end
end
