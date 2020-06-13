unit formPatientInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  //
  Persistence.Interfaces,
  Patient.Interfaces;

type
  TPatientInfoForm = class(TForm)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OKButton: TButton;
    CancelButton: TButton;
    Label4: TLabel;
    PatientItemIDEdit: TEdit;
    PatientFirstNameEdit: TEdit;
    PatientLastNameEdit: TEdit;
    PatientAddressEdit: TEdit;
    PatientDOBDateTimePicker: TDateTimePicker;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
    FController: IEditItemController;
    procedure SetController(const Value: IEditItemController);

  public
    { Public declarations }
    procedure Load;

    property Controller: IEditItemController read FController write SetController;
  end;

var
  PatientInfoForm: TPatientInfoForm;

function ShowNewItemEditor(const AContext: IContext): boolean;
function ShowItemEditor(const AContext: IContext; const APatientItemID: integer): boolean;


implementation
{$R *.dfm}
uses
  Patient.EditItemController;


function ShowNewItemEditor(const AContext: IContext): boolean;
var
  LForm: TPatientInfoForm;

begin
  LForm := TPatientInfoForm.Create(nil);

  try
    LForm.Controller := TEditItemController.Create(AContext);
    LForm.Controller.NewItem;
    LForm.Load;
    result := LForm.ShowModal = mrOK;
  finally
    LForm.Free;
  end;
end;

function ShowItemEditor(const AContext: IContext; const APatientItemID: integer): boolean;
var
  LForm: TPatientInfoForm;

begin
  LForm := TPatientInfoForm.Create(nil);
  try
    LForm.Controller := TEditItemController.Create(AContext);
    LForm.Controller.LoadItem(APatientItemID);
    LForm.Load;
    result := LForm.ShowModal = mrOK;
  finally
    LForm.Free;
  end;
end;


{ TPatientInfoForm }

procedure TPatientInfoForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if ModalResult = mrOK then
  begin
    // silly check - at least 3 days old patient
    if PatientDOBDateTimePicker.Date > (Now-3) then
    begin
      CanClose := False;
      if PatientDOBDateTimePicker.CanFocus then
        PatientDOBDateTimePicker.SetFocus;
      MessageDlg('Please provide DOB for the patient.', mtError, [mbOK], 0);
      Exit;
    end;

    FController.Item.FirstName := PatientFirstNameEdit.Text;
    FController.Item.LastName := PatientLastNameEdit.Text;
    FController.Item.Address := PatientAddressEdit.Text;
    FController.Item.DOB := PatientDOBDateTimePicker.Date;

    FController.SaveItem;
  end;
end;

procedure TPatientInfoForm.Load;
begin
  PatientFirstNameEdit.Text := Controller.Item.FirstName;
  PatientLastNameEdit.Text := Controller.Item.LastName;
  PatientAddressEdit.Text := Controller.Item.Address;
  PatientDOBDateTimePicker.DateTime := Controller.Item.DOB;

  if FController.IsNewItem then
    Caption := 'New Item';
end;

procedure TPatientInfoForm.SetController(const Value: IEditItemController);
begin
  FController := Value;
end;

end.
