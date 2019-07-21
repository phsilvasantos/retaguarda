inherited FormCadastroNCMUF: TFormCadastroNCMUF
  Left = 262
  Top = 38
  Caption = 'Cadastro NCM por UF'
  ClientHeight = 597
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxFundo: TScrollBox
    Height = 597
    inherited PanelCentral: TPanel
      Height = 523
      inherited PanelBarra: TPanel
        Height = 523
      end
      inherited PanelFundoDados: TPanel
        Height = 523
        inherited Panel5: TPanel
          Height = 523
          inherited PagePrincipal: TPageControl
            Height = 441
            inherited TabSheetConsulta: TTabSheet
              inherited DBGridLista: TDBGrid
                Height = 368
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'UF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MVAINTERNO'
                    Title.Caption = 'MVA Interno'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERC_RED_MVA'
                    Title.Caption = '% Redu'#231#227'o MVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERC_RED_MVA_GERAL'
                    Title.Caption = '% Redu'#231#227'o MVA Geral'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AJUSTAR_MVA'
                    Title.Caption = 'Ajustar MVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERC_ICMS_INTERNO'
                    Title.Caption = '% ICMS Interno'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBS_LEI'
                    Title.Caption = 'OBS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERC_RED_BASE_ST'
                    Title.Caption = '% Redu'#231#227'o Base ST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERC_RED_BASE_ST_SIMPLES'
                    Title.Caption = '% Redu'#231#227'o Base ST Simples'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERC_RED_MVA_CLI_GERAL'
                    Title.Caption = '% Redu'#231#227'o MVA Geral'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERC_RED_MVA_CLI_SIMPLES'
                    Title.Caption = '% Redu'#231#227'o MVA Simples'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ICMUA30NOMEESTADO'
                    Title.Caption = 'Nome UF'
                    Visible = True
                  end>
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
              object Label3: TLabel
                Left = 20
                Top = 40
                Width = 66
                Height = 13
                Caption = 'MVAINTERNO'
                FocusControl = DBEdit4
              end
              object Label4: TLabel
                Left = 20
                Top = 80
                Width = 80
                Height = 13
                Caption = '% Redu'#231#227'o MVA'
                FocusControl = DBEdit5
              end
              object Label5: TLabel
                Left = 176
                Top = 80
                Width = 108
                Height = 13
                Caption = '% Redu'#231#227'o MVA Geral'
                FocusControl = DBEdit6
              end
              object Label7: TLabel
                Left = 20
                Top = 122
                Width = 78
                Height = 13
                Caption = '% ICMS Interno'
                FocusControl = DBEdit8
              end
              object Label8: TLabel
                Left = 20
                Top = 244
                Width = 59
                Height = 13
                Caption = 'OBS (N'#186' Lei)'
                FocusControl = DBEdit9
              end
              object Label9: TLabel
                Left = 20
                Top = 162
                Width = 97
                Height = 13
                Caption = '% Redu'#231#227'o Base ST'
                FocusControl = DBEdit10
              end
              object Label10: TLabel
                Left = 184
                Top = 162
                Width = 135
                Height = 13
                Caption = '% Redu'#231#227'o Base ST Simples'
                FocusControl = DBEdit11
              end
              object Label11: TLabel
                Left = 20
                Top = 202
                Width = 108
                Height = 13
                Caption = '% Redu'#231#227'o MVA Geral'
                FocusControl = DBEdit12
              end
              object Label12: TLabel
                Left = 184
                Top = 202
                Width = 118
                Height = 13
                Caption = '% Redu'#231#227'o MVA Simples'
                FocusControl = DBEdit13
              end
              object Label1: TLabel
                Left = 20
                Top = 2
                Width = 14
                Height = 13
                Caption = 'UF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 87
                Top = 2
                Width = 90
                Height = 13
                Caption = 'Nome do Estado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit4: TDBEdit
                Left = 20
                Top = 56
                Width = 134
                Height = 21
                DataField = 'MVAINTERNO'
                DataSource = DSTemplate
                TabOrder = 0
              end
              object DBEdit5: TDBEdit
                Left = 20
                Top = 96
                Width = 134
                Height = 21
                DataField = 'PERC_RED_MVA'
                DataSource = DSTemplate
                TabOrder = 1
              end
              object DBEdit6: TDBEdit
                Left = 176
                Top = 96
                Width = 134
                Height = 21
                DataField = 'PERC_RED_MVA_GERAL'
                DataSource = DSTemplate
                TabOrder = 2
              end
              object DBEdit8: TDBEdit
                Left = 20
                Top = 138
                Width = 134
                Height = 21
                DataField = 'PERC_ICMS_INTERNO'
                DataSource = DSTemplate
                TabOrder = 3
              end
              object DBEdit9: TDBEdit
                Left = 20
                Top = 260
                Width = 717
                Height = 21
                DataField = 'OBS_LEI'
                DataSource = DSTemplate
                TabOrder = 4
              end
              object DBEdit10: TDBEdit
                Left = 20
                Top = 178
                Width = 134
                Height = 21
                DataField = 'PERC_RED_BASE_ST'
                DataSource = DSTemplate
                TabOrder = 5
              end
              object DBEdit11: TDBEdit
                Left = 184
                Top = 178
                Width = 134
                Height = 21
                DataField = 'PERC_RED_BASE_ST_SIMPLES'
                DataSource = DSTemplate
                TabOrder = 6
              end
              object DBEdit12: TDBEdit
                Left = 20
                Top = 218
                Width = 134
                Height = 21
                DataField = 'PERC_RED_MVA_CLI_GERAL'
                DataSource = DSTemplate
                TabOrder = 7
              end
              object DBEdit13: TDBEdit
                Left = 184
                Top = 218
                Width = 134
                Height = 21
                DataField = 'PERC_RED_MVA_CLI_SIMPLES'
                DataSource = DSTemplate
                TabOrder = 8
              end
              object ComboUFRes: TRxDBComboBox
                Left = 20
                Top = 16
                Width = 58
                Height = 21
                Style = csDropDownList
                DataField = 'UF'
                DataSource = DSTemplate
                EnableValues = True
                ItemHeight = 13
                Items.Strings = (
                  'AC'
                  'AL'
                  'AM'
                  'AP'
                  'BA'
                  'CE'
                  'DF'
                  'ES'
                  'GO'
                  'MA'
                  'MG'
                  'MS'
                  'PA'
                  'PB'
                  'PE'
                  'PI'
                  'PR'
                  'MT'
                  'RJ'
                  'RN'
                  'RO'
                  'RR'
                  'RS'
                  'SC'
                  'SE'
                  'SP'
                  'TO'
                  'EX')
                TabOrder = 9
                Values.Strings = (
                  'AC'
                  'AL'
                  'AM'
                  'AP'
                  'BA'
                  'CE'
                  'DF'
                  'ES'
                  'GO'
                  'MA'
                  'MG'
                  'MS'
                  'PA'
                  'PB'
                  'PE'
                  'PI'
                  'PR'
                  'MT'
                  'RJ'
                  'RN'
                  'RO'
                  'RR'
                  'RS'
                  'SC'
                  'SE'
                  'SP'
                  'TO'
                  'EX')
                OnChange = ComboUFResChange
              end
              object DBEdit3: TDBEdit
                Left = 83
                Top = 16
                Width = 530
                Height = 21
                TabStop = False
                DataField = 'ICMUA30NOMEESTADO'
                DataSource = DSTemplate
                Enabled = False
                TabOrder = 10
              end
              object DBCheckBox1: TDBCheckBox
                Left = 176
                Top = 56
                Width = 97
                Height = 17
                Caption = 'Ajustar MVA'
                DataField = 'AJUSTAR_MVA'
                DataSource = DSTemplate
                TabOrder = 11
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
            end
          end
          inherited PanelCodigoDescricao: TPanel
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
            object DBEdit1: TDBEdit
              Left = 7
              Top = 17
              Width = 71
              Height = 21
              TabStop = False
              Color = 15461355
              DataField = 'NCMICOD'
              DataSource = DSMasterTemplate
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
              DataSource = DSMasterTemplate
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited SQLTemplate: TRxQuery
    OnCalcFields = SQLTemplateCalcFields
    SQL.Strings = (
      'Select * From NCM_UF'
      ' Where NCMICOD = :NCMICOD and (%MFiltro)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NCMICOD'
        ParamType = ptInput
      end>
    object SQLTemplateNCMICOD: TIntegerField
      FieldName = 'NCMICOD'
      Origin = 'DB.NCM_UF.NCMICOD'
      DisplayFormat = 'Codigo NCM'
    end
    object SQLTemplateUF: TStringField
      DisplayLabel = 'Unidade Federa'#231#227'o'
      FieldName = 'UF'
      Origin = 'DB.NCM_UF.UF'
      Size = 2
    end
    object SQLTemplateMVAINTERNO: TFloatField
      FieldName = 'MVAINTERNO'
      Origin = 'DB.NCM_UF.MVAINTERNO'
    end
    object SQLTemplatePERC_RED_MVA: TFloatField
      FieldName = 'PERC_RED_MVA'
      Origin = 'DB.NCM_UF.PERC_RED_MVA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePERC_RED_MVA_GERAL: TFloatField
      FieldName = 'PERC_RED_MVA_GERAL'
      Origin = 'DB.NCM_UF.PERC_RED_MVA_GERAL'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplateAJUSTAR_MVA: TStringField
      FieldName = 'AJUSTAR_MVA'
      Origin = 'DB.NCM_UF.AJUSTAR_MVA'
      FixedChar = True
      Size = 1
    end
    object SQLTemplatePERC_ICMS_INTERNO: TFloatField
      FieldName = 'PERC_ICMS_INTERNO'
      Origin = 'DB.NCM_UF.PERC_ICMS_INTERNO'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplateOBS_LEI: TStringField
      FieldName = 'OBS_LEI'
      Origin = 'DB.NCM_UF.OBS_LEI'
      Size = 100
    end
    object SQLTemplatePERC_RED_BASE_ST: TFloatField
      FieldName = 'PERC_RED_BASE_ST'
      Origin = 'DB.NCM_UF.PERC_RED_BASE_ST'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePERC_RED_BASE_ST_SIMPLES: TFloatField
      FieldName = 'PERC_RED_BASE_ST_SIMPLES'
      Origin = 'DB.NCM_UF.PERC_RED_BASE_ST_SIMPLES'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePERC_RED_MVA_CLI_GERAL: TFloatField
      FieldName = 'PERC_RED_MVA_CLI_GERAL'
      Origin = 'DB.NCM_UF.PERC_RED_MVA_CLI_GERAL'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplatePERC_RED_MVA_CLI_SIMPLES: TFloatField
      FieldName = 'PERC_RED_MVA_CLI_SIMPLES'
      Origin = 'DB.NCM_UF.PERC_RED_MVA_CLI_SIMPLES'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object SQLTemplateICMUA30NOMEESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'ICMUA30NOMEESTADO'
      Size = 30
      Calculated = True
    end
  end
end
