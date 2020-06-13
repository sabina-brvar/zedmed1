unit Patient.PatientListController;

interface

uses
  Patient.Interfaces,
  Persistence.Interfaces,
  Patient.Domain,
  System.Classes;

type

  TPatientListController = class (TInterfacedObject, IPatientListController)
  private
    FOnListChanged: TNotifyEvent;
    FContext: IContext;
    FPatientList: TPatientListItemList;
    function GetOnListChanged: TNotifyEvent;
    procedure SetOnListChanged(const AEvent: TNotifyEvent);
    function GetPatientList: TPatientListItemList;
    function GetContext: IContext;

    procedure Load;

  protected
    procedure DoListChanged;

  public
    constructor Create(
      const AContext: IContext
    );
    destructor Destroy; override;

  end;

implementation

{ TPatientListController }

constructor TPatientListController.Create(const AContext: IContext);
begin
  inherited Create;

  FContext := AContext;
  FPatientList := TPatientListItemList.Create;
end;

destructor TPatientListController.Destroy;
begin
  FPatientList.Free;

  inherited;
end;

procedure TPatientListController.DoListChanged;
begin
  if Assigned(FOnListChanged) then
    FOnListChanged(self);
end;

function TPatientListController.GetContext: IContext;
begin
  result := FContext;
end;

function TPatientListController.GetOnListChanged: TNotifyEvent;
begin
  Result := FOnListChanged;
end;

function TPatientListController.GetPatientList: TPatientListItemList;
begin
  result := FPatientList;
end;

procedure TPatientListController.Load;
begin
  FContext.Load(FPatientList);
  DoListChanged;
end;

procedure TPatientListController.SetOnListChanged(const AEvent: TNotifyEvent);
begin
  FOnListChanged := AEvent;
end;

end.
