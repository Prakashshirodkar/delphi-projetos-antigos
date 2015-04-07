program AppClient;

uses
  Windows,
  Dialogs,
  Forms,
  uMainClient in 'uMainClient.pas' {fMain},
  uCommon in 'uCommon.pas';

{$R *.RES}
{$R Resources.RES}

begin
  if OpenMutex(MUTEX_ALL_ACCESS, False, 'APPCLIENT') <> 0 then begin
    MessageBeep(MB_ICONERROR);
    MessageDlg('Este aplicativo j� est� sendo executado!', mtError, [mbOK], 0);
  end else begin
    CreateMutex(nil, False, 'APPCLIENT');
    Application.Initialize;
    Application.Title := 'Atualizador de Aplica��es';
    Application.CreateForm(TfMain, fMain);
  Application.Run;
  end;
end.
