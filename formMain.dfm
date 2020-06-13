object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'ZedMed Coding Challenge'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PatientTree: TVirtualStringTree
    Left = 8
    Top = 8
    Width = 619
    Height = 283
    Header.AutoSizeIndex = 0
    Header.MainColumn = -1
    TabOrder = 0
    OnBeforeItemErase = PatientTreeBeforeItemErase
    OnGetText = PatientTreeGetText
    OnInitNode = PatientTreeInitNode
    Columns = <>
  end
  object ActionList1: TActionList
    Left = 224
    Top = 16
    object AddPatient: TAction
      Caption = 'Add Patient'
      OnExecute = AddPatientExecute
    end
    object EditPatient: TAction
      Caption = 'Edit Patient'
    end
    object ListPatients: TAction
      Caption = 'List Patients'
    end
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 16
    object Add1: TMenuItem
      Action = AddPatient
    end
    object Edit1: TMenuItem
      Action = EditPatient
    end
    object List1: TMenuItem
      Action = ListPatients
    end
  end
end
