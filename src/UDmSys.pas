unit UDmSys;
 {$DEFINE DOWNLOAD}

interface

uses
  SysUtils,
  StrUtils,
  Classes,
  //
  SynCommons,
  {$IFDEF DOWNLOAD }
  SynCrtSock,
  SynZip,
  {$endif}
  SynDB,
  SynDBSQLite3,
  SynSQLite3,
  SynSQLite3Static;

type
  TDmSys = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  AppTitle = 'Îá°®²¥·ÅÆ÷';

var
  DmSys: TDmSys;
  gProps: TSQLDBSQLite3ConnectionProperties;

implementation

{$R *.dfm}
procedure TDmSys.DataModuleCreate(Sender: TObject);
begin
  gProps := TSQLDBSQLite3ConnectionProperties.Create('data.db3', '', '', '');
end;

initialization
  DmSys := TDmSys.Create(nil);

finalization
  DmSys.Free;

end.

