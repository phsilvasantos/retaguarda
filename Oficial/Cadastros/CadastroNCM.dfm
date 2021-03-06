inherited FormCadastroNCM: TFormCadastroNCM
  Left = 219
  Top = 116
  Caption = 'Cadastro NCM'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxFundo: TScrollBox
    inherited PanelCentral: TPanel
      inherited PanelBarra: TPanel
        inherited Button3: TRxSpeedButton
          Caption = '&3 TabelaIBPT'
          Font.Style = [fsBold]
          Visible = True
          OnClick = ImportarArquivoIBPTAtual1Click
        end
        object Button4: TRxSpeedButton
          Tag = 2
          Left = 1
          Top = 74
          Width = 127
          Height = 23
          Cursor = crHandPoint
          BiDiMode = bdRightToLeftNoAlign
          ParentBiDiMode = False
          GroupIndex = 1
          Caption = '&4 Tributa'#231#227'o UF'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            6E040000424D6E04000000000000360000002800000014000000120000000100
            18000000000038040000CE0E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF000000000000FFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            000000000000FFBFBFFFBFBFFFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFBFBF00
            0000FFBFBFFFBFBFFFBFBFFFBFBFFFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFBFBF000000FFBF
            BFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBF000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFBFBFFFBFBF000000FFBFBFFFBFBF
            FFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBF000000000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF000000FFBFBFF7FEFF000000FFBFBFFFBFBFFFBFBFFF
            BFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBF000000FFFFFFFFFFFFFFFFFF
            FFFFFF000000FFBFBFFFBFBFF7FEFF000000FFBFBFFFBFBFFFBFBFFFBFBFFFBF
            BFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFBFBFF7FEFFF7FEFF000000FFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBF
            FFBFBFFFBFBFFFBFBFFFBFBF000000FFFFFFFFFFFFFFFFFF000000FFBFBFFFBF
            BFF7FEFFF7FEFFF7FEFF000000000000FFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFF
            BFBFFFBFBFFFBFBF000000FFFFFFFFFFFFFFFFFF000000FFBFBFFFBFBFF7FEFF
            F7FEFFF7FEFFF7FEFFF7FEFF000000000000FFBFBFFFBFBFFFBFBFFFBFBFFFBF
            BFFFBFBF000000FFFFFFFFFFFF000000FFBFBFFFBFBFFFBFBFFFBFBFFFBFBFF7
            FEFFF7FEFFF7FEFFF7FEFFF7FEFF000000000000FFBFBFFFBFBFFFBFBFFFBFBF
            000000FFFFFFFFFFFF000000FFBFBFFFBFBF000000000000FFBFBFFFBFBFFFBF
            BFFFBFBFF7FEFFF7FEFFF7FEFFF7FEFF000000000000FFBFBFFFBFBF000000FF
            FFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000000000000000FFBFBF
            FFBFBFFFBFBFFFBFBFF7FEFFF7FEFFFFFFFF000000000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
            0000FFBFBFFFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          GrayedInactive = False
          Layout = blGlyphLeft
          Margin = 1
          ParentFont = False
          Transparent = True
          OnClick = Button4Click
        end
      end
      inherited PanelFundoDados: TPanel
        inherited Panel5: TPanel
          inherited PagePrincipal: TPageControl
            Top = 94
            Height = 355
            ActivePage = TabSheetDadosPrincipais
            inherited TabSheetConsulta: TTabSheet
              inherited DBGridLista: TDBGrid
                Height = 282
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
              object Label1: TLabel
                Left = 10
                Top = 0
                Width = 82
                Height = 13
                Caption = 'Descri'#231#227'o NCM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBMemoObs: TDBMemo
                Left = 7
                Top = 13
                Width = 606
                Height = 55
                BevelWidth = 0
                DataField = 'NCMA100DESCR'
                DataSource = DSTemplate
                ScrollBars = ssVertical
                TabOrder = 0
              end
              object GroupBox2: TGroupBox
                Left = 8
                Top = 77
                Width = 609
                Height = 105
                Caption = ' ICMS NORMAL E ICMS ST '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label10: TLabel
                  Left = 145
                  Top = 45
                  Width = 67
                  Height = 13
                  Caption = 'Aliq. Normal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label5: TLabel
                  Left = 11
                  Top = 20
                  Width = 21
                  Height = 13
                  Caption = 'CST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label11: TLabel
                  Left = 11
                  Top = 45
                  Width = 28
                  Height = 13
                  Caption = 'BASE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label12: TLabel
                  Left = 11
                  Top = 70
                  Width = 45
                  Height = 13
                  Caption = 'BASE ST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label13: TLabel
                  Left = 145
                  Top = 70
                  Width = 41
                  Height = 13
                  Caption = 'Aliq. ST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label9: TLabel
                  Left = 310
                  Top = 45
                  Width = 63
                  Height = 13
                  Caption = 'Aliq Red.ST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label29: TLabel
                  Left = 336
                  Top = 74
                  Width = 37
                  Height = 13
                  Caption = 'FCP ST'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBEdit5: TDBEdit
                  Left = 217
                  Top = 41
                  Width = 74
                  Height = 21
                  DataField = 'ALIQ_ICMS'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object DBEdit8: TDBEdit
                  Left = 57
                  Top = 16
                  Width = 74
                  Height = 21
                  DataField = 'CSTICMS'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBEdit9: TDBEdit
                  Left = 57
                  Top = 41
                  Width = 74
                  Height = 21
                  DataField = 'BASE_ICMS'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object DBEdit10: TDBEdit
                  Left = 57
                  Top = 66
                  Width = 74
                  Height = 21
                  DataField = 'BASE_ICMSST'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object DBEdit11: TDBEdit
                  Left = 217
                  Top = 66
                  Width = 74
                  Height = 21
                  DataField = 'ALIQ_ICMSST'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
                object DBEdit19: TDBEdit
                  Left = 378
                  Top = 41
                  Width = 74
                  Height = 21
                  DataField = 'ALIQ_RED_BASE_ST'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                end
                object DBEdit20: TDBEdit
                  Left = 378
                  Top = 66
                  Width = 74
                  Height = 21
                  DataField = 'PERC_FCP'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
              end
              object GroupBox3: TGroupBox
                Left = 9
                Top = 189
                Width = 608
                Height = 99
                Caption = ' PIS E COFINS '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label15: TLabel
                  Left = 40
                  Top = 20
                  Width = 76
                  Height = 13
                  Caption = 'CST ENTRADA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label14: TLabel
                  Left = 275
                  Top = 21
                  Width = 60
                  Height = 13
                  Caption = 'CST SAIDA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 471
                  Top = 20
                  Width = 28
                  Height = 13
                  Caption = 'BASE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label17: TLabel
                  Left = 42
                  Top = 46
                  Width = 74
                  Height = 13
                  Caption = 'Aliq PIS REAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label18: TLabel
                  Left = 11
                  Top = 71
                  Width = 106
                  Height = 13
                  Caption = 'Aliq PIS Presumido'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label19: TLabel
                  Left = 242
                  Top = 46
                  Width = 95
                  Height = 13
                  Caption = 'Aliq COFINS REAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label20: TLabel
                  Left = 211
                  Top = 71
                  Width = 127
                  Height = 13
                  Caption = 'Aliq COFINS Presumido'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBEdit13: TDBEdit
                  Left = 122
                  Top = 16
                  Width = 74
                  Height = 21
                  DataField = 'CSTPIS_COFINS_ENT'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBEdit12: TDBEdit
                  Left = 343
                  Top = 17
                  Width = 74
                  Height = 21
                  DataField = 'CSTPIS_COFINS'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object DBEdit14: TDBEdit
                  Left = 504
                  Top = 16
                  Width = 94
                  Height = 21
                  DataField = 'BASE_PIS_COFINS'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object DBEdit15: TDBEdit
                  Left = 122
                  Top = 42
                  Width = 74
                  Height = 21
                  DataField = 'ALIQ_PIS_REAL'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object DBEdit16: TDBEdit
                  Left = 122
                  Top = 67
                  Width = 74
                  Height = 21
                  DataField = 'ALIQ_PIS_PRESUMIDO'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
                object DBEdit17: TDBEdit
                  Left = 343
                  Top = 43
                  Width = 74
                  Height = 21
                  DataField = 'ALIQ_COFINS_REAL'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                end
                object DBEdit18: TDBEdit
                  Left = 343
                  Top = 67
                  Width = 74
                  Height = 21
                  DataField = 'ALIQ_COFINS_PRESUMIDO'
                  DataSource = DSTemplate
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
              end
            end
            object TabSheetDadosIBPT: TTabSheet
              ImageIndex = 2
              object Label8: TLabel
                Left = 16
                Top = 24
                Width = 66
                Height = 13
                Caption = 'Arquivo IBPT:'
              end
              object SpeedButton1: TSpeedButton
                Left = 416
                Top = 15
                Width = 86
                Height = 22
                Caption = 'Importar'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
                  FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
                  00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
                  F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
                  00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
                  F033777777777337F73309999990FFF0033377777777FFF77333099999000000
                  3333777777777777333333399033333333333337773333333333333903333333
                  3333333773333333333333303333333333333337333333333333}
                NumGlyphs = 2
                OnClick = SpeedButton1Click
              end
              object FilenameEdit1: TFilenameEdit
                Left = 88
                Top = 16
                Width = 321
                Height = 21
                NumGlyphs = 1
                TabOrder = 0
              end
            end
          end
          inherited PanelMaster: TPanel
            Top = 85
            Height = 9
          end
          inherited PanelCodigoDescricao: TPanel
            Height = 85
            object Label38: TLabel
              Left = 9
              Top = 3
              Width = 67
              Height = 13
              Caption = 'Cod.Interno'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 88
              Top = 3
              Width = 88
              Height = 13
              Caption = 'NCM = 8 Digitos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 352
              Top = 2
              Width = 56
              Height = 13
              Caption = 'Import %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 500
              Top = 2
              Width = 69
              Height = 13
              Caption = 'Municipal %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 86
              Top = 43
              Width = 82
              Height = 13
              Caption = 'Vigencia inicial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 191
              Top = 43
              Width = 76
              Height = 13
              Caption = 'Vigencia Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 296
              Top = 43
              Width = 35
              Height = 13
              Caption = 'Chave'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 399
              Top = 43
              Width = 39
              Height = 13
              Caption = 'Versao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 282
              Top = 2
              Width = 63
              Height = 13
              Caption = 'Nacional %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 427
              Top = 2
              Width = 64
              Height = 13
              Caption = 'Estadual %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 186
              Top = 3
              Width = 39
              Height = 13
              Caption = 'EX_TIP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 233
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 606
              Top = 2
              Width = 57
              Height = 13
              Caption = '( MVA % )'
              FocusControl = DBEdit4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 576
              Top = 2
              Width = 22
              Height = 13
              Caption = 'Und'
              FocusControl = DBEdit3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 7
              Top = 17
              Width = 71
              Height = 21
              TabStop = False
              Color = 15461355
              DataField = 'NCMICOD'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 83
              Top = 17
              Width = 97
              Height = 21
              DataField = 'NCMA30CODIGO'
              DataSource = DSTemplate
              TabOrder = 1
            end
            object DBEdit21: TDBEdit
              Left = 84
              Top = 57
              Width = 99
              Height = 21
              DataField = 'VIGENCIA_INI'
              DataSource = DSTemplate
              TabOrder = 2
            end
            object DBEdit22: TDBEdit
              Left = 189
              Top = 57
              Width = 99
              Height = 21
              DataField = 'VIGENCIA_FIM'
              DataSource = DSTemplate
              TabOrder = 3
            end
            object DBEdit23: TDBEdit
              Left = 294
              Top = 57
              Width = 99
              Height = 21
              DataField = 'CHAVE'
              DataSource = DSTemplate
              TabOrder = 4
            end
            object DBEdit24: TDBEdit
              Left = 397
              Top = 57
              Width = 99
              Height = 21
              DataField = 'VERSAO'
              DataSource = DSTemplate
              TabOrder = 5
            end
            object EvDBNumEdit1: TEvDBNumEdit
              Left = 351
              Top = 16
              Width = 70
              Height = 21
              AutoHideCalculator = False
              DataField = 'NCMN2ALIQIMP'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                E6020000424DE60200000000000042000000280000001A0000000D0000000100
                100003000000A402000000000000000000000000000000000000007C0000E003
                00001F000000FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF1CEF1C
                EF1CEF1CEF1CEF1CEF1CEF1CEF1CEF1CFF5EFF5EFF5EFF7FEF3DEF3DEF3DEF3D
                EF3DEF3DEF3DEF3DEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1CFF5EFF5EFF5EFF7F
                FF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2C
                FF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EEF3DFF5EFF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1C
                FF5EFF5EFF5EFF7FFF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5E
                FF02FF2CFF2CFF2CFF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5EFF5EFF5EFF02FF2C0700FF5EFF5EFF5E
                FF5EFF5EFF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DFF7FFF7FFF7FFF7FFF7FFF5E
                EF3DFF5EFF5EFF5EFF02FF2C0700FF7FFF7FFF7FFF7FFF5EFF2CEF1CFF5EFF5E
                FF5EFF7FFF5EEF3DFF5EFF5EFF5EFF5EFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2C
                070007000700070007000700FF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DEF3DEF3D
                EF3DEF3DEF3DFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF02FF02FF02FF02FF02FF02FF02FF02EF1CFF5EFF5EFF5EFF7F
                FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5E}
              ParentFont = False
              TabOrder = 6
            end
            object EvDBNumEdit2: TEvDBNumEdit
              Left = 425
              Top = 16
              Width = 70
              Height = 21
              AutoHideCalculator = False
              DataField = 'ALIQESTADUAL'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                E6020000424DE60200000000000042000000280000001A0000000D0000000100
                100003000000A402000000000000000000000000000000000000007C0000E003
                00001F000000FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF1CEF1C
                EF1CEF1CEF1CEF1CEF1CEF1CEF1CEF1CFF5EFF5EFF5EFF7FEF3DEF3DEF3DEF3D
                EF3DEF3DEF3DEF3DEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1CFF5EFF5EFF5EFF7F
                FF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2C
                FF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EEF3DFF5EFF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1C
                FF5EFF5EFF5EFF7FFF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5E
                FF02FF2CFF2CFF2CFF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5EFF5EFF5EFF02FF2C0700FF5EFF5EFF5E
                FF5EFF5EFF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DFF7FFF7FFF7FFF7FFF7FFF5E
                EF3DFF5EFF5EFF5EFF02FF2C0700FF7FFF7FFF7FFF7FFF5EFF2CEF1CFF5EFF5E
                FF5EFF7FFF5EEF3DFF5EFF5EFF5EFF5EFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2C
                070007000700070007000700FF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DEF3DEF3D
                EF3DEF3DEF3DFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF02FF02FF02FF02FF02FF02FF02FF02EF1CFF5EFF5EFF5EFF7F
                FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5E}
              ParentFont = False
              TabOrder = 7
            end
            object EvDBNumEdit3: TEvDBNumEdit
              Left = 498
              Top = 16
              Width = 70
              Height = 21
              AutoHideCalculator = False
              DataField = 'ALIQMUNICIPAL'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                E6020000424DE60200000000000042000000280000001A0000000D0000000100
                100003000000A402000000000000000000000000000000000000007C0000E003
                00001F000000FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF1CEF1C
                EF1CEF1CEF1CEF1CEF1CEF1CEF1CEF1CFF5EFF5EFF5EFF7FEF3DEF3DEF3DEF3D
                EF3DEF3DEF3DEF3DEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1CFF5EFF5EFF5EFF7F
                FF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2C
                FF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EEF3DFF5EFF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1C
                FF5EFF5EFF5EFF7FFF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5E
                FF02FF2CFF2CFF2CFF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5EFF5EFF5EFF02FF2C0700FF5EFF5EFF5E
                FF5EFF5EFF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DFF7FFF7FFF7FFF7FFF7FFF5E
                EF3DFF5EFF5EFF5EFF02FF2C0700FF7FFF7FFF7FFF7FFF5EFF2CEF1CFF5EFF5E
                FF5EFF7FFF5EEF3DFF5EFF5EFF5EFF5EFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2C
                070007000700070007000700FF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DEF3DEF3D
                EF3DEF3DEF3DFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF02FF02FF02FF02FF02FF02FF02FF02EF1CFF5EFF5EFF5EFF7F
                FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5E}
              ParentFont = False
              TabOrder = 8
            end
            object EvDBNumEdit4: TEvDBNumEdit
              Left = 277
              Top = 16
              Width = 70
              Height = 21
              AutoHideCalculator = False
              DataField = 'NCMN2ALIQNAC'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                E6020000424DE60200000000000042000000280000001A0000000D0000000100
                100003000000A402000000000000000000000000000000000000007C0000E003
                00001F000000FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF1CEF1C
                EF1CEF1CEF1CEF1CEF1CEF1CEF1CEF1CFF5EFF5EFF5EFF7FEF3DEF3DEF3DEF3D
                EF3DEF3DEF3DEF3DEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1CFF5EFF5EFF5EFF7F
                FF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2C
                FF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EEF3DFF5EFF5EFF5EFF02FF2CFF02FF7FFF02FF7FFF02FF7FFF2CEF1C
                FF5EFF5EFF5EFF7FFF5EEF3DFF7FEF3DFF7FEF3DFF7FFF5EEF3DFF5EFF5EFF5E
                FF02FF2CFF2CFF2CFF2CFF2CFF2CFF2CFF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5EFF5EFF5EFF02FF2C0700FF5EFF5EFF5E
                FF5EFF5EFF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DFF7FFF7FFF7FFF7FFF7FFF5E
                EF3DFF5EFF5EFF5EFF02FF2C0700FF7FFF7FFF7FFF7FFF5EFF2CEF1CFF5EFF5E
                FF5EFF7FFF5EEF3DFF5EFF5EFF5EFF5EFF7FFF5EEF3DFF5EFF5EFF5EFF02FF2C
                070007000700070007000700FF2CEF1CFF5EFF5EFF5EFF7FFF5EEF3DEF3DEF3D
                EF3DEF3DEF3DFF5EEF3DFF5EFF5EFF5EFF02FF2CFF2CFF2CFF2CFF2CFF2CFF2C
                FF2CEF1CFF5EFF5EFF5EFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EEF3DFF5E
                FF5EFF5EFF02FF02FF02FF02FF02FF02FF02FF02FF02EF1CFF5EFF5EFF5EFF7F
                FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5EFF5E
                FF5EFF5EFF5EFF5EFF5E}
              ParentFont = False
              TabOrder = 9
            end
            object DBEdit6: TDBEdit
              Left = 186
              Top = 17
              Width = 41
              Height = 21
              DataField = 'NCMIEX_TIP'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object DBEdit7: TDBEdit
              Left = 232
              Top = 16
              Width = 41
              Height = 21
              DataField = 'NCMITABELA'
              DataSource = DSTemplate
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
            object DBEdit4: TDBEdit
              Left = 606
              Top = 15
              Width = 80
              Height = 21
              DataField = 'MVA'
              DataSource = DSTemplate
              TabOrder = 12
            end
            object DBEdit3: TDBEdit
              Left = 572
              Top = 15
              Width = 31
              Height = 21
              DataField = 'NCMA5UNIDADE'
              DataSource = DSTemplate
              TabOrder = 13
            end
          end
        end
      end
    end
  end
  inherited PopupMenuDiversos: TPopupMenu
    object ImportarArquivoIBPTAtual1: TMenuItem
      Caption = 'Importar TabelaIBPT'
      OnClick = ImportarArquivoIBPTAtual1Click
    end
    object ImportarArquivoSuperTributario: TMenuItem
      Caption = 'Importar Arquivo Super Tributario.csv'
      OnClick = ImportarArquivoSuperTributarioClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object FiltrarNCMssemAliquotasMedia1: TMenuItem
      Caption = 'Filtrar NCMs sem Aliquotas Media'
      OnClick = FiltrarNCMssemAliquotasMedia1Click
    end
    object CorrigeNCMmenorque8digitos1: TMenuItem
      Caption = 'Corrige NCM menor que 8 digitos'
      OnClick = CorrigeNCMmenorque8digitos1Click
    end
  end
  inherited SQLTemplate: TRxQuery
    Tag = 1
    SQL.Strings = (
      'Select * From NCM Where (%MFiltro)')
    object SQLTemplateNCMICOD: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod.Interno'
      FieldName = 'NCMICOD'
      Origin = 'DB.NCM.NCMICOD'
      Visible = False
    end
    object SQLTemplateNCMA30CODIGO: TStringField
      DisplayLabel = 'Codigo NCM'
      FieldName = 'NCMA30CODIGO'
      Origin = 'DB.NCM.NCMA30CODIGO'
      EditMask = '00000000;0; '
      Size = 30
    end
    object SQLTemplateNCMA100DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NCMA100DESCR'
      Origin = 'DB.NCM.NCMA100DESCR'
      Size = 100
    end
    object SQLTemplateNCMA5UNIDADE: TStringField
      DisplayLabel = 'Un Medida'
      FieldName = 'NCMA5UNIDADE'
      Origin = 'DB.NCM.NCMA5UNIDADE'
      Size = 5
    end
    object SQLTemplateALIQUOTAINTERNA: TFloatField
      FieldName = 'ALIQUOTAINTERNA'
      Origin = 'DB.NCM.ALIQUOTAINTERNA'
      DisplayFormat = ',0.000'
    end
    object SQLTemplateMVA: TFloatField
      FieldName = 'MVA'
      Origin = 'DB.NCM.MVA'
      DisplayFormat = ',0.000'
    end
    object SQLTemplateNCMIEX_TIP: TIntegerField
      FieldName = 'NCMIEX_TIP'
      Origin = 'DB.NCM.NCMIEX_TIP'
    end
    object SQLTemplateNCMITABELA: TIntegerField
      DisplayLabel = 'Tabela Olho Imposto'
      FieldName = 'NCMITABELA'
      Origin = 'DB.NCM.NCMITABELA'
    end
    object SQLTemplateNCMN2ALIQNAC: TFloatField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Aliq.Media Produtos Nacional'
      FieldName = 'NCMN2ALIQNAC'
      Origin = 'DB.NCM.NCMN2ALIQNAC'
    end
    object SQLTemplateNCMN2ALIQIMP: TFloatField
      ConstraintErrorMessage = '1'
      DisplayLabel = 'Aliq.Media Produtos Importados'
      FieldName = 'NCMN2ALIQIMP'
      Origin = 'DB.NCM.NCMN2ALIQIMP'
    end
    object SQLTemplateREGISTRO: TDateTimeField
      FieldName = 'REGISTRO'
      Origin = 'DB.NCM.REGISTRO'
    end
    object SQLTemplatePENDENTE: TStringField
      FieldName = 'PENDENTE'
      Origin = 'DB.NCM.PENDENTE'
      FixedChar = True
      Size = 1
    end
    object SQLTemplateCSTICMS: TIntegerField
      FieldName = 'CSTICMS'
      Origin = 'DB.NCM.CSTICMS'
    end
    object SQLTemplateBASE_ICMS: TFloatField
      FieldName = 'BASE_ICMS'
      Origin = 'DB.NCM.BASE_ICMS'
      Precision = 9
    end
    object SQLTemplateALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
      Origin = 'DB.NCM.ALIQ_ICMS'
      Precision = 9
    end
    object SQLTemplateBASE_ICMSST: TFloatField
      FieldName = 'BASE_ICMSST'
      Origin = 'DB.NCM.BASE_ICMSST'
      Precision = 9
    end
    object SQLTemplateALIQ_ICMSST: TFloatField
      FieldName = 'ALIQ_ICMSST'
      Origin = 'DB.NCM.ALIQ_ICMSST'
      Precision = 9
    end
    object SQLTemplateCSTPIS_COFINS_ENT: TStringField
      FieldName = 'CSTPIS_COFINS_ENT'
      Origin = 'DB.NCM.CSTPIS_COFINS_ENT'
      Size = 3
    end
    object SQLTemplateCSTPIS_COFINS: TStringField
      FieldName = 'CSTPIS_COFINS'
      Origin = 'DB.NCM.CSTPIS_COFINS'
      Size = 2
    end
    object SQLTemplateBASE_PIS_COFINS: TFloatField
      FieldName = 'BASE_PIS_COFINS'
      Origin = 'DB.NCM.BASE_PIS_COFINS'
      Precision = 9
    end
    object SQLTemplateALIQ_PIS_REAL: TFloatField
      FieldName = 'ALIQ_PIS_REAL'
      Origin = 'DB.NCM.ALIQ_PIS_REAL'
      Precision = 9
    end
    object SQLTemplateALIQ_PIS_PRESUMIDO: TFloatField
      FieldName = 'ALIQ_PIS_PRESUMIDO'
      Origin = 'DB.NCM.ALIQ_PIS_PRESUMIDO'
      Precision = 9
    end
    object SQLTemplateALIQ_COFINS_REAL: TFloatField
      FieldName = 'ALIQ_COFINS_REAL'
      Origin = 'DB.NCM.ALIQ_COFINS_REAL'
      Precision = 9
    end
    object SQLTemplateALIQ_COFINS_PRESUMIDO: TFloatField
      FieldName = 'ALIQ_COFINS_PRESUMIDO'
      Origin = 'DB.NCM.ALIQ_COFINS_PRESUMIDO'
      Precision = 9
    end
    object SQLTemplateCPITN2IMPOSTOMED: TFloatField
      FieldName = 'CPITN2IMPOSTOMED'
      Origin = 'DB.NCM.CPITN2IMPOSTOMED'
    end
    object SQLTemplateNFITN2IMPOSTOMED: TFloatField
      FieldName = 'NFITN2IMPOSTOMED'
      Origin = 'DB.NCM.NFITN2IMPOSTOMED'
    end
    object SQLTemplateALIQESTADUAL: TFloatField
      FieldName = 'ALIQESTADUAL'
      Origin = 'DB.NCM.ALIQESTADUAL'
    end
    object SQLTemplateALIQMUNICIPAL: TFloatField
      FieldName = 'ALIQMUNICIPAL'
      Origin = 'DB.NCM.ALIQMUNICIPAL'
    end
    object SQLTemplateVIGENCIA_INI: TDateTimeField
      FieldName = 'VIGENCIA_INI'
      Origin = 'DB.NCM.VIGENCIA_INI'
    end
    object SQLTemplateVIGENCIA_FIM: TDateTimeField
      FieldName = 'VIGENCIA_FIM'
      Origin = 'DB.NCM.VIGENCIA_FIM'
    end
    object SQLTemplateCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'DB.NCM.CHAVE'
      Size = 10
    end
    object SQLTemplateVERSAO: TStringField
      FieldName = 'VERSAO'
      Origin = 'DB.NCM.VERSAO'
      Size = 10
    end
    object SQLTemplateCEST: TStringField
      FieldName = 'CEST'
      Origin = 'DB.NCM.CEST'
      Size = 10
    end
    object SQLTemplateALIQ_RED_BASE_ST: TFloatField
      FieldName = 'ALIQ_RED_BASE_ST'
      Origin = 'DB.NCM.ALIQ_RED_BASE_ST'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object SQLTemplatePERC_FCP: TFloatField
      FieldName = 'PERC_FCP'
      Origin = 'DB.NCM.PERC_FCP'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
end
