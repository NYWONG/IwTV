unit ServerController;

interface

uses
  SysUtils,
  Classes,
  Forms,
  IWServerControllerBase,
  IWBaseForm,
  HTTPApp,
  // For OnNewSession Event
  UserSessionUnit,
  IWApplication,
  IWAppForm,
  //
  SynCommons,
  SynDB,
  SynDBSQLite3,
  SynSQLite3,
  SynSQLite3Static;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication; var
      VMainForm: TIWBaseForm);
    procedure IWServerControllerBaseCreate(Sender: TObject);
    procedure IWServerControllerBaseBeforeRender(ASession: TIWApplication; AForm:
      TIWBaseForm; var VNewForm: TIWBaseForm);
  private
  public
  end;

function UserSession: TIWUserSession;

function IWServerController: TIWServerController;

implementation

{$R *.dfm}

uses
  IWInit,
  IWGlobal,
  UDmSys;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(gServerController);
end;

function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(ASession:
  TIWApplication; var VMainForm: TIWBaseForm);
begin
  ASession.Data := TIWUserSession.Create(nil);
end;

procedure TIWServerController.IWServerControllerBaseCreate(Sender: TObject);
begin
  Application.Title := AppTitle;
  DisplayName := AppTitle;
  Description := AppTitle;
end;

procedure TIWServerController.IWServerControllerBaseBeforeRender(ASession:
  TIWApplication; AForm: TIWBaseForm; var VNewForm: TIWBaseForm);
begin
  AForm.Title := AppTitle;
end;

initialization
  TIWServerController.SetServerControllerClass;

end.
 
