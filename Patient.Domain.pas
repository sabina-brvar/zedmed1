unit Patient.Domain;

interface
uses
  Persistence.Types;

type

  {$m+}
  [TableName('Patient')]
  TPatientItem = class (TDataObject)
  private
    FPatientItemID: integer;
    FFirstName: string;
    FLastName: string;
    FAddress: string;
    FDOB: TDate;
    procedure SetAddress(const Value: string);

    procedure SetDOB(const Value: TDate);
    procedure SetFirstName(const Value: string);
    procedure SetLastName(const Value: string);
    procedure SetPatientItemID(const Value: integer);

  published
    [IdentityField]
    property PatientItemID: integer read FPatientItemID write SetPatientItemID;
    property FirstName: string read FFirstName write SetFirstName;
    property LastName: string read FLastName write SetLastName;
    property Address: string read FAddress write SetAddress;
    property DOB: TDate read FDOB write SetDOB;
  end;

  TPatientListItem = class (TPatientItem)
  private
//    FOnHand: integer;
//    FLastLevelChanged: TDateTime;
//    procedure SetLastLevelChanged(const Value: TDateTime);
//    procedure SetOnHand(const Value: integer);

  published
//    property OnHand: integer read FOnHand write SetOnHand;
//    property LastChanged: TDateTime read FLastLevelChanged write SetLastLevelChanged;
  end;

  TPatientListItemList = class (TDataObjectList<TPatientListItem>);


implementation

{ TPatientItem }

procedure TPatientItem.SetAddress(const Value: string);
begin
  if Value = FAddress then Exit;
  FAddress := Value;
  Changed;
end;

procedure TPatientItem.SetDOB(const Value: TDate);
begin
  if Value = FDOB then Exit;
  FDOB := Value;
  Changed;
end;

procedure TPatientItem.SetFirstName(const Value: string);
begin
  if Value = FFirstName then Exit;
  FFirstName := Value;
  Changed;
end;

procedure TPatientItem.SetLastName(const Value: string);
begin
  if Value = FLastName then Exit;
  FLastName := Value;
  Changed;
end;

procedure TPatientItem.SetPatientItemID(const Value: integer);
begin
  if Value = FPatientItemID then Exit;
  FPatientItemID := Value;
  Changed;
end;

end. { TPatientItem }

procedure TPatientItem.SetAddress(const Value: string);
begin
  FAddress := Value;
end;

procedure TPatientItem.SetDOB(const Value: string);
begin
  FDOB := Value;
end;

procedure TPatientItem.SetFirstName(const Value: string);
begin
  FFirstName := Value;
end;

procedure TPatientItem.SetLastName(const Value: string);
begin
  FLastName := Value;
end;

procedure TPatientItem.SetPatientItemID(const Value: integer);
begin
  FPatientItemID := Value;
end;


