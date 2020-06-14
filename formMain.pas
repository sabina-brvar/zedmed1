unit formMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Patient.Interfaces,
  VirtualTrees;

type
  TMainForm = class(TForm)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    AddPatient: TAction;
    EditPatient: TAction;
    ListPatients: TAction;
    Add1: TMenuItem;
    Edit1: TMenuItem;
    List1: TMenuItem;
    PatientTree: TVirtualStringTree;
    procedure AddPatientExecute(Sender: TObject);
    procedure PatientTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure PatientTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure PatientTreeBeforeItemErase(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
      var ItemColor: TColor; var EraseAction: TItemEraseAction);
  private
    { Private declarations }
    FController: IPatientListController;
    procedure ControllerListChange(ASender: TObject);
    procedure SetController(const Value: IPatientListController);

  public
    { Public declarations }
    property Controller: IPatientListController read FController write SetController;
  end;

var
  MainForm: TMainForm;



implementation
{$R *.dfm}
uses
  Vcl.GraphUtil,
  formPatientInfo,
  Patient.Domain;

const
  CPatientIDColumn  = 0;
  CNameColumn       = 1;
  CAddressColumn    = 2;
  CDOBColumn        = 3;

// tests:
// 01 - add patient
{
  a. return error on duplicate
  b. return error on validation
  c. pass validation
  d. pass insert / save
}

// 02 - amend patient data
{
  a. return error on validation
  b. pass validation
  c. pass update / save
  d. fail update on same data (count?)
}

// 03 - return / display patient data
{
  a. list??
}

// 04 - data validation
{
  a. mandatory fields
  b. dob (in past)
}
procedure TMainForm.AddPatientExecute(Sender: TObject);
begin
  if ShowNewItemEditor(FController.Context) then
    begin
    FController.Load;
    end;
end;

procedure TMainForm.ControllerListChange(ASender: TObject);
begin
  PatientTree.RootNodeCount := FController.PatientList.Count;
  PatientTree.ReinitNode(nil, True);
  PatientTree.Invalidate;
end;

procedure TMainForm.PatientTreeBeforeItemErase(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
  var ItemColor: TColor; var EraseAction: TItemEraseAction);
begin
  if Node.Index mod 2 = 0 then
    ItemColor := GetShadowColor(PatientTree.Color, -10);
end;

procedure TMainForm.PatientTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  LItem: TPatientListItem;

begin
  LItem := Node.GetData<TPatientListItem>;
  case Column of
    CPatientIDColumn:
      CellText := IntToStr(LItem.PatientItemID);
    CNameColumn:
      CellText := LItem.FirstName + ' ' + LItem.LastName;
    CAddressColumn:
      CellText := LItem.Address;
    CDOBColumn:
      CellText := DateToStr(LItem.DOB);
  end;
end;

procedure TMainForm.PatientTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.SetData<TPatientListItem>(FController.PatientList[Node.Index]);
end;

procedure TMainForm.SetController(const Value: IPatientListController);
begin
  if Assigned(FController) then
    FController.OnListChanged := nil;

  FController := Value;

  if Assigned(FController) then
    FController.OnListChanged := ControllerListChange;

  FController.Load;
end;

end.
