object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'JSon to Class Delphi'
  ClientHeight = 673
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 448
    object Panel5: TPanel
      Left = 648
      Top = 2
      Width = 271
      Height = 37
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 10
        Width = 65
        Height = 22
        Margins.Top = 8
        Align = alLeft
        Caption = 'Class Name:'
        ExplicitTop = 5
        ExplicitHeight = 15
      end
      object edtClassName: TEdit
        AlignWithMargins = True
        Left = 76
        Top = 5
        Width = 190
        Height = 27
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 144
        ExplicitTop = 10
        ExplicitWidth = 121
        ExplicitHeight = 23
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 391
    Width = 921
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 448
    object btnGenerate: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 911
      Height = 31
      Align = alClient
      Caption = 'Generate'
      TabOrder = 0
      OnClick = btnGenerateClick
      ExplicitWidth = 438
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 921
    Height = 350
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitWidth = 448
    object mmoJSon: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 911
      Height = 340
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 654
    Width = 921
    Height = 19
    Panels = <>
    ExplicitWidth = 448
  end
  object Panel4: TPanel
    Left = 0
    Top = 432
    Width = 921
    Height = 222
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    ExplicitWidth = 448
    object mmoClass: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 911
      Height = 212
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 488
    Top = 56
    object JSOn1: TMenuItem
      Caption = 'File'
      object JSon2: TMenuItem
        Caption = 'JSon'
      end
      object JSon3: TMenuItem
        Caption = 'Class'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Class1: TMenuItem
      Caption = 'Tools'
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Help2: TMenuItem
        Caption = 'Help'
      end
      object Help3: TMenuItem
        Caption = 'About'
      end
    end
  end
end
