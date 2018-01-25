unit UFrmMain;

interface

uses
  Classes,
  SysUtils,
  IWAppForm,
  IWApplication,
  IWColor,
  IWTypes,
  Controls,
  IWVCLBaseControl,
  IWBaseControl,
  IWBaseHTMLControl,
  IWControl,
  IWExtCtrls,
  Forms,
  IWVCLBaseContainer,
  IWContainer,
  IWHTMLContainer,
  IWHTML40Container,
  IWRegion,
  IWAdvTreeView,
  AdvTreeNodes,
  frxpngimage,
  jpeg,
  SynDB,
  SynCommons,
  MidasLib,
  SynDBMidasVCL;

type
  TFrmMain = class(TIWAppForm)
    img1: TIWImage;
    rgn: TIWRegion;
    IwAtv: TTIWAdvTreeView;
    img2: TIWImageFile;
    procedure IWAppFormCreate(Sender: TObject);
  public
    procedure loadTree(pid: string; aTv: TTIWAdvTreeView; pnode: TAdvTreeNode;
      cds: TSynDBDataSet);
  end;

implementation

{$R *.dfm}
uses
  IWInit,
  IWGlobal,
  ServerController,
  UDmSys;

{ TFrmMain }
var
  fCds: TSynDBDataSet;

procedure TFrmMain.loadTree(pid: string; aTv: TTIWAdvTreeView; pnode:
  TAdvTreeNode; cds: TSynDBDataSet);
var
  i: integer;
  treenode: TAdvTreeNode;
begin
  i := 0;
  cds.First;
  while not cds.Eof do
  begin
    if cds.FieldByName('tvPid').AsString = pid then
    begin
      if pnode = nil then
        treenode := aTv.Items.Add(cds.fieldbyname('tvName').AsString)
      else
        treenode := pnode.AddChild(cds.fieldbyname('tvName').AsString);
      loadTree(cds.fieldbyname('tvId').AsString, aTv, treenode, cds);
    end;
    Inc(i);
    cds.First;
    cds.MoveBy(i);
  end;
end;

procedure TFrmMain.IWAppFormCreate(Sender: TObject);
begin
  fCds := TSynDBDataSet.Create(Self);
  with fCds do
  try
    Connection := gProps;
    CommandText := 'select * from sys_tv';
    Open;
    loadTree('0', IwAtv, nil, fCds);
  finally
    fCds.Free;
  end;

end;

initialization
  TFrmMain.SetAsMainForm;

end.

