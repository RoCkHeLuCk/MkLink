object FrmMKLink: TFrmMKLink
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'MKLink V1.0'
  ClientHeight = 189
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    504
    189)
  PixelsPerInch = 96
  TextHeight = 13
  object LblOrigem: TLabel
    Left = 19
    Top = 16
    Width = 50
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Origin:'
  end
  object LblLink: TLabel
    Left = 19
    Top = 45
    Width = 50
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Link:'
  end
  object Label1: TLabel
    Left = 19
    Top = 73
    Width = 50
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Type:'
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 26
    Width = 24
    Height = 24
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FF000000FF000000FFFFFFFFFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
      FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFF000000FF000000FF0000
      00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FFFFFF
      FFFF000000FF000000FF000000FF000000FFFFFFFFFF000000FF000000FF0000
      00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFF000000FF000000FFFFFF
      FFFFFFFFFFFF000000FF000000FF000000FF000000FF000000FF000000FFFFFF
      FFEE000000FF000000FF000000FF000000FFFFFFFFFF000000FF000000FF0000
      00FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FFFFFF
      FFFFFFFFFFF2000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF1000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFFFFFFFFFFFFFFFFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF
      FFFFFFFFFFFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF
      FFFF000000FF000000FF000000FF000000FF000000FF000000FF}
    OnClick = SpeedButton1Click
  end
  object EdtOrigem: TEdit
    Left = 75
    Top = 13
    Width = 374
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = EdtOrigemChange
  end
  object BtnOrigem: TButton
    Left = 457
    Top = 11
    Width = 42
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 1
    OnClick = BtnOrigemClick
  end
  object EdtLink: TEdit
    Left = 75
    Top = 41
    Width = 374
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    OnChange = EdtOrigemChange
  end
  object BtnLink: TButton
    Left = 457
    Top = 40
    Width = 42
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 3
    OnClick = BtnLinkClick
  end
  object CmbTipo: TComboBox
    Left = 75
    Top = 69
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 4
    Text = 'Directory'
    Items.Strings = (
      'File'
      'Directory'
      'Developer')
  end
  object BtnCreate: TButton
    Left = 374
    Top = 69
    Width = 75
    Height = 25
    Caption = 'Create'
    Enabled = False
    TabOrder = 5
    OnClick = BtnCreateClick
  end
  object BtnAdd: TButton
    Left = 258
    Top = 69
    Width = 75
    Height = 25
    Caption = 'Add Script'
    Enabled = False
    TabOrder = 6
    OnClick = BtnAddClick
  end
  object GpbScript: TGroupBox
    Left = 8
    Top = 100
    Width = 491
    Height = 81
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Script'
    TabOrder = 7
    object MmoScript: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 481
      Height = 58
      Align = alClient
      BorderStyle = bsNone
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object OpdMKLink: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoForceFileSystem, fdoNoValidate, fdoCreatePrompt, fdoNoTestFileCreate, fdoForceShowHidden]
    Title = 'Selecione Pastas ou Arquivos'
    Left = 464
    Top = 68
  end
end
