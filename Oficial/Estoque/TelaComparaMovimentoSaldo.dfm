inherited FormTelaGeralComparaMovimentoSaldo: TFormTelaGeralComparaMovimentoSaldo
  Left = 280
  Top = 102
  Width = 943
  Height = 472
  Caption = 'Compara Estoque - Movimento x Saldo'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxFundo: TScrollBox
    Width = 927
    Height = 433
    inherited PanelCentral: TPanel
      Width = 923
      Height = 349
      inherited PanelBarra: TPanel
        Top = 54
        Width = 0
        Height = 295
      end
      object PanelTopBxDocREc: TPanel
        Left = 0
        Top = 0
        Width = 923
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        Color = 16249066
        TabOrder = 1
        object Label1: TLabel
          Left = 14
          Top = 9
          Width = 95
          Height = 13
          Caption = '&Procura Produto '
          FocusControl = CodProd
          Font.Charset = ANSI_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnProduto: TSpeedButton
          Left = 95
          Top = 24
          Width = 21
          Height = 21
          Hint = 'Acessa Produtos'
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
          OnClick = BtnProdutoClick
        end
        object DescrProd: TLabel
          Left = 118
          Top = 27
          Width = 273
          Height = 18
          AutoSize = False
          Color = 16249066
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object CKAtivos: TCheckBox
          Left = 157
          Top = 8
          Width = 112
          Height = 17
          Caption = 'Somente Ativos'
          Checked = True
          Color = 16249066
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
        object CodProd: TEdit
          Left = 10
          Top = 25
          Width = 86
          Height = 21
          TabOrder = 1
          OnKeyDown = CodProdKeyDown
        end
      end
      object DBGridLista: TDBGrid
        Left = 0
        Top = 54
        Width = 923
        Height = 295
        Align = alClient
        BorderStyle = bsNone
        Color = 16249066
        DataSource = dsProdutosTemp
        FixedColor = 10053171
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgAlwaysShowSelection, dgConfirmDelete]
        ParentFont = False
        PopupMenu = ppmSelecionarTodos
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnCellClick = DBGridListaCellClick
        OnColEnter = DBGridListaColEnter
        OnColExit = DBGridListaColExit
        OnDrawColumnCell = DBGridListaDrawColumnCell
        OnKeyDown = DBGridListaKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SaldoMovimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SaldoProduto'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Marcar'
            Visible = True
          end>
      end
    end
    inherited ScrollBoxTopo: TScrollBox
      Width = 923
      inherited PanelCabecalho: TPanel
        Width = 923
        inherited PanelNavigator: TPanel
          Width = 923
          inherited AdvPanelNavigator: TAdvOfficeStatusBar
            Width = 923
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
            object BtnAtualizarSaldo: TSpeedButton
              Tag = 3
              Left = 107
              Top = 4
              Width = 135
              Height = 25
              Cursor = crHandPoint
              Hint = 'Atualizar o Saldo'
              Caption = '&Atualizar o Saldo'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                92050000424D860900000000000036080000280000000C0000000E0000000100
                1000030000005001000000000000000000000001000000000000007C0000E003
                00001F00000000000000A7C2B300588C7000719D85004D7B620086AB9700436C
                56009EBDA2007497780084AC88004A765E006685690055886D00518268005080
                660056896D003E634F00FFFFFF00000000000000000000000000000000000000
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
                000000000000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
                FF7FFF7FFF7F00000C320000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000B042
                B0420000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000B0420A3687250000FF7F
                FF7FFF7FFF7FFF7FFF7F0000B042B0420932E9310000FF7FFF7FFF7FFF7FFF7F
                0000B042B0420C3200000A36A7290000FF7FFF7FFF7FFF7F0000B0424E3A0000
                0000C82D2A360000FF7FFF7FFF7F0000B042B04200000000FF7F00002A36A729
                0000FF7FFF7F0000F34E4E3A0000FF7FFF7F00006D422A360000FF7FFF7FFF7F
                00000000FF7FFF7FFF7FFF7F00006D42A7290000FF7FFF7FFF7FFF7FFF7FFF7F
                FF7FFF7F0000B04A2A360000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
                6D42E92D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000014572A360000FF7F
                FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F}
              ParentFont = False
              Spacing = 10
              OnClick = BtnAtualizarSaldoClick
            end
          end
        end
      end
    end
  end
  object TblMovimentoTemp: TTable
    DatabaseName = 'UNITGESTAO_TEMP'
    TableName = 'MovimentoSaldoTemp.db'
    Left = 262
    Top = 5
    object TblMovimentoTempCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TblMovimentoTempDescricao: TStringField
      DisplayLabel = 'Desci'#231#227'o'
      FieldName = 'Descricao'
      Size = 60
    end
    object TblMovimentoTempSaldoMovimento: TFloatField
      DisplayLabel = 'Saldo Movimento'
      FieldName = 'SaldoMovimento'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object TblMovimentoTempSaldoProduto: TFloatField
      DisplayLabel = 'Saldo Produto'
      FieldName = 'SaldoProduto'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object TblMovimentoTempMarcar: TBooleanField
      FieldName = 'Marcar'
    end
  end
  object dsProdutosTemp: TDataSource
    DataSet = TblMovimentoTemp
    Left = 290
    Top = 5
  end
  object SQLMovimentoSaldo: TRxQuery
    Tag = 2
    DatabaseName = 'DB'
    SQL.Strings = (
      'with ESTOQUE'
      
        'as (select sum(COALESCE(M.MVESN3QTDENTRADA,0) - COALESCE(M.MVESN' +
        '3QTDSAIDA,0)) SALDO_MOVIMENTO,'
      '           (select PS.PSLDN3QTDE'
      '            from PRODUTOSALDO PS'
      '            where %MEmpresa and'
      
        '                  PS.PRODICOD = M.PRODICOD) SALDO_PRODUTO, M.EMP' +
        'RICOD, M.PRODICOD, P.PRODA60DESCR, P.PRODA60REFER'
      '    from MOVIMENTOESTOQUE M'
      '    left outer join PRODUTO P on M.PRODICOD = P.PRODICOD'
      '    where %MProduto and'
      '      %MEmpresa and '
      '      %MAtivo'
      
        '    group by M.EMPRICOD, M.PRODICOD, P.PRODA60DESCR, P.PRODA60RE' +
        'FER'
      '    order by M.PRODICOD)'
      'select *'
      'from ESTOQUE   '
      
        'WHERE (SALDO_MOVIMENTO > 0 or SALDO_PRODUTO > 0) and (SALDO_MOVI' +
        'MENTO <> SALDO_PRODUTO)')
    Macros = <
      item
        DataType = ftString
        Name = 'MEmpresa'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MProduto'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MAtivo'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 322
    Top = 5
  end
  object ppmSelecionarTodos: TPopupMenu
    Left = 504
    Top = 232
    object Selecionartodosregistros1: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = Selecionartodosregistros1Click
    end
  end
end
