object FrmMKLink: TFrmMKLink
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'MKLink V1.0'
  ClientHeight = 112
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
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
    TabOrder = 0
  end
  object BtnOrigem: TButton
    Left = 455
    Top = 11
    Width = 42
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = BtnOrigemClick
  end
  object EdtLink: TEdit
    Left = 75
    Top = 42
    Width = 374
    Height = 21
    TabOrder = 2
  end
  object BtnLink: TButton
    Left = 455
    Top = 40
    Width = 42
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = BtnLinkClick
  end
  object CmbTipo: TComboBox
    Left = 75
    Top = 69
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'Diretorio'
    Items.Strings = (
      'File'
      'Directory'
      'Developer')
  end
  object BtnCriar: TButton
    Left = 324
    Top = 69
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 5
    OnClick = BtnCriarClick
  end
  object OpdMKLink: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoForceFileSystem, fdoNoValidate, fdoCreatePrompt, fdoNoTestFileCreate, fdoForceShowHidden]
    Title = 'Selecione Pastas ou Arquivos'
    Left = 424
    Top = 68
  end
end
