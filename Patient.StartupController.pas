unit Patient.StartupController;

interface

uses
  Patient.Interfaces,
  Persistence.Interfaces;

const

  CDefaultDatabaseName = 'Patients.sdb';

type

  TPatientStartupController = class (TInterfacedObject, IPatientStartupController)
  private
    FConnectionFactory: IConnectionFactory;
    FStatementCache: IStatementCache;
    FDataLocation: string;
    function GetDataLocation: string;
    procedure SetupDataFolder(const AExePath: string);
    function CreateContext: IContext;
  public
    constructor Initialise(
      const AConnectionFactory: IConnectionFactory;
      const AStatementBuilderFactory: IStatementBuilderFactory;
      const AStatementCache: IStatementCache;
      const AExeFolder: string
    );
  end;


implementation

uses
  Persistence.Types, Persistence.Context;

{ TPatientStartupController }

function TPatientStartupController.CreateContext: IContext;
begin
  result := TContext.Create(FConnectionFactory, FStatementCache);
end;

function TPatientStartupController.GetDataLocation: string;
begin

end;

constructor TPatientStartupController.Initialise(
  const AConnectionFactory: IConnectionFactory;
  const AStatementBuilderFactory: IStatementBuilderFactory;
  const AStatementCache: IStatementCache; const AExeFolder: string);
begin

end;

procedure TPatientStartupController.SetupDataFolder(const AExePath: string);
begin

end;

end.
