inherited FormCadastroTipoDocumento: TFormCadastroTipoDocumento
  Left = 190
  Top = 74
  Caption = 'Cadastro de Tipos de Documentos'
  ClientWidth = 946
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxFundo: TScrollBox
    Width = 946
    inherited PanelCabecalho: TPanel
      Width = 944
      inherited ScrollBoxPanelCabecalho: TScrollBox
        Width = 944
        inherited Panel1: TPanel
          Width = 942
          inherited PanelNavigator: TPanel
            Width = 942
            inherited AdvPanelNavigator: TAdvOfficeStatusBar
              Width = 942
            end
          end
          inherited PanelLeft: TPanel
            Left = 485
          end
        end
      end
    end
    inherited PanelCentral: TPanel
      Width = 944
      inherited PanelFundoDados: TPanel
        Width = 814
        inherited Panel5: TPanel
          Width = 814
          inherited PagePrincipal: TPageControl
            Width = 814
            ActivePage = TabSheetDadosPrincipais
            inherited TabSheetConsulta: TTabSheet
              inherited DBGridLista: TDBGrid
                Width = 806
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'TPDCICOD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TPDCA60DESCR'
                    Width = 561
                    Visible = True
                  end>
              end
              inherited PanelProcura: TPanel
                Width = 806
                inherited PanelBetween: TPanel
                  Width = 412
                  inherited AdvPanel1: TAdvPanel
                    Width = 412
                    FullHeight = 0
                  end
                end
                inherited PanelEditProcura: TPanel
                  Width = 412
                  inherited AdvPanelEditProcura: TAdvPanel
                    Width = 412
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
          inherited PanelMaster: TPanel
            Width = 814
          end
          inherited PanelCodigoDescricao: TPanel
            Width = 814
            object Label1: TLabel
              Left = 6
              Top = 3
              Width = 38
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = DBEdit1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 75
              Top = 3
              Width = 112
              Height = 13
              Caption = 'Valor Taxa Banc'#225'ria'
              FocusControl = DBEdit2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 530
              Top = 3
              Width = 112
              Height = 13
              Caption = 'Valor Taxa Banc'#225'ria'
              FocusControl = DBEdit2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 5
              Top = 16
              Width = 64
              Height = 21
              DataField = 'TPDCICOD'
              DataSource = DSTemplate
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 74
              Top = 16
              Width = 455
              Height = 21
              DataField = 'TPDCA60DESCR'
              DataSource = DSTemplate
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 530
              Top = 16
              Width = 127
              Height = 21
              DataField = 'VLRTAXA'
              DataSource = DSTemplate
              TabOrder = 2
            end
            object chkSomaQuitados: TDBCheckBox
              Left = 664
              Top = 20
              Width = 97
              Height = 17
              Caption = 'Soma Quitados'
              DataField = 'SOMA_QUITADO'
              DataSource = DSTemplate
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
      end
    end
  end
  inherited SQLTemplate: TRxQuery
    Tag = 1
    SQL.Strings = (
      'Select * From TIPODOCUMENTO Where (%MFiltro)')
    object SQLTemplateTPDCICOD: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      FieldName = 'TPDCICOD'
      Origin = 'DB.TIPODOCUMENTO.TPDCICOD'
      Visible = False
    end
    object SQLTemplateTPDCA60DESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TPDCA60DESCR'
      Origin = 'DB.TIPODOCUMENTO.TPDCA60DESCR'
      FixedChar = True
      Size = 30
    end
    object SQLTemplatePENDENTE: TStringField
      FieldName = 'PENDENTE'
      Origin = 'DB.TIPODOCUMENTO.PENDENTE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SQLTemplateREGISTRO: TDateTimeField
      FieldName = 'REGISTRO'
      Origin = 'DB.TIPODOCUMENTO.REGISTRO'
      Visible = False
    end
    object SQLTemplateVLRTAXA: TFloatField
      FieldName = 'VLRTAXA'
      Origin = 'EASY_GESTAO.TIPODOCUMENTO.VLRTAXA'
    end
    object SQLTemplateSOMA_QUITADO: TStringField
      FieldName = 'SOMA_QUITADO'
      Origin = 'DB.TIPODOCUMENTO.SOMA_QUITADO'
      FixedChar = True
      Size = 1
    end
  end
end
