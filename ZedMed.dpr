program ZedMed;

uses
  Vcl.Forms, System.SysUtils,
  formMain in 'formMain.pas' {MainForm},
  formPatientInfo in 'formPatientInfo.pas' {PatientInfoForm},
  Persistence.Interfaces in 'Persistence.Interfaces.pas',
  Persistence.Types in 'Persistence.Types.pas',
  Patient.Interfaces in 'Patient.Interfaces.pas',
  Patient.Domain in 'Patient.Domain.pas' {/  Patient.EditItemController in 'Patient.EditItemController.pas';},
  Patient.PatientListController in 'Patient.PatientListController.pas',
  Patient.StartupController in 'Patient.StartupController.pas',
  Persistence.Context in 'Persistence.Context.pas',
  Persistence.Consts in 'Persistence.Consts.pas',
  Persistence.FireDAC.SQLite in 'Persistence.FireDAC.SQLite.pas',
  Persistence.DB in 'Persistence.DB.pas',
  Persistence.StatementCache in 'Persistence.StatementCache.pas';

//  Patient.EditItemController in 'Patient.EditItemController.pas';

{$R *.res}

var
  LStartupController: IPatientStartupController;
  LStatementFactory: IStatementBuilderFactory;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

{
  LStatementFactory := TSQLiteStatementBuilderFactory.Create;
}
  LStartupController := TPatientStartupController.Initialise(
    TFireDacConnectionFactory.Create,
    LStatementFactory,
    TStatementCache.Create(LStatementFactory),
    ExtractFilePath(ParamStr(0))
  );

  Application.CreateForm(TMainForm, MainForm);
  MainForm.Controller := TPatientListController.Create(LStartupController.CreateContext);

  Application.Run;
end.
