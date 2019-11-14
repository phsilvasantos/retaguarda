inherited FormCadastroProdutoImposto: TFormCadastroProdutoImposto
  Left = 279
  Top = 54
  Caption = 'Cadastro de Produto Imposto'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxFundo: TScrollBox
    inherited PanelCentral: TPanel
      inherited PanelFundoDados: TPanel
        inherited Panel5: TPanel
          inherited PagePrincipal: TPageControl
            Top = 65
            Height = 384
            ActivePage = TabSheetDadosPrincipais
            inherited TabSheetConsulta: TTabSheet
              inherited DBGridLista: TDBGrid
                Height = 311
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
            inherited TabSheetDadosPrincipais: TTabSheet
              object gbICMS: TGroupBox
                Left = 0
                Top = 0
                Width = 749
                Height = 129
                Align = alTop
                Caption = 'ICMS'
                TabOrder = 0
                object Label68: TLabel
                  Left = 13
                  Top = 49
                  Width = 246
                  Height = 13
                  Caption = 'CST ICMS => Situa'#231#227'o Tribut'#225'ria para ICMS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label36: TLabel
                  Left = 269
                  Top = 49
                  Width = 111
                  Height = 13
                  Caption = '% Red Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label105: TLabel
                  Left = 13
                  Top = 86
                  Width = 219
                  Height = 13
                  Caption = 'Determina'#231#227'o da Base de C'#225'lculo ICMS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label103: TLabel
                  Left = 286
                  Top = 86
                  Width = 129
                  Height = 13
                  Caption = 'Determ. BC do ICMS ST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label57: TLabel
                  Left = 541
                  Top = 86
                  Width = 128
                  Height = 13
                  Caption = '% Red Base C'#225'lculo ST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label34: TLabel
                  Left = 13
                  Top = 13
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
                object AcessaICMS: TSpeedButton
                  Left = 199
                  Top = 27
                  Width = 22
                  Height = 21
                  Hint = 'Acessa Icms'
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
                  OnClick = AcessaICMSClick
                end
                object lblTipo: TLabel
                  Left = 229
                  Top = 13
                  Width = 24
                  Height = 13
                  Caption = 'Tipo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboSitTrib: TRxDBComboBox
                  Left = 13
                  Top = 63
                  Width = 254
                  Height = 21
                  Style = csDropDownList
                  DataField = 'PRODISITTRIB'
                  DataSource = DSTemplate
                  EnableValues = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ItemHeight = 13
                  Items.Strings = (
                    '00   - Tributada integralmente'
                    
                      '10   - Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225 +
                      'ria'
                    '20   - Com redu'#231#227'o de base de c'#225'lculo'
                    
                      '30   - Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substi' +
                      'tui'#231#227'o tribut'#225'ria'
                    '40   - Isenta'
                    '41   - N'#227'o tributada'
                    '50   - Suspens'#227'o'
                    '51   - Diferimento'
                    '60   - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
                    
                      '70   - Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por sub' +
                      'stitui'#231#227'o tribut'#225'ria'
                    '90   - Outros '
                    
                      '101 - Tributada pelo Simples Nacional com permiss'#227'o de cr'#233'dito. ' +
                      '(v.2.0) '
                    '102 - Tributada pelo Simples Nacional sem permiss'#227'o de cr'#233'dito.'
                    
                      '103 - Isen'#231#227'o do ICMS no Simples Nacional para faixa de receita ' +
                      'bruta.'
                    '300 - Imune.'
                    '400 - N'#227'o tributada pelo Simples Nacional (v.2.0)'
                    
                      '201 - Tributada pelo Simples Nacional com permiss'#227'o de cr'#233'dito e' +
                      ' com cobran'#231'a do ICMS por Substitui'#231#227'o Tribut'#225'ria;'
                    
                      '202 - Tributada pelo Simples Nacional sem permiss'#227'o de cr'#233'dito e' +
                      ' com cobran'#231'a do ICMS por Substitui'#231#227'o Tribut'#225'ria;'
                    
                      '203 - Isen'#231#227'o do ICMS nos Simples Nacional para faixa de receita' +
                      ' bruta e com cobran'#231'a do ICMS por Substitui'#231#227'o Tribut'#225'ria;'
                    
                      '500 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria (su' +
                      'bstitu'#237'do) ou por antecipa'#231#227'o; '
                    '900 - Outros')
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  Values.Strings = (
                    '0'
                    '10'
                    '20'
                    '30'
                    '40'
                    '41'
                    '50'
                    '51'
                    '60'
                    '70'
                    '90'
                    '101'
                    '102'
                    '103'
                    '300'
                    '400'
                    '201'
                    '202'
                    '203'
                    '500'
                    '900')
                end
                object DBEdit7: TDBEdit
                  Left = 269
                  Top = 63
                  Width = 115
                  Height = 21
                  DataField = 'PERC_REDUCAO_BASE_CALCULO'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 1
                end
                object ComboDetBaseCalcICM: TRxDBComboBox
                  Left = 13
                  Top = 99
                  Width = 274
                  Height = 21
                  Style = csDropDownList
                  DataField = 'PRODA1MODBC'
                  DataSource = DSTemplate
                  EnableValues = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ItemHeight = 13
                  Items.Strings = (
                    '0 - Margem Valor Agregado (%);'
                    '1 - Pauta (Valor);'
                    '2 - Pre'#231'o Tabelado M'#225'x. (valor);'
                    '3 - Valor da opera'#231#227'o.')
                  ParentFont = False
                  TabOrder = 2
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3')
                end
                object ComboDetBaseCalcICMST: TRxDBComboBox
                  Left = 286
                  Top = 99
                  Width = 254
                  Height = 21
                  Style = csDropDownList
                  DataField = 'PRODA1MODBCST'
                  DataSource = DSTemplate
                  EnableValues = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ItemHeight = 13
                  Items.Strings = (
                    '0 - Pre'#231'o tabelado ou m'#225'ximo sugerido;'
                    '1 - Lista Negativa (valor);'
                    '2 - Lista Positiva (valor);'
                    '3 - Lista Neutra (valor);'
                    '4 - Margem Valor Agregado (%);'
                    '5 - Pauta (valor);')
                  ParentFont = False
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5')
                end
                object DBEdit12: TDBEdit
                  Left = 541
                  Top = 99
                  Width = 115
                  Height = 21
                  DataField = 'PERC_REDUCAO_BASE_CALCULO_ST'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 4
                end
                object ComboICMS: TRxDBLookupCombo
                  Left = 13
                  Top = 27
                  Width = 183
                  Height = 21
                  DropDownCount = 8
                  DataField = 'ICMSICOD'
                  DataSource = DSTemplate
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
                  TabOrder = 5
                end
                object comboTipo: TRxDBComboBox
                  Left = 229
                  Top = 27
                  Width = 156
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TIPO'
                  DataSource = DSTemplate
                  EnableValues = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ItemHeight = 13
                  Items.Strings = (
                    'A - Atacado'
                    'V - Varejo')
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 6
                  Values.Strings = (
                    'A'
                    'V')
                end
              end
              object gbPisCofins: TGroupBox
                Left = 0
                Top = 129
                Width = 749
                Height = 110
                Align = alTop
                Caption = 'Pis e Cofins'
                TabOrder = 1
                object Label118: TLabel
                  Left = 13
                  Top = 20
                  Width = 186
                  Height = 13
                  Caption = 'PIS CST para Opera'#231#245'es de Saida'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label113: TLabel
                  Left = 473
                  Top = 20
                  Width = 35
                  Height = 13
                  Caption = '% PIS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label117: TLabel
                  Left = 13
                  Top = 59
                  Width = 207
                  Height = 13
                  Caption = 'COFINS CST para Opera'#231#245'es de Saida'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label119: TLabel
                  Left = 468
                  Top = 59
                  Width = 56
                  Height = 13
                  Caption = '% COFINS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object RxDBComboBox10: TRxDBComboBox
                  Left = 13
                  Top = 33
                  Width = 452
                  Height = 21
                  Style = csDropDownList
                  DataField = 'PRODA2CSTPIS'
                  DataSource = DSTemplate
                  EnableValues = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ItemHeight = 13
                  Items.Strings = (
                    
                      '01- Opera'#231#227'o Tribut'#225'vel com Aliquota B'#225'sica (base de c'#225'lculo = v' +
                      'alor da opera'#231#227'o al'#237'quota normal (cumulativo/n'#227'o cumulativo));'
                    
                      '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada (base de c'#225'lc' +
                      'ulo = valor da opera'#231#227'o (al'#237'quota diferenciada));'
                    
                      '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                      'roduto (base de c'#225'lculo = quantidade vendida x al'#237'quota por unid' +
                      'ade de produto);'
                    '04 - Opera'#231#227'o Tribut'#225'vel(tributa'#231#227'o monof'#225'sica (al'#237'quota zero));'
                    '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria;'
                    '06 - Opera'#231#227'o Tribut'#225'vel (al'#237'quota zero);'
                    '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o;'
                    '08 - Opera'#231#227'o Sem Incid'#234'ncia da Contribui'#231#227'o;'
                    '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o;'
                    '49 - Outras Opera'#231#245'es de Sa'#237'da;')
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  Values.Strings = (
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08'
                    '09'
                    '49')
                end
                object DBEdit51: TDBEdit
                  Left = 469
                  Top = 33
                  Width = 94
                  Height = 21
                  DataField = 'PRODN2ALIQPIS'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 1
                end
                object RxDBComboBox9: TRxDBComboBox
                  Left = 13
                  Top = 73
                  Width = 452
                  Height = 21
                  Style = csDropDownList
                  DataField = 'PRODA2CSTCOFINS'
                  DataSource = DSTemplate
                  EnableValues = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ItemHeight = 13
                  Items.Strings = (
                    
                      '01- Opera'#231#227'o Tribut'#225'vel com Aliquota B'#225'sica (base de c'#225'lculo = v' +
                      'alor da opera'#231#227'o al'#237'quota normal (cumulativo/n'#227'o cumulativo));'
                    
                      '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada (base de c'#225'lc' +
                      'ulo = valor da opera'#231#227'o (al'#237'quota diferenciada));'
                    
                      '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                      'roduto (base de c'#225'lculo = quantidade vendida x al'#237'quota por unid' +
                      'ade de produto);'
                    '04 - Opera'#231#227'o Tribut'#225'vel(tributa'#231#227'o monof'#225'sica (al'#237'quota zero));'
                    '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria;'
                    '06 - Opera'#231#227'o Tribut'#225'vel (al'#237'quota zero);'
                    '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o;'
                    '08 - Opera'#231#227'o Sem Incid'#234'ncia da Contribui'#231#227'o;'
                    '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o;'
                    '49 - Outras Opera'#231#245'es de Sa'#237'da;')
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 2
                  Values.Strings = (
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08'
                    '09'
                    '49')
                end
                object DBEdit60: TDBEdit
                  Left = 468
                  Top = 73
                  Width = 96
                  Height = 21
                  DataField = 'PRODN2ALIQCOFINS'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 3
                end
              end
            end
          end
          inherited PanelMaster: TPanel
            Height = 24
          end
          inherited PanelCodigoDescricao: TPanel
            object Label2: TLabel
              Left = 7
              Top = 4
              Width = 38
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = DBEdit2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 74
              Top = 4
              Width = 96
              Height = 13
              Caption = 'Produto Principal'
              FocusControl = DBEdit3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 411
              Top = 4
              Width = 110
              Height = 13
              Caption = 'Descri'#231#227'o Reduzida'
              FocusControl = DBEdit4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit2: TDBEdit
              Left = 5
              Top = 17
              Width = 64
              Height = 21
              Color = 16249066
              DataField = 'PRODICOD'
              DataSource = DSMasterTemplate
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 71
              Top = 17
              Width = 336
              Height = 21
              DataField = 'PRODA60DESCR'
              DataSource = DSMasterTemplate
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 409
              Top = 17
              Width = 239
              Height = 21
              DataField = 'PRODA30ADESCRREDUZ'
              DataSource = DSMasterTemplate
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  inherited SQLTemplate: TRxQuery
    SQL.Strings = (
      'Select * From PRODUTO_IMPOSTO '
      'Where PRODICOD=:PRODICOD and (%MFiltro)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRODICOD'
        ParamType = ptInput
      end>
    object SQLTemplatePRODICOD: TIntegerField
      DisplayLabel = 'C'#243'd.Produto'
      FieldName = 'PRODICOD'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODICOD'
    end
    object SQLTemplateTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'DB.PRODUTO_IMPOSTO.TIPO'
      FixedChar = True
      Size = 10
    end
    object SQLTemplateICMSICOD: TIntegerField
      FieldName = 'ICMSICOD'
      Origin = 'DB.PRODUTO_IMPOSTO.ICMSICOD'
    end
    object SQLTemplateLookUpICMS: TStringField
      DisplayLabel = 'ICMS'
      FieldKind = fkLookup
      FieldName = 'LookUpICMS'
      LookupDataSet = SQLIcms
      LookupKeyFields = 'ICMSICOD'
      LookupResultField = 'ICMSA60DESCR'
      KeyFields = 'ICMSICOD'
      Size = 30
      Lookup = True
    end
    object SQLTemplatePRODISITTRIB: TIntegerField
      DisplayLabel = 'Cod.Sit.Trib'
      FieldName = 'PRODISITTRIB'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODISITTRIB'
    end
    object SQLTemplatePRODN2ALIQPIS: TFloatField
      FieldName = 'PRODN2ALIQPIS'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODN2ALIQPIS'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODN2ALIQCOFINS: TFloatField
      FieldName = 'PRODN2ALIQCOFINS'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODN2ALIQCOFINS'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePERC_REDUCAO_BASE_CALCULO: TFloatField
      FieldName = 'PERC_REDUCAO_BASE_CALCULO'
      Origin = 'DB.PRODUTO_IMPOSTO.PERC_REDUCAO_BASE_CALCULO'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODA1MODBC: TStringField
      FieldName = 'PRODA1MODBC'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODA1MODBC'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePRODA1MODBCST: TStringField
      FieldName = 'PRODA1MODBCST'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODA1MODBCST'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePERC_REDUCAO_BASE_CALCULO_ST: TFloatField
      FieldName = 'PERC_REDUCAO_BASE_CALCULO_ST'
      Origin = 'DB.PRODUTO_IMPOSTO.PERC_REDUCAO_BASE_CALCULO_ST'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePRODA2CSTPIS: TStringField
      FieldName = 'PRODA2CSTPIS'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODA2CSTPIS'
      FixedChar = True
      Size = 2
    end
    object SQLTemplatePRODA2CSTCOFINS: TStringField
      FieldName = 'PRODA2CSTCOFINS'
      Origin = 'DB.PRODUTO_IMPOSTO.PRODA2CSTCOFINS'
      FixedChar = True
      Size = 2
    end
  end
  object SQLIcms: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'SELECT ICMSICOD, ICMSA60DESCR, ICMSN2ALIQUOTA, '
      'ICMSICODSITTRIB  FROM ICMS')
    Macros = <>
    Left = 493
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
  object DSSQLIcms: TDataSource
    DataSet = SQLIcms
    Left = 521
  end
end
