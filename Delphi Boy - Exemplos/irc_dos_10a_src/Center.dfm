object FrmCenter: TFrmCenter
  Left = 199
  Top = 106
  Width = 516
  Height = 387
  Caption = 'Prompt do MS-DOS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTool: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 30
    Align = alTop
    TabOrder = 1
    object Speed_Marcar: TSpeedButton
      Left = 96
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Marcar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000
        000000FF00FFFF00FF000000000000FF00FFFF00FF000000000000FF00FFFF00
        FF000000000000FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF000000
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF000000
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF000000
        000000FF00FFFF00FF000000000000FF00FFFF00FF000000000000FF00FFFF00
        FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphRight
      ParentShowHint = False
      ShowHint = True
      OnClick = Speed_MarcarClick
    end
    object Speed_Copiar: TSpeedButton
      Left = 120
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Copiar'
      Glyph.Data = {
        36020000424D3602000000000000360000002800000010000000100000000100
        10000000000000020000000000000000000000000000000000001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1000100010001000100010001000100010001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1000FF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1000FF7F00000000000000000000FF7F10001F7C00000000
        00000000000000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F7C0000FF7F
        FF7FFF7FFF7FFF7F1000FF7F00000000000000000000FF7F10001F7C0000FF7F
        00000000000000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F7C0000FF7F
        FF7FFF7FFF7FFF7F1000FF7F00000000FF7F10001000100010001F7C0000FF7F
        00000000000000001000FF7FFF7FFF7FFF7F1000FF7F10001F7C1F7C0000FF7F
        FF7FFF7FFF7FFF7F1000FF7FFF7FFF7FFF7F100010001F7C1F7C1F7C0000FF7F
        00000000FF7F00001000100010001000100010001F7C1F7C1F7C1F7C0000FF7F
        FF7FFF7FFF7F0000FF7F00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F
        FF7FFF7FFF7F000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000
        00000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C}
      ParentShowHint = False
      ShowHint = True
    end
    object Speed_Colar: TSpeedButton
      Left = 144
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Colar'
      Glyph.Data = {
        36020000424D3602000000000000360000002800000010000000100000000100
        10000000000000020000000000000000000000000000000000001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C10001000100010001000100010001000100010001F7C00000000
        0000000000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1000000010420042
        1042004210421000FF7F000000000000000000000000FF7F1000000000421042
        0042104200421000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1000000010420042
        1042004210421000FF7F000000000000FF7F1000100010001000000000421042
        0042104200421000FF7FFF7FFF7FFF7FFF7F1000FF7F10001F7C000010420042
        1042004210421000FF7FFF7FFF7FFF7FFF7F100010001F7C1F7C000000421042
        004210420042100010001000100010001000100000001F7C1F7C000010420042
        104200421042004210420042104200421042004200001F7C1F7C000000421042
        000000000000000000000000000000001042104200001F7C1F7C000010421042
        00001F7C1F7C1F7C1F7C1F7C1F7C00001042004200001F7C1F7C000000421042
        00420000E07F00000000E07F000010420042104200001F7C1F7C1F7C00000000
        000000000000E07FE07F000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C}
      ParentShowHint = False
      ShowHint = True
    end
    object Speed_Tela: TSpeedButton
      Left = 176
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Tela Inteira'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF7F00007F00007F00007F00007F00007F00007F00007F
        00007F00007F00007F00007F00007F00007F00007F0000FF00FF7F0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7F0000FF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00
        007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FF00FF7F0000FFFFFF
        FFFFFFFFFFFFFFFFFF00007F00007F00007F00007F00007FFFFFFFFFFFFFFFFF
        FFFFFFFF7F0000FF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FF00FF7F0000FFFFFF
        FFFFFF00007FFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFF00007FFFFF
        FFFFFFFF7F0000FF00FF7F0000FFFFFF00007F00007FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00007F00007FFFFFFF7F0000FF00FF7F000000007F
        00007F00007F00007F00007FFFFFFFFFFFFFFFFFFF00007F00007F00007F0000
        7F00007F7F0000FF00FF7F0000FFFFFF00007F00007FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00007F00007FFFFFFF7F0000FF00FF7F0000FFFFFF
        FFFFFF00007FFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFF00007FFFFF
        FFFFFFFF7F0000FF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FF00FF7F0000FFFFFF
        FFFFFFFFFFFFFFFFFF00007F00007F00007F00007F00007FFFFFFFFFFFFFFFFF
        FFFFFFFF7F0000FF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F00
        007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FF00FF7F0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7F0000FF00FF7F00007F00007F00007F00007F00007F00007F00007F
        00007F00007F00007F00007F00007F00007F00007F0000FF00FF}
      ParentShowHint = False
      ShowHint = True
    end
    object Speed_Propriedades: TSpeedButton
      Left = 208
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Propriedades'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
        FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00000000000000
        0000000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
        FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00000000000000
        0000000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
        FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF
        000000000000FFFFFFFFFFFFFFFFFF000000BFBFBF000000FFFFFF000000FF00
        FFFF00FFFF00FFFF00FF000000FFFFFF000000BFBFBF000000FFFFFF000000BF
        BFBF000000BFBFBF000000000000000000FF00FF7F00007F0000000000FFFFFF
        FFFFFF000000BFBFBF000000BFBFBF000000BFBFBF000000BFBFBFBFBFBFBFBF
        BF0000007F00007F0000000000000000000000000000000000BFBFBF000000BF
        BFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F0000FF00FFFF00FF
        FF00FFFF00FFFF00FF000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF7F00007F0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000BF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000007F00007F0000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000
        00BFBFBF7F00007F0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
    end
    object Speed_SegPlano: TSpeedButton
      Left = 232
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Segundo Plano'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF7F00007F00007F00007F00007F00007F00007F00007F
        00007F00007F00007F00007F00007F0000FF00FFFF00FFFF00FF7F0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F00
        00FF00FFFF00FFFF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FF00FFFF00FFFF00FF7F0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F00
        00FF00FFFF00FFFF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FF00FFFF00FFFF00FF7F0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F00
        007F00007F00007F00007F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FFFFFFFFFFFF7F00007F00007F0000
        7F00007F00007F00007F00007F00007F00007F00007F00007F00007F00007F00
        00FFFFFFFFFFFF7F00007F00007F00007F00007F00007F00007F00007F00007F
        00007F00007F00007F00007F00007F0000FFFFFFFFFFFF7F0000FF00FFFF00FF
        FF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFF7F007FFFFFFF7F007FFFFFFFFFFF
        FFFFFFFFFFFFFF7F0000FF00FFFF00FFFF00FF7F0000FFFFFFFFFFFFFFFFFF7F
        007FFFFFFF7F007FFFFFFF7F007FFFFFFFFFFFFFFFFFFF7F0000FF00FFFF00FF
        FF00FF7F0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F007FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7F0000FF00FFFF00FFFF00FF7F0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0000FF00FFFF00FF
        FF00FF7F00007F00007F00007F00007F00007F00007F00007F00007F00007F00
        007F00007F00007F0000FF00FFFF00FFFF00FF7F00007F00007F00007F00007F
        00007F00007F00007F00007F00007F00007F00007F00007F0000}
      ParentShowHint = False
      ShowHint = True
    end
    object Speed_Fonte: TSpeedButton
      Left = 264
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Fonte'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000
        000000000000000000FF00FFFF00FFFF00FF0000000000000000000000000000
        00000000000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000000000
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
        0000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF000000FF00FFFF00FFFF00FF000000000000000000000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF
        00FF000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF000000FF00FF000000000000000000000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF00
        0000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF000000000000000000000000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000
        0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphRight
      ParentShowHint = False
      ShowHint = True
    end
    object ComboFonte: TComboBox
      Left = 0
      Top = 4
      Width = 89
      Height = 21
      Hint = 'Fonte'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '       Auto'
      Items.Strings = (
        '       Auto')
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 30
    Width = 508
    Height = 310
    Align = alClient
    BorderStyle = bsNone
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    OEMConvert = True
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    OnClick = Memo1Click
    OnKeyDown = FormKeyDown
  end
  object MemoDos: TMemo
    Left = 0
    Top = 30
    Width = 508
    Height = 310
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = MemoDosClick
    OnKeyDown = MemoDosKeyDown
  end
  object PaneEdit: TPanel
    Left = 0
    Top = 340
    Width = 508
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 0
    DesignSize = (
      508
      20)
    object EdtMsg: TEdit
      Left = 0
      Top = 1
      Width = 507
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '/server irc.brasnet.org:6667'
      OnKeyDown = EdtMsgKeyDown
      OnKeyPress = EdtMsgKeyPress
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 56
    object Conectar1: TMenuItem
      Caption = 'Conectar'
      OnClick = Conectar1Click
    end
    object Desconectar1: TMenuItem
      Caption = 'Desconectar'
      OnClick = Desconectar1Click
    end
    object Informcoes: TMenuItem
      Caption = 'Informa'#231#245'es'
      OnClick = InformcoesClick
    end
    object Servidor1: TMenuItem
      Caption = 'Servidor'
      OnClick = Servidor1Click
    end
    object DefinirDestino1: TMenuItem
      Caption = 'Definir Destino'
      OnClick = DefinirDestino1Click
    end
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      object Join1: TMenuItem
        Caption = 'Join'
        OnClick = Join1Click
      end
      object Part1: TMenuItem
        Caption = 'Part'
        OnClick = Part1Click
      end
      object Notice1: TMenuItem
        Caption = 'Notice'
      end
      object Quit1: TMenuItem
        Caption = 'Quit'
        OnClick = Quit1Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SalvarLog1: TMenuItem
      Caption = 'Salvar Log...'
      OnClick = SalvarLog1Click
    end
    object Menu1: TMenuItem
      Caption = 'Menu'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
        OnClick = Sobre1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object Vortex: TVortex
    IrcOptions.ServerHost = 'irc.brasnet.org'
    IrcOptions.ServerPort = '6667'
    IrcOptions.UserName = 'Nome'
    IrcOptions.UserIdent = 'ircdos'
    IrcOptions.MyNick = 'ircdos'
    CtcpOptions.VersionReply = 'IRC-DOS 1.0a'
    CtcpOptions.TimeReply = 'TimeReplyyy'
    CtcpOptions.FingerReply = 'FooBar'
    CtcpOptions.PingReply = 'PinggReplyyy'
    CtcpOptions.ReplyOnPing = False
    CtcpOptions.AnswerCtcps = True
    SocksOptions.SocksPassword = '5'
    SocksOptions.SocksAuthentication = socksNoAuthentication
    AuthOptions.System = 'Windows'
    AuthOptions.Ident = 'Ident'
    AuthOptions.UseAuth = False
    AuthOptions.Enabled = False
    BeforeConnect = VortexBeforeConnect
    AfterPrivateMessage = VortexAfterPrivateMessage
    AfterJoined = VortexAfterJoined
    AfterParted = VortexAfterParted
    AfterKicked = VortexAfterKicked
    AfterNickChanged = VortexAfterNickChanged
    AfterServerPing = VortexAfterServerPing
    OnUserInvite = VortexUserInvite
    OnUserNickChange = VortexUserNickChange
    OnUserCtcp = VortexUserCtcp
    OnUserJoin = VortexUserJoin
    OnUserPart = VortexUserPart
    OnUserQuit = VortexUserQuit
    OnUserKick = VortexUserKick
    OnUserTopic = VortexUserTopic
    OnServerError = VortexServerError
    OnMessageChannel = VortexMessageChannel
    OnMessageAction = VortexMessageAction
    OnMessagePrivate = VortexMessagePrivate
    OnMessageNotice = VortexMessageNotice
    OnIRCNickInUse = VortexIRCNickInUse
    OnIRCNoSuchNickChannel = VortexIRCNoSuchNickChannel
    OnIRCNotify = VortexIRCNotify
    OnIRCNames = VortexIRCNames
    OnIRCWhois = VortexIRCWhois
    OnIRCList = VortexIRCList
    OnIRCMode = VortexIRCMode
    OnIRCMotd = VortexIRCMotd
    OnIRCWho = VortexIRCWho
    OnServerQuote = VortexServerQuote
    SocketAuth = VortexSocketAuth
    SocketDisconnect = VortexSocketDisconnect
    SocketConnect = VortexSocketConnect
    SocketError = VortexSocketError
    SocketBgException = VortexSocketBgException
    Left = 144
    Top = 64
  end
  object ClusterChat1: TClusterChat
    Listen = False
    ListenPort = '54653'
    Left = 184
    Top = 80
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = 
      'Arquivo Log (*.log)|*.log|Arquivo Texto (*.txt)|*.txt|Todos (*.*' +
      ')|*.*'
    Left = 72
    Top = 80
  end
end