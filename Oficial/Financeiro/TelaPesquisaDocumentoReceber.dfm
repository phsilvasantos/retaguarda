object FormTelaPesquisarDocumentoReceber: TFormTelaPesquisarDocumentoReceber
  Left = 276
  Top = 125
  Width = 934
  Height = 461
  Caption = 'Pesquisa de Documentos '#224' Receber'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBoxFundo: TScrollBox
    Left = 0
    Top = 0
    Width = 918
    Height = 422
    Align = alClient
    TabOrder = 0
    object PanelCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 914
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
        Top = 0
        Width = 359
        Height = 26
        Caption = 'Pesquisa de Documentos '#224' Receber'
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
        Width = 914
        Height = 32
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object BtnFecharTela: TSpeedButton
          Tag = 3
          Left = 534
          Top = 3
          Width = 74
          Height = 25
          Cursor = crHandPoint
          Hint = 'Fechar Tela'
          Caption = '&Fechar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
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
        object AdvPanelNavigator: TAdvOfficeStatusBar
          Left = 0
          Top = 0
          Width = 914
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
          object SpeedButton1: TSpeedButton
            Tag = 3
            Left = 706
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
          object BtExecutar: TSpeedButton
            Tag = 3
            Left = 18
            Top = 3
            Width = 242
            Height = 25
            Cursor = crHandPoint
            Hint = 'Fechar Tela'
            Caption = '&Exportar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 8404992
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Glyph.Data = {
              360C0000424D360C000000000000360000002800000020000000200000000100
              180000000000000C0000CE0E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF0000000000
              00CF3000CF3000CF3000CF3000CF3000CF3000CF3000000000000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF0097CF0000000097CF0097FF006790000000006700006700003000FF30
              2FFF302FFF302FFF302FFF302FFF302FCF3000FF302FCF300000300000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0097CF00C8FF0000000097FF00679000000000670000972F00972F00972F0030
              00FF302FFF302FFF672FFF672FFF302FFF302FFF302F00300000672F003000CF
              3000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0097CF00C8FF0000000067900000000067002FC82F00972F2FC82F00972F0097
              2F003000FF302FFF672FFF302FFF672FFF302FFF302F00300060C82F003000CF
              3000CF3000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0097CF00C8FF0097CF00000000670060FF2F2FC82F2FC82F2FC82F00972F2FC8
              2F00972F003000FF672FFF672FFF672FFF672FFF672FFF672FFF302FFF302F00
              300000672F00672F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0097CF00C8FF0097FF0097CF0000002FC82F60FF2F2FC82F2FC82F2FC82F0097
              2F00972F003000FF672FFF672FFF672FFF672FFF672FFF302FFF302F00300000
              7F00007F00003000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF0097CF00C8FF0097FF0097CF0000002FC82F2FC82F60FF2F2FC82F2FC8
              2F00972F00972F003000FF672FFF672FFF672FFF672FFF302F00300000972F00
              7F00007F00007F0000672F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF0097CFCFFFFF00C8FF0097FF0097CF00000060FF2F2FC82F2FC82F2FC8
              2F00972F00972F003000FF672F00000000000000000000000000000000000000
              0000000000007F00003000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0097CF90FFFF00C8FF0097FF0097CF0000002FC82F00972F7F7F
              00000000FF9700FF672FFF672F0097CF00C8FF00C8FF0097FF0097FF0097FF00
              000000972F007F00007F00003000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0097CFCFFFFF90FFFF00C8FF0097FF0097CF0000000067000000
              00000000FF9700FF9700FF97000097CF90FFFF00C8FF00C8FF0097FF00000000
              7F00007F0000972F007F0000672F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF2FC82F0097CFCFFFFF90FFFF00C8FF0097FF0097CF0000000097
              FF000000FF9700FF9700FF97000097CF90FFFF90FFFF00C8FF0097FF0097CF00
              000000972F007F00007F00003000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFEFC8A02FC82F0097CFCFFFFF90FFFF00C8FF0097FF0097FF0097
              FF000000FF9700FFC82FFF97000097CF90FFFF90FFFF90FFFF00C8FF0097FF00
              97CF00000000972F007F0000672F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFEFC8A0FFFFCF2FC82F0097CFCFFFFF90FFFF00C8FF00C8FF0097
              FF000000FF9700FFC82FFFC82F0097CF90FFFF0097CFCFFFFF90FFFF00C8FF00
              97FF0097CF00000000972F00672F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFEFC8A0FFFFFFFFFFCFFFFFCF2F676090FFFF90FFFF00C8FF00C8
              FF000000FFC82FFF9700FF97000097CF0097CF00672F0097CFCFFFFF90FFFF00
              C8FF0097FF0097CF00000000672F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFEFC8A0FFFFCFFFFFCF2F676090FFFF90FFFF90FFFF90FFFF00C8
              FF000000FFC82FFFC82FFFC82F0097CFFF9700FF9700FF672F0097CFCFFFFF90
              FFFF00C8FF0097FF00000000672F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFEFC8A00097CF0097CF0097CF0097CF0097CF0097CF0097
              CF000000FFC82FFFC82FFFFF2F007F00FFC82F007F0000672F0030000097CFCF
              FFFF90FFFF00C8FF0097FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFEFC8A0FFFFFFFFFFCFFFFF2F00672F2FC82F00972F0067
              2FFFC82FFFC82FFFC82FFF9700FFC82FFF9700FFC82F2FC82F00672F00300000
              97CFCFFFFF90FFFF00C8FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFEFC8A0FFFFFF00672F2FC82F2FC82F00972F0097
              2FFF9700FFC82FFFC82FFFC82FFF9700FFC82FFF9700007F002FC82F007F00FF
              672F0097CFCFFFFF90FFFF0097CF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00672F60FF2F60FF2F2FC82F00972F0097
              2F00672FFF9700FFC82FFFC82FFFC82FFF9700FFC82FFFC82F007F00FF672FFF
              672FFF672F0097CFCFFFFF0097FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC82FCFFFCFCFFFCF60FF2F2FC82F2FC8
              2F00972F00972F00672FFFC82F00672F00672FFF672FFF9700FF9700FF9700FF
              672F2F67600067900097CF00C8FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC82FFFFFFFCFFFCF60FF2F60FF
              2F2FC82F00972F00972F00672F00972F00972F00672FFF672FFF9700FF9700FF
              672F00C8FF0097FF00679000C8FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC82F2FC82FCFFFCF60FF
              2F60FF2F2FC82F2FC82F2FC82F00972F00972F00972F00672FFF672FFF672F00
              C8FF0097FF0097FF006790006790FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC82F2FC8
              2FCFFFCFFFFFFFCFFFCF60FF2F60FF2F2FC82F2FC82F00972F00672FFFFFFF00
              97CF0097CF0097CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF2FC82F2FC82F2FC82F2FC82F2FC82F2FC82F2FC82FFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentFont = False
          end
        end
        object AdvOfficeStatusBar1: TAdvOfficeStatusBar
          Left = 0
          Top = 0
          Width = 914
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
          object SpeedButton2: TSpeedButton
            Tag = 3
            Left = 706
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
        end
      end
    end
    object PanelCentral: TPanel
      Left = 0
      Top = 80
      Width = 914
      Height = 338
      Align = alClient
      BevelOuter = bvNone
      Color = 15461355
      TabOrder = 1
      object PanelBarra: TPanel
        Left = 0
        Top = 0
        Width = 914
        Height = 117
        Align = alTop
        BevelOuter = bvNone
        Color = 16249066
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 4
          Top = 62
          Width = 270
          Height = 13
          Caption = 'Pesquisar por N'#186' do &Documento / Nosso Numero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 3
          Top = 1
          Width = 49
          Height = 13
          Caption = '&Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditDocumento: TEdit
          Left = 3
          Top = 77
          Width = 284
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = EditDocumentoKeyDown
        end
        object ComboEmpresa: TRxDBLookupCombo
          Left = 3
          Top = 16
          Width = 606
          Height = 21
          DropDownCount = 8
          LookupField = 'EMPRICOD'
          LookupDisplay = 'EMPRA60RAZAOSOC'
          LookupSource = DSSQLEmpresa
          TabOrder = 1
        end
        object btnAdicionar: TBitBtn
          Left = 303
          Top = 65
          Width = 165
          Height = 37
          Caption = 'Adicionar Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BtnAdicionarClick
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888800008888888888888888888800008888777777778888888800008800
            00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
            0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
            FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
            44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
            0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
            000A00080000888888880000770A088800008888888888888800088800008888
            88888888888888880000}
        end
        object ckBanrisul: TCheckBox
          Left = 493
          Top = 77
          Width = 110
          Height = 17
          Caption = 'Banco Banrisul'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 3
        end
      end
      object DBGridLista: TDBGrid
        Left = 0
        Top = 117
        Width = 914
        Height = 221
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = DSSQLContasReceber
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
        OnKeyDown = DBGridListaKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'EMPRICOD'
            Title.Caption = 'Emp'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIEA60RAZAOSOC'
            Title.Caption = 'Nome / Raz'#227'o Social'
            Width = 292
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTRCA15NOSSONUMERO'
            Title.Caption = 'Nosso Nro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTRCA30NRODUPLICBANCO'
            Title.Caption = 'Nro Duplicata'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTRCDEMIS'
            Title.Caption = 'Emiss'#227'o'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTRCDVENC'
            Title.Caption = 'Vencto'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTRCN2VLR'
            Title.Caption = 'Valor'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTRCINROPARC'
            Title.Caption = 'Parc'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTRCN2DESCFIN'
            Title.Caption = 'Vlr.Desc'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Title.Caption = 'Saldo'
            Visible = True
          end>
      end
    end
  end
  object DSSQLContasReceber: TDataSource
    DataSet = SQLContasReceber
    Left = 618
    Top = 11
  end
  object SQLContasReceber: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'select'
      '  CR.CTRCA13ID,'
      '  CR.EMPRICOD,'
      '  CR.TERMICOD,'
      '  CR.CLIEA13ID,'
      '  CR.CTRCCSTATUS,'
      '  CR.CTRCINROPARC,'
      '  CR.CTRCDVENC,'
      '  CR.CTRCDEMIS,'
      '  CR.CTRCN2VLR,'
      '  (CR.CTRCN2VLR - CR.CTRCN2TOTREC) as Saldo,'
      '  CR.CTRCN2DESCFIN,'
      '  CR.CTRCN2TOTREC,'
      '  CR.CTRCDULTREC,'
      '  CR.PORTICOD,'
      '  CR.CTRCA5TIPOPADRAO,'
      '  CR.CUPOA13ID,'
      '  CL.CLIEA60RAZAOSOC,'
      '  CR.NOFIA13ID,'
      '  CR.CTRCA30NRODUPLICBANCO,'
      '  CR.CTRCA15NOSSONUMERO'
      'from'
      '  CONTASRECEBER CR'
      '  left outer join CLIENTE CL on CR.CLIEA13ID =  CL.CLIEA13ID'
      'where'
      '  %MData and'
      '  ((CR.CTRCCSTATUS <> '#39'C'#39') or (CR.CTRCCSTATUS is null)) and'
      '  (CR.CTRCA5TIPOPADRAO not in ('#39'CHQ'#39','#39'CHQV'#39','#39'CHQP'#39')) and'
      
        '  (CR.CTRCN2TOTREC    < CR.CTRCN2VLR or CR.CTRCN2TOTREC is null)' +
        ' and'
      '  (%MDocumento)')
    Macros = <
      item
        DataType = ftString
        Name = 'MData'
        ParamType = ptInput
        Value = '0=0'
      end
      item
        DataType = ftString
        Name = 'MDocumento'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 590
    Top = 11
    object SQLContasReceberCTRCA13ID: TStringField
      FieldName = 'CTRCA13ID'
      FixedChar = True
      Size = 13
    end
    object SQLContasReceberEMPRICOD: TIntegerField
      FieldName = 'EMPRICOD'
    end
    object SQLContasReceberTERMICOD: TIntegerField
      FieldName = 'TERMICOD'
    end
    object SQLContasReceberCLIEA13ID: TStringField
      FieldName = 'CLIEA13ID'
      FixedChar = True
      Size = 13
    end
    object SQLContasReceberCTRCCSTATUS: TStringField
      FieldName = 'CTRCCSTATUS'
      FixedChar = True
      Size = 1
    end
    object SQLContasReceberCTRCINROPARC: TIntegerField
      FieldName = 'CTRCINROPARC'
    end
    object SQLContasReceberCTRCDVENC: TDateTimeField
      FieldName = 'CTRCDVENC'
    end
    object SQLContasReceberCTRCDEMIS: TDateTimeField
      FieldName = 'CTRCDEMIS'
    end
    object SQLContasReceberCTRCN2VLR: TFloatField
      FieldName = 'CTRCN2VLR'
    end
    object SQLContasReceberSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object SQLContasReceberCTRCN2DESCFIN: TFloatField
      FieldName = 'CTRCN2DESCFIN'
    end
    object SQLContasReceberCTRCN2TOTREC: TFloatField
      FieldName = 'CTRCN2TOTREC'
    end
    object SQLContasReceberCTRCDULTREC: TDateTimeField
      FieldName = 'CTRCDULTREC'
    end
    object SQLContasReceberPORTICOD: TIntegerField
      FieldName = 'PORTICOD'
    end
    object SQLContasReceberCTRCA5TIPOPADRAO: TStringField
      FieldName = 'CTRCA5TIPOPADRAO'
      FixedChar = True
      Size = 5
    end
    object SQLContasReceberCUPOA13ID: TStringField
      FieldName = 'CUPOA13ID'
      FixedChar = True
      Size = 13
    end
    object SQLContasReceberCLIEA60RAZAOSOC: TStringField
      FieldName = 'CLIEA60RAZAOSOC'
      FixedChar = True
      Size = 60
    end
    object SQLContasReceberNOFIA13ID: TStringField
      FieldName = 'NOFIA13ID'
      FixedChar = True
      Size = 13
    end
    object SQLContasReceberCTRCA30NRODUPLICBANCO: TStringField
      FieldName = 'CTRCA30NRODUPLICBANCO'
      FixedChar = True
      Size = 30
    end
    object SQLContasReceberCTRCA15NOSSONUMERO: TStringField
      FieldName = 'CTRCA15NOSSONUMERO'
      Size = 15
    end
  end
  object DSSQLEmpresa: TDataSource
    DataSet = SQLEmpresa
    Left = 674
    Top = 11
  end
  object SQLEmpresa: TRxQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'select * from EMPRESA'
      'where (%MEmpresa)'
      'order by EMPRA60RAZAOSOC')
    Macros = <
      item
        DataType = ftString
        Name = 'MEmpresa'
        ParamType = ptInput
        Value = '0=0'
      end>
    Left = 646
    Top = 11
    object SQLEmpresaEMPRICOD: TIntegerField
      FieldName = 'EMPRICOD'
      Origin = 'DB.EMPRESA.EMPRICOD'
    end
    object SQLEmpresaEMPRA60RAZAOSOC: TStringField
      FieldName = 'EMPRA60RAZAOSOC'
      Origin = 'DB.EMPRESA.EMPRA60RAZAOSOC'
      FixedChar = True
      Size = 60
    end
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
    Top = 5
  end
  object SQLRecebimento: TRxQuery
    DatabaseName = 'Easy_Temp'
    SQL.Strings = (
      'select * from ContasRecebimento.db')
    Macros = <>
    Left = 702
    Top = 11
    object SQLRecebimentoCTRCA13ID: TStringField
      FieldName = 'CTRCA13ID'
      Size = 13
    end
  end
  object DSTblRecebimento: TDataSource
    DataSet = SQLRecebimento
    Left = 730
    Top = 11
  end
end
