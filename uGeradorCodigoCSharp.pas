unit uGeradorCodigoCSharp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.Buttons, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxDBEdit, Vcl.DBCtrls;

type
  TfrmGeradorCodigo = class(TForm)
    pn_Principal: TPanel;
    MProjeto_sln: TMemo;
    MappsettingsDevelopment: TMemo;
    Mappsettings: TMemo;
    MProgram: TMemo;
    MStartup: TMemo;
    Mcsproj: TMemo;
    Mcsprojuser: TMemo;
    MlaunchSettingsjson: TMemo;
    MFolderProfilepubxml: TMemo;
    MFolderProfilepubxmluser: TMemo;
    TBProjetos: TClientDataSet;
    ds_Projeto: TDataSource;
    TBProjetosID: TAutoIncField;
    TBProjetosNomeProjeto: TStringField;
    TBProjetosPathProjeto: TStringField;
    pct_Projetos: TPageControl;
    TBS_Projeto: TTabSheet;
    TBS_Entidade: TTabSheet;
    TBS_Dao: TTabSheet;
    TBS_Interfaces: TTabSheet;
    TBS_DTO: TTabSheet;
    TBS_Controllers: TTabSheet;
    Label1: TLabel;
    EDT_NomeProjeto: TEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DLB_PathProj: TDirectoryListBox;
    btn_Criaprojeto: TBitBtn;
    TBEntidade: TClientDataSet;
    ds_Entidade: TDataSource;
    TBEntidadeID: TAutoIncField;
    TBEntidadeIDProjeto: TIntegerField;
    TBEntidadeNomeEntidade: TStringField;
    Label4: TLabel;
    TBCamposEtidade: TClientDataSet;
    ds_CamposEtidade: TDataSource;
    TBCamposEtidadeID: TAutoIncField;
    TBCamposEtidadeIDEntidade: TIntegerField;
    TBCamposEtidadeDescricaoCampo: TStringField;
    TBCamposEtidadeTipoCampo: TStringField;
    GRD_Campos: TDBGrid;
    Label3: TLabel;
    DBNEntidade: TDBNavigator;
    DBNavigator1: TDBNavigator;
    btnGerarCodigo: TBitBtn;
    MEntidade: TMemo;
    GRD_Entidades: TDBGrid;
    TBEntidadeStatus: TStringField;
    Label5: TLabel;
    DBN_Dao: TDBNavigator;
    GRD_DAO: TDBGrid;
    Label6: TLabel;
    GRD_CamposDAO: TDBGrid;
    DBN_CamposDao: TDBNavigator;
    MDAO: TMemo;
    btn_geraDAO: TBitBtn;
    ds_TabelaDAO: TDataSource;
    TBTabelaDAO: TClientDataSet;
    TBTabelaDAOID: TAutoIncField;
    TBTabelaDAOIDProjeto: TIntegerField;
    TBTabelaDAONomeTBfisicaDAO: TStringField;
    TBTabelaDAOStatus: TStringField;
    TBCamposDAO: TClientDataSet;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_CamposDAO: TDataSource;
    procedure btn_CriaprojetoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarCodigoClick(Sender: TObject);
    procedure DBNEntidadeClick(Sender: TObject; Button: TNavigateBtn);
    procedure DBN_DaoClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeradorCodigo: TfrmGeradorCodigo;

implementation

{$R *.dfm}

procedure TfrmGeradorCodigo.btnGerarCodigoClick(Sender: TObject);
begin
  if TBEntidadeStatus.AsString <> 'Gerado' then
  begin
    MEntidade.Lines.Clear;
    MEntidade.Lines.Add('namespace ' + trim(EDT_NomeProjeto.Text) + '.Domain');
    MEntidade.Lines.Add('{');
    MEntidade.Lines.Add('    public class '+TBEntidadeNomeEntidade.AsString);
    MEntidade.Lines.Add('    {');
    TBCamposEtidade.First;
    while not TBCamposEtidade.eof do
    begin
      MEntidade.Lines.Add('        public '+ TBCamposEtidadeTipoCampo.AsString + ' ' + TBCamposEtidadeDescricaoCampo.AsString+'  '+'{ get; set; }');
      TBCamposEtidade.Next;
    end;
    MEntidade.Lines.Add('    }');
    MEntidade.Lines.Add('}');

    MEntidade.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Domain\'+TBEntidadeNomeEntidade.AsString+'.cs');

    TBEntidade.Edit;
    TBEntidadeStatus.AsString := 'Gerado';
    TBEntidade.Post;
  end
  else
  begin
    Showmessage('Entidade j� Gerada!');
    exit;
  end;
end;

procedure TfrmGeradorCodigo.btn_CriaprojetoClick(Sender: TObject);
var
  Dir: string;
