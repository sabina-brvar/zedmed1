object PatientInfoForm: TPatientInfoForm
  Left = 0
  Top = 0
  Caption = 'Patient Info'
  ClientHeight = 181
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    488
    181)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 24
    Top = 51
    Width = 55
    Height = 13
    Caption = 'First Name:'
  end
  object Label1: TLabel
    Left = 24
    Top = 78
    Width = 54
    Height = 13
    Caption = 'Last Name:'
  end
  object Label2: TLabel
    Left = 24
    Top = 105
    Width = 43
    Height = 13
    Caption = 'Address:'
  end
  object Label3: TLabel
    Left = 24
    Top = 132
    Width = 25
    Height = 13
    Caption = 'DOB:'
  end
  object Label4: TLabel
    Left = 24
    Top = 24
    Width = 55
    Height = 13
    Caption = 'Patient ID: '
  end
  object OKButton: TButton
    Left = 317
    Top = 150
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 398
    Top = 150
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object PatientItemIDEdit: TEdit
    Left = 97
    Top = 21
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 80
    TabOrder = 2
  end
  object PatientFirstNameEdit: TEdit
    Left = 97
    Top = 48
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 80
    TabOrder = 3
  end
  object PatientLastNameEdit: TEdit
    Left = 97
    Top = 75
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 80
    TabOrder = 4
  end
  object PatientAddressEdit: TEdit
    Left = 97
    Top = 102
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 80
    TabOrder = 5
  end
  object PatientDOBDateTimePicker: TDateTimePicker
    Left = 97
    Top = 129
    Width = 186
    Height = 21
    Date = 43995.000000000000000000
    Time = 0.966641724538931200
    TabOrder = 6
  end
end
