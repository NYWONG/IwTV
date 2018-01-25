program iwtv;

uses
  FastMM4,
  Forms,
  IWStart,
  ServerController in 'ServerController.pas' {IWServerController: TIWServerController},
  UFrmMain in 'UFrmMain.pas' {FrmMain: TIWFormModuleBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  UDmSys in 'UDmSys.pas' {DmSys: TDataModule},
  UFrmDataBase in 'UFrmDataBase.pas' {IWForm1: TIWAppForm};

{$R *.res}
{$R vistaadm.res}

begin
  TIWStart.Execute(True);
end.