begin
  try
    //cria pasta principal------------------------------------------------------
    Dir := DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text;
    if not DirectoryExists(Dir) then
    ForceDirectories(Dir);
    if (POS('<NomeProjeto>', MProjeto_sln.Lines.Text)>0) then
    begin
      MProjeto_sln.Lines.Text := StringReplace(MProjeto_sln.Lines.Text, '<NomeProjeto>', Trim(EDT_NomeProjeto.Text),[rfReplaceAll, rfIgnoreCase]);
    end;
    MProjeto_sln.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'.sln');
    //--------------------------------------------------------------------------
    //criar estrutura do projeto------------------------------------------------
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\bin');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Controllers');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\DAO');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Domain');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Dto');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Interfaces');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\obj');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Properties');
    ForceDirectories(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Properties\PublishProfiles');

    MappsettingsDevelopment.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\'+'appsettings.Development.json');
    Mappsettings.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\'+'appsettings.json');

    MProgram.Lines.Text := StringReplace(MProgram.Lines.Text, '<NomeProjeto>', Trim(EDT_NomeProjeto.Text),[rfReplaceAll, rfIgnoreCase]);
    MProgram.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\'+'Program.cs');

    MStartup.Lines.Text := StringReplace(MStartup.Lines.Text, '<NomeProjeto>', Trim(EDT_NomeProjeto.Text),[rfReplaceAll, rfIgnoreCase]);
    MStartup.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\'+'Startup.cs');

    Mcsproj.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\'+EDT_NomeProjeto.Text+'.csproj');

    Mcsprojuser.Lines.Text := StringReplace(Mcsprojuser.Lines.Text, '<PathProjeto>',DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text,[rfReplaceAll, rfIgnoreCase]);
    Mcsprojuser.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\'+EDT_NomeProjeto.Text+'.csproj.user');

    MlaunchSettingsjson.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Properties\'+'launchSettings.json');

    MFolderProfilepubxml.Lines.Text := StringReplace(MFolderProfilepubxml.Lines.Text, '<PathProjeto>',DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text,[rfReplaceAll, rfIgnoreCase]);
    MFolderProfilepubxml.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Properties\PublishProfiles\'+'FolderProfile.pubxml');

    MFolderProfilepubxmluser.Lines.Text := StringReplace(MFolderProfilepubxmluser.Lines.Text, '<PathProjeto>',DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text,[rfReplaceAll, rfIgnoreCase]);
    MFolderProfilepubxmluser.Lines.SaveToFile(DLB_PathProj.Directory+'\'+EDT_NomeProjeto.Text+'\Properties\PublishProfiles\'+'FolderProfile.pubxml.user');
    //--------------------------------------------------------------------------
    if TBProjetos.Locate('NomeProjeto',EDT_NomeProjeto.Text,[]) then
    begin
      Showmessage('Nome de projeto j� utilizado!');
      exit;
    end
    else
    begin
      TBProjetos.Append;
      TBProjetosNomeProjeto.AsString := EDT_NomeProjeto.Text;
      TBProjetosPathProjeto.AsString := DLB_PathProj.Directory;
      TBProjetos.Post;
      Showmessage('Projeto Criado Com sucesso.');
    end;
  except
    on E: Exception do
    ShowMessage('Erro ao criar Projeto: ' + E.Message );
  end;
end;

procedure TfrmGeradorCodigo.DBNEntidadeClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbPost then
  begin
    if TBEntidade.State in [dsInsert] then
    begin
      if TBEntidade.Locate('NomeEntidade',TBEntidadeNomeEntidade.AsString,[]) then
      begin
        Showmessage('Nome de entidade j� utilizado!');
        Abort;
      end;
    end;
  end
  else
    if Button = nbInsert then
      TBEntidadeStatus.AsString := 'N�o Gerado';
end;

procedure TfrmGeradorCodigo.DBN_DaoClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbPost then
  begin
    if TBTabelaDAO.State in [dsInsert] then
    begin
      if TBTabelaDAO.Locate('NomeTBfisicaDAO',TBTabelaDAONomeTBfisicaDAO.AsString,[]) then
      begin
        Showmessage('Nome de Tabela DAO j� utilizado!');
        Abort;
      end;
    end;
  end
  else
    if Button = nbInsert then
      TBTabelaDAOStatus.AsString := 'N�o Gerado';
end;

procedure TfrmGeradorCodigo.FormCreate(Sender: TObject);
begin
  TBProjetos.Close;
  TBProjetos.open;
  TBEntidade.Close;
  TBEntidade.Open;
  TBCamposEtidade.Close;
  TBCamposEtidade.Open;
  TBTabelaDAO.Close;
  TBTabelaDAO.Open;
  TBCamposDAO.Close;
  TBCamposDAO.Open;
end;

procedure TfrmGeradorCodigo.FormShow(Sender: TObject);
begin
  EDT_NomeProjeto.Text   := TBProjetosNomeProjeto.AsString;
  DLB_PathProj.Directory := TBProjetosPathProjeto.AsString;
end;

end.
