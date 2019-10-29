inherited FormCadastroClienteProdutoPreco: TFormCadastroClienteProdutoPreco
  Left = 262
  Top = 105
  Caption = 'Cadastro de Cliente/Produto Pre'#231'o'
  ClientHeight = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxFundo: TScrollBox
    Height = 520
    inherited PanelCentral: TPanel
      Height = 446
      inherited PanelBarra: TPanel
        Height = 446
      end
      inherited PanelFundoDados: TPanel
        Height = 446
        inherited Panel5: TPanel
          Height = 446
          inherited PagePrincipal: TPageControl
            Height = 364
            inherited TabSheetConsulta: TTabSheet
              inherited DBGridLista: TDBGrid
                Height = 291
              end
              inherited PanelProcura: TPanel
                inherited PanelBetween: TPanel
                  inherited AdvPanel1: TAdvPanel
                    FullHeight = 0
                  end
                end
                inherited PanelEditProcura: TPanel
                  inherited AdvPanelEditProcura: TAdvPanel
                    FullHeight = 0
                  end
                end
                inherited PanelIndice: TPanel
                  inherited AdvPanelIndice: TAdvPanel
                    FullHeight = 0
                  end
                end
              end
            end
          end
          inherited PanelCodigoDescricao: TPanel
            object Label2: TLabel
              Left = 12
              Top = 4
              Width = 69
              Height = 13
              Caption = 'C'#243'd.Produto'
              FocusControl = DBEdit2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object AcessaProdutos: TSpeedButton
              Left = 83
              Top = 17
              Width = 21
              Height = 21
              Hint = 'Acessa Cadastro Produtos'
              Flat = True
              Glyph.Data = {
                9E020000424D9E0200000000000036000000280000000E0000000E0000000100
                18000000000068020000C40E0000C40E00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FF000000000000FF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF00FF0000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000
                0000FF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF000000000000000000FF00FFFF00FFFF00FF0000FF00FFFF00FFA0B8BF3F
                48400000000000003F383F6F686F000000000000FF00FFFF00FFFF00FFFF00FF
                0000FF00FFA0B8B02F302F7080808F989F7F908F60706F000000000000FF00FF
                FF00FFFF00FFFF00FFFF00FF0000FF00FF3F40407F908FA0B8B090A8AF8F989F
                7F888F60706F404840FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FF000000
                B0C8C0CFD8DFA0B0B090A8A08098907F888F000000FF00FFFF00FFFF00FFFF00
                FFFF00FF0000FF00FF000000BFD0D0F0F8F0AFC0BF9FB0B090A0A08090900000
                00FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FF3F40408F989FCFE0DFE0E8
                EFAFB8BF9FB0AF70807F3F4840FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
                FF9FA8AF2F302F8F989FB0C8CFAFC0C07F888F2F3030AFC0BFFF00FFFF00FFFF
                00FFFF00FFFF00FF0000FF00FFFF00FF9FB0B03F40400000000000003F4840AF
                B8BFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                0000}
              ParentShowHint = False
              ShowHint = True
              OnClick = AcessaProdutosClick
            end
            object Label22: TLabel
              Left = 466
              Top = 3
              Width = 70
              Height = 13
              Caption = 'Pre'#231'o Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit2: TDBEdit
              Left = 9
              Top = 18
              Width = 72
              Height = 21
              DataField = 'PRODICOD'
              DataSource = DSTemplate
              TabOrder = 0
              OnKeyDown = DBEdit2KeyDown
            end
            object DBEdit6: TDBEdit
              Left = 107
              Top = 18
              Width = 354
              Height = 21
              TabStop = False
              BevelInner = bvNone
              BevelOuter = bvNone
              Ctl3D = True
              DataField = 'ProdutoLookup'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = True
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object EvDBNumEdit2: TEvDBNumEdit
              Left = 463
              Top = 17
              Width = 91
              Height = 21
              AutoHideCalculator = False
              DataField = 'PRECO'
              DataSource = DSTemplate
              Decimals = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                46040000424D460400000000000036000000280000001A0000000D0000000100
                1800000000001004000000000000000000000000000000000000FFC0C0FFC0C0
                FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0
                C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FF
                C0C0FFC0C0FFC0C0FF7FFFC0C080404080404080404080404080404080404080
                4040804040804040804040FFC0C0FFC0C0FFC0C0FFFFFF808080808080808080
                808080808080808080808080808080808080FFC0C0FFC0C0FF7FFFC0C0FFC000
                FF4060FF4060FF4060FF4060FF4060FF4060FF4060FF4060804040FFC0C0FFC0
                C0FFC0C0FFFFFFFFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C080
                8080FFC0C0FFC0C0FF7FFFC0C0FFC000FF4060FFC000FFFFFFFFC000FFFFFFFF
                C000FFFFFFFF4060804040FFC0C0FFC0C0FFC0C0FFFFFFFFC0C0808080FFFFFF
                808080FFFFFF808080FFFFFFFFC0C0808080FFC0C0FFC0C0E84CFFC0C0FFC000
                FF4060FF4060FF4060FF4060FF4060FF4060FF4060FF4060804040FFC0C0FFC0
                C0FFC0C0FFFFFFFFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C080
                8080FFC0C0FFC0C00000FFC0C0FFC000FF4060FFC000FFFFFFFFC000FFFFFFFF
                C000FFFFFFFF4060804040FFC0C0FFC0C0FFC0C0FFFFFFFFC0C0808080FFFFFF
                808080FFFFFF808080FFFFFFFFC0C0808080FFC0C0FFC0C0FF7FFFC0C0FFC000
                FF4060FF4060FF4060FF4060FF4060FF4060FF4060FF4060804040FFC0C0FFC0
                C0FFC0C0FFFFFFFFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C080
                8080FFC0C0FFC0C00000FFC0C0FFC000FF4060400000FFC0C0FFC0C0FFC0C0FF
                C0C0FFC0C0FF4060804040FFC0C0FFC0C0FFC0C0FFFFFFFFC0C0808080FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFC0C0808080FFC0C0FFC0C0FF7FFFC0C0FFC000
                FF4060400000FFFFFFFFFFFFFFFFFFFFFFFFFFC0C0FF4060804040FFC0C0FFC0
                C0FFC0C0FFFFFFFFC0C0808080FFC0C0FFC0C0FFC0C0FFC0C0FFFFFFFFC0C080
                8080FFC0C0FFC0C0FF7FFFC0C0FFC000FF406040000040000040000040000040
                0000400000FF4060804040FFC0C0FFC0C0FFC0C0FFFFFFFFC0C0808080808080
                808080808080808080808080FFC0C0808080FFC0C0FFC0C0FF7FFFC0C0FFC000
                FF4060FF4060FF4060FF4060FF4060FF4060FF4060FF4060804040FFC0C0FFC0
                C0FFC0C0FFFFFFFFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C080
                8080FFC0C0FFC0C0FF7FFFC0C0FFC000FFC000FFC000FFC000FFC000FFC000FF
                C000FFC000FFC000804040FFC0C0FFC0C0FFC0C0FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0FFC0C0FF7FFFC0C0FFC0C0
                FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0
                C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FF
                C0C0FFC0C0FFC0C0FF7F}
              ParentFont = False
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  inherited SQLTemplate: TRxQuery
    SQL.Strings = (
      'Select * From CLIENTEPRODUTOPRECO '
      'WHERE'
      '  CLIEA13ID = :CLIEA13ID and  (%MFiltro)')
    ParamData = <
      item
        DataType = ftString
        Name = 'CLIEA13ID'
        ParamType = ptInput
      end>
    object SQLTemplateCLIEA13ID: TStringField
      DisplayLabel = 'Cod.Cliente'
      FieldName = 'CLIEA13ID'
      Origin = 'DB.CLIENTEPRODUTOPRECO.CLIEA13ID'
      FixedChar = True
      Size = 13
    end
    object SQLTemplatePRODICOD: TIntegerField
      DisplayLabel = 'Cod.Produto'
      FieldName = 'PRODICOD'
      Origin = 'DB.CLIENTEPRODUTOPRECO.PRODICOD'
      OnChange = SQLTemplatePRODICODChange
    end
    object SQLTemplatePRECO: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      Origin = 'DB.CLIENTEPRODUTOPRECO.PRECO'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object SQLTemplateREGISTRO: TDateTimeField
      FieldName = 'REGISTRO'
      Origin = 'DB.CLIENTEPRODUTOPRECO.REGISTRO'
    end
    object SQLTemplateProdutoLookup: TStringField
      DisplayWidth = 35
      FieldKind = fkLookup
      FieldName = 'ProdutoLookup'
      LookupDataSet = TblProduto
      LookupKeyFields = 'PRODICOD'
      LookupResultField = 'PRODA30ADESCRREDUZ'
      KeyFields = 'PRODICOD'
      Lookup = True
    end
  end
  object TblProduto: TTable
    DatabaseName = 'DB'
    TableName = 'PRODUTO'
    Left = 18
    Top = 309
    object TblProdutoPRODICOD: TIntegerField
      FieldName = 'PRODICOD'
      Required = True
    end
    object TblProdutoPRODA30ADESCRREDUZ: TStringField
      FieldName = 'PRODA30ADESCRREDUZ'
      FixedChar = True
      Size = 30
    end
  end
end
