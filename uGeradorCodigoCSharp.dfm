object frmGeradorCodigo: TfrmGeradorCodigo
  Left = 0
  Top = 0
  Caption = 'Gerador de C'#243'digo CSharp'
  ClientHeight = 571
  ClientWidth = 1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pn_Principal: TPanel
    Left = 0
    Top = 0
    Width = 1087
    Height = 571
    Align = alClient
    BevelOuter = bvNone
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Mappsettings: TMemo
      Left = 184
      Top = 534
      Width = 801
      Height = 377
      Lines.Strings = (
        '{'
        '  "ConnectionStrings": {'
        
          '    "DefaultConnection": "Data Source=DEVHONORATO;Initial Catalo' +
          'g=BDManufatura;Integrated Security=true"'
        '  },'
        '  "Logging": {'
        '    "LogLevel": {'
        '      "Default": "Information",'
        '      "Microsoft.AspNetCore": "Warning"'
        '    }'
        '  },'
        '  "AllowedHosts": "*"')
      ScrollBars = ssBoth
      TabOrder = 2
      Visible = False
    end
    object Mcsproj: TMemo
      Left = 198
      Top = 556
      Width = 801
      Height = 377
      Lines.Strings = (
        '<Project Sdk="Microsoft.NET.Sdk.Web">'
        ''
        '  <PropertyGroup>'
        '    <TargetFramework>net7.0</TargetFramework>'
        '    <Nullable>enable</Nullable>'
        '    <ImplicitUsings>enable</ImplicitUsings>'
        '  </PropertyGroup>'
        ''
        '  <ItemGroup>'
        '    <PackageReference Include="Dapper" Version="2.1.24" />'
        
          '    <PackageReference Include="Microsoft.AspNetCore.Cors" Versio' +
          'n="2.2.0" />'
        
          '    <PackageReference Include="Microsoft.AspNetCore.OpenApi" Ver' +
          'sion="7.0.5" />'
        
          '    <PackageReference Include="Swashbuckle.AspNetCore" Version="' +
          '6.5.0" />'
        
          '    <PackageReference Include="Swashbuckle.AspNetCore.Annotation' +
          's" Version="6.5.0" />'
        
          '    <PackageReference Include="System.Data.SqlClient" Version="4' +
          '.8.5" />'
        '  </ItemGroup>'
        ''
        '</Project>')
      ScrollBars = ssBoth
      TabOrder = 5
      Visible = False
    end
    object Mcsprojuser: TMemo
      Left = 184
      Top = 534
      Width = 903
      Height = 369
      Lines.Strings = (
        '<?xml version="1.0" encoding="utf-8"?>'
        
          '<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.' +
          'com/developer/msbuild/2003">'
        '  <PropertyGroup>'
        '    <ActiveDebugProfile>http</ActiveDebugProfile>'
        
          '    <NameOfLastUsedPublishProfile><PathProjeto>\Properties\Publi' +
          'shProfiles\FolderProfile.pubxml</NameOfLastUsedPublishProfile>'
        '  </PropertyGroup>'
        
          '  <PropertyGroup Condition="'#39'$(Configuration)|$(Platform)'#39'=='#39'Deb' +
          'ug|AnyCPU'#39'">'
        '    <DebuggerFlavor>ProjectDebugger</DebuggerFlavor>'
        '  </PropertyGroup>'
        
          '  <PropertyGroup Condition="'#39'$(Configuration)|$(Platform)'#39'=='#39'Rel' +
          'ease|AnyCPU'#39'">'
        '    <DebuggerFlavor>ProjectDebugger</DebuggerFlavor>'
        '  </PropertyGroup>'
        '</Project>')
      ScrollBars = ssBoth
      TabOrder = 6
      Visible = False
      WordWrap = False
    end
    object MStartup: TMemo
      Left = 232
      Top = 556
      Width = 799
      Height = 377
      Lines.Strings = (
        'using System;'
        'using <NomeProjeto>.DAO;'
        'using <NomeProjeto>.Data;'
        'using <NomeProjeto>.Interfaces;'
        ''
        'namespace <NomeProjeto>'
        '{'
        '    public class Startup'
        '    {'
        '        private WebApplicationBuilder _builder;'
        ''
        '        public Startup(IConfiguration configuration)'
        '        {'
        '            Configuration = configuration;'
        '        }'
        ''
        '        public IConfiguration Configuration { get; }'
        ''
        ''
        
          '        // This method gets called by the runtime. Use this meth' +
          'od to add services to the container.'
        
          '        public void ConfigureServices(IServiceCollection service' +
          's)'
        '        {'
        '           services.AddCors();'
        '        }'
        ''
        
          '        // This method gets called by the runtime. Use this meth' +
          'od to configure the HTTP request pipeline.'
        
          '        public void Configure(IApplicationBuilder app, IWebHostE' +
          'nvironment env)'
        '        {'
        '            //colocar aqui as Unit de Interface'
        '            var builder = WebApplication.CreateBuilder();'
        '            builder.Services.AddControllers();'
        '            builder.Services.AddEndpointsApiExplorer();'
        
          '            builder.Services.AddSwaggerGen(c => { c.EnableAnnota' +
          'tions(); });'
        
          '            builder.Services.AddScoped<IUsuarioRepository, Usuar' +
          'ioRepository>();  //N'#227'o pode esquecer do scopo dos reposit'#243'rios'
        
          '            builder.Services.AddScoped<ICadgrupoRepository, Cadg' +
          'rupoRepository>();'
        '            var bui = builder.Build();'
        ''
        '            if (env.IsDevelopment())'
        '            {'
        '                app.UseDeveloperExceptionPage();'
        '            }'
        ''
        '            bui.UseCors(options => options'
        '                .WithOrigins(new[] {'
        '                                     "http://localhost:4200",'
        '                                     "http://localhost:5000",'
        '                                     "http://localhost:5432"'
        '                                   }'
        '                )'
        '                .AllowAnyOrigin()'
        '                .AllowAnyMethod()'
        
          '                .AllowAnyHeader()                               ' +
          '                '
        '            );'
        ''
        '            bui.UseHttpsRedirection();'
        '            bui.UseAuthorization();'
        '            bui.MapControllers();'
        '            bui.UseSwagger();'
        '            bui.UseSwaggerUI();'
        '            bui.Run();'
        ''
        '        }'
        '    }'
        '}')
      ScrollBars = ssBoth
      TabOrder = 4
      Visible = False
      WantReturns = False
    end
    object MProgram: TMemo
      Left = 232
      Top = 556
      Width = 767
      Height = 377
      Lines.Strings = (
        'namespace <NomeProjeto>'
        '{'
        '    public class Program'
        '    {'
        '        public static void Main(string[] args)'
        '        {'
        '            CreateHostBuilder(args).Build().Run();'
        '        }'
        ''
        
          '        public static IHostBuilder CreateHostBuilder(string[] ar' +
          'gs) =>'
        '            Host.CreateDefaultBuilder(args)'
        '                .ConfigureWebHostDefaults(webBuilder =>'
        '                {'
        '                    webBuilder.UseStartup<Startup>();'
        '                });'
        '    }'
        '}')
      ScrollBars = ssBoth
      TabOrder = 3
      Visible = False
    end
    object MappsettingsDevelopment: TMemo
      Left = 216
      Top = 534
      Width = 801
      Height = 377
      Lines.Strings = (
        '{'
        '  "Logging": {'
        '    "LogLevel": {'
        '      "Default": "Information",'
        '      "Microsoft.AspNetCore": "Warning"'
        '    }'
        '  }'
        '}')
      ScrollBars = ssBoth
      TabOrder = 1
      Visible = False
    end
    object MProjeto_sln: TMemo
      Left = 216
      Top = 534
      Width = 1119
      Height = 449
      Lines.Strings = (
        'Microsoft Visual Studio Solution File, Format Version 12.00'
        '# Visual Studio Version 17'
        'VisualStudioVersion = 17.5.33627.172'
        'MinimumVisualStudioVersion = 10.0.40219.1'
        
          'Project("{9A19103F-16F7-4668-BE54-9A1E7A4F7556}") = "<NomeProjet' +
          'o>", "<NomeProjeto>\<NomeProjeto>.csproj", "{ED2B33E0-EABB-4293-' +
          '8B92-46CADAC2004D}"'
        'EndProject'
        
          'Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = "Solution It' +
          'ems", "Solution Items", "{78B02A2E-E0B3-475D-81A9-FF5082EB5679}"'
        #9'ProjectSection(SolutionItems) = preProject'
        #9#9'.editorconfig = .editorconfig'
        #9'EndProjectSection'
        'EndProject'
        'Global'
        #9'GlobalSection(SolutionConfigurationPlatforms) = preSolution'
        #9#9'Debug|Any CPU = Debug|Any CPU'
        #9#9'Release|Any CPU = Release|Any CPU'
        #9'EndGlobalSection'
        #9'GlobalSection(ProjectConfigurationPlatforms) = postSolution'
        
          #9#9'{ED2B33E0-EABB-4293-8B92-46CADAC2004D}.Debug|Any CPU.ActiveCfg' +
          ' = Debug|Any CPU'
        
          #9#9'{ED2B33E0-EABB-4293-8B92-46CADAC2004D}.Debug|Any CPU.Build.0 =' +
          ' Debug|Any CPU'
        
          #9#9'{ED2B33E0-EABB-4293-8B92-46CADAC2004D}.Release|Any CPU.ActiveC' +
          'fg = Release|Any CPU'
        
          #9#9'{ED2B33E0-EABB-4293-8B92-46CADAC2004D}.Release|Any CPU.Build.0' +
          ' = Release|Any CPU'
        #9'EndGlobalSection'
        #9'GlobalSection(SolutionProperties) = preSolution'
        #9#9'HideSolutionNode = FALSE'
        #9'EndGlobalSection'
        #9'GlobalSection(ExtensibilityGlobals) = postSolution'
        #9#9'SolutionGuid = {F1B07172-1DAC-4E8E-8D26-3C23851958E9}'
        #9'EndGlobalSection'
        'EndGlobal')
      ScrollBars = ssBoth
      TabOrder = 0
      Visible = False
    end
    object MlaunchSettingsjson: TMemo
      Left = 184
      Top = 534
      Width = 705
      Height = 121
      Lines.Strings = (
        '{'
        '  "$schema": "https://json.schemastore.org/launchsettings.json",'
        '  "iisSettings": {'
        '    "windowsAuthentication": false,'
        '    "anonymousAuthentication": true,'
        '    "iisExpress": {'
        '      "applicationUrl": "http://localhost:31965",'
        '      "sslPort": 44341'
        '    }'
        '  },'
        '  "profiles": {'
        '    "http": {'
        '      "commandName": "Project",'
        '      "dotnetRunMessages": true,'
        '      "launchBrowser": true,'
        '      "launchUrl": "swagger",'
        '      "applicationUrl": "http://localhost:5227",'
        '      "environmentVariables": {'
        '        "ASPNETCORE_ENVIRONMENT": "Development"'
        '      }'
        '    },'
        '    "https": {'
        '      "commandName": "Project",'
        '      "dotnetRunMessages": true,'
        '      "launchBrowser": true,'
        '      "launchUrl": "swagger",'
        
          '      "applicationUrl": "http://localhost:7244;http://localhost:' +
          '5227",'
        '      "environmentVariables": {'
        '        "ASPNETCORE_ENVIRONMENT": "Development"'
        '      }'
        '    },'
        '    "IIS Express": {'
        '      "commandName": "IISExpress",'
        '      "launchBrowser": true,'
        '      "launchUrl": "swagger",'
        '      "environmentVariables": {'
        '        "ASPNETCORE_ENVIRONMENT": "Development"'
        '      }'
        '    }'
        '  }'
        '}')
      ScrollBars = ssBoth
      TabOrder = 7
      Visible = False
    end
    object MFolderProfilepubxml: TMemo
      Left = 184
      Top = 556
      Width = 721
      Height = 142
      Lines.Strings = (
        '<?xml version="1.0" encoding="utf-8"?>'
        '<!--'
        'https://go.microsoft.com/fwlink/?LinkID=208121.'
        '-->'
        '<Project>'
        '  <PropertyGroup>'
        '    <DeleteExistingFiles>false</DeleteExistingFiles>'
        '    <ExcludeApp_Data>false</ExcludeApp_Data>'
        '    <LaunchSiteAfterPublish>true</LaunchSiteAfterPublish>'
        
          '    <LastUsedBuildConfiguration>Release</LastUsedBuildConfigurat' +
          'ion>'
        '    <LastUsedPlatform>Any CPU</LastUsedPlatform>'
        '    <PublishProvider>FileSystem</PublishProvider>'
        '    <PublishUrl><PathProjeto></PublishUrl>'
        '    <WebPublishMethod>FileSystem</WebPublishMethod>'
        '    <_TargetId>Folder</_TargetId>'
        '  </PropertyGroup>'
        '</Project>')
      ScrollBars = ssBoth
      TabOrder = 8
      Visible = False
    end
    object MFolderProfilepubxmluser: TMemo
      Left = 312
      Top = 556
      Width = 841
      Height = 129
      Lines.Strings = (
        '<?xml version="1.0" encoding="utf-8"?>'
        '<!--'
        'https://go.microsoft.com/fwlink/?LinkID=208121.'
        '-->'
        '<Project>'
        '  <PropertyGroup>'
        '    <_PublishTargetUrl><PathProjeto></_PublishTargetUrl>'
        
          '    <History>True|2023-12-03T01:40:10.4410054Z;True|2023-12-02T1' +
          '6:22:00.5030386-03:00;True|2023-12-02T14:07:35.0773999-03:00;Tru' +
          'e|2023-11-30T21:51:19.1599516-03:00;True|2023-11-30T21:37:45.054' +
          '9342-03:00;True|2023-11-30T21:37:19.8067376-03:00;True|2023-11-3' +
          '0T21:20:24.8985909-03:00;True|2023-11-30T21:19:36.2743237-03:00;' +
          'True|2023-11-30T20:00:36.9446420-03:00;True|2023-11-30T20:00:14.' +
          '6717623-03:00;True|2023-11-29T23:08:08.8925804-03:00;True|2023-1' +
          '1-29T23:06:13.0904592-03:00;True|2023-11-29T23:01:03.8299277-03:' +
          '00;True|2023-11-29T22:59:05.7628636-03:00;True|2023-11-29T22:56:' +
          '53.4760835-03:00;True|2023-11-29T22:48:55.9853081-03:00;True|202' +
          '3-11-29T22:41:33.5517030-03:00;True|2023-11-29T22:23:57.5716964-' +
          '03:00;True|2023-11-29T22:20:52.1154723-03:00;True|2023-11-29T22:' +
          '16:03.1975672-03:00;True|2023-11-29T22:08:03.1630524-03:00;True|' +
          '2023-11-29T22:06:44.1043788-03:00;True|2023-11-26T23:14:19.48031' +
          '34-03:00;True|2023-11-26T23:08:58.5912859-03:00;True|2023-11-26T' +
          '23:05:52.3188982-03:00;True|2023-11-26T23:05:37.9495446-03:00;Tr'
        'ue|2023-11-26T22:58:42.3091730-03:00;</History>'
        '    <LastFailureDetails />'
        '  </PropertyGroup>'
        '</Project>')
      ScrollBars = ssBoth
      TabOrder = 9
      Visible = False
    end
    object pct_Projetos: TPageControl
      Left = 0
      Top = 0
      Width = 1087
      Height = 571
      ActivePage = TBS_Dao
      Align = alClient
      TabOrder = 10
      ExplicitLeft = -16
      object TBS_Projeto: TTabSheet
        Caption = 'Projeto'
        object Label1: TLabel
          Left = 5
          Top = 3
          Width = 87
          Height = 13
          Caption = 'Nome do Projeto :'
        end
        object Label2: TLabel
          Left = 5
          Top = 51
          Width = 154
          Height = 13
          Caption = 'Caminho de destino do projeto :'
        end
        object EDT_NomeProjeto: TEdit
          Left = 5
          Top = 21
          Width = 154
          Height = 21
          TabOrder = 0
        end
        object DBGrid1: TDBGrid
          Left = 171
          Top = 21
          Width = 894
          Height = 446
          DataSource = ds_Projeto
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NomeProjeto'
              Title.Caption = 'Nome do Projeto'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PathProjeto'
              Title.Caption = 'Path do Projeto'
              Visible = True
            end>
        end
        object DLB_PathProj: TDirectoryListBox
          Left = 5
          Top = 67
          Width = 154
          Height = 369
          TabOrder = 2
        end
        object btn_Criaprojeto: TBitBtn
          Left = 5
          Top = 442
          Width = 154
          Height = 25
          Caption = 'Criar Projeto'
          TabOrder = 3
          OnClick = btn_CriaprojetoClick
        end
      end
      object TBS_Entidade: TTabSheet
        Caption = 'Entidade'
        ImageIndex = 1
        object Label4: TLabel
          Left = 8
          Top = 16
          Width = 87
          Height = 13
          Caption = 'Nome da Entidade'
        end
        object Label3: TLabel
          Left = 11
          Top = 119
          Width = 98
          Height = 13
          Caption = 'Campos da Entidade'
        end
        object GRD_Campos: TDBGrid
          Left = 3
          Top = 144
          Width = 798
          Height = 139
          DataSource = ds_CamposEtidade
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DescricaoCampo'
              Title.Caption = 'Descri'#231#227'o do Campo'
              Width = 505
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TipoCampo'
              Title.Caption = 'Tipo de Campo'
              Width = 190
              Visible = True
            end>
        end
        object DBNEntidade: TDBNavigator
          Left = 107
          Top = 10
          Width = 80
          Height = 25
          DataSource = ds_Entidade
          VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel]
          TabOrder = 1
          OnClick = DBNEntidadeClick
        end
        object DBNavigator1: TDBNavigator
          Left = 3
          Top = 289
          Width = 240
          Height = 25
          DataSource = ds_CamposEtidade
          TabOrder = 2
        end
        object btnGerarCodigo: TBitBtn
          Left = 3
          Top = 320
          Width = 154
          Height = 25
          Caption = 'Gerar Entidade'
          TabOrder = 3
          OnClick = btnGerarCodigoClick
        end
        object MEntidade: TMemo
          Left = 3
          Top = 355
          Width = 798
          Height = 185
          Lines.Strings = (
            'namespace <NomeProjeto>.Domain'
            '{'
            '    public class <NomeEntidade>'
            '    {'
            '        public <Tipo> <NomeCampo>       { get; set; }'
            '    }'
            '}')
          ScrollBars = ssBoth
          TabOrder = 4
        end
        object GRD_Entidades: TDBGrid
          Left = 3
          Top = 40
          Width = 798
          Height = 73
          DataSource = ds_Entidade
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NomeEntidade'
              Title.Caption = 'Nome da Entidade'
              Width = 541
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status'
              ReadOnly = True
              Width = 191
              Visible = True
            end>
        end
      end
      object TBS_Dao: TTabSheet
        Caption = 'DAO'
        ImageIndex = 2
        object Label5: TLabel
          Left = 16
          Top = 24
          Width = 127
          Height = 13
          Caption = 'Nome da tabela f'#237'sica DAO'
        end
        object Label6: TLabel
          Left = 19
          Top = 128
          Width = 138
          Height = 13
          Caption = 'Campos da tabela f'#237'sica DAO'
        end
        object DBN_Dao: TDBNavigator
          Left = 171
          Top = 17
          Width = 80
          Height = 25
          DataSource = ds_TabelaDAO
          VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel]
          TabOrder = 0
          OnClick = DBN_DaoClick
        end
        object GRD_DAO: TDBGrid
          Left = 11
          Top = 48
          Width = 798
          Height = 73
          DataSource = ds_TabelaDAO
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NomeTBfisicaDAO'
              Title.Caption = 'Nome da Tabela fisica no Banco DAO'
              Width = 576
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status'
              ReadOnly = True
              Width = 188
              Visible = True
            end>
        end
        object GRD_CamposDAO: TDBGrid
          Left = 11
          Top = 152
          Width = 798
          Height = 139
          DataSource = ds_CamposDAO
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DescricaoCampo'
              Title.Caption = 'Descri'#231#227'o do Campo'
              Width = 582
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TipoCampo'
              Title.Caption = 'Tipo do Campo'
              Width = 184
              Visible = True
            end>
        end
        object DBN_CamposDao: TDBNavigator
          Left = 11
          Top = 297
          Width = 240
          Height = 25
          DataSource = ds_CamposDAO
          TabOrder = 3
        end
        object MDAO: TMemo
          Left = 11
          Top = 358
          Width = 798
          Height = 185
          ScrollBars = ssBoth
          TabOrder = 4
        end
        object btn_geraDAO: TBitBtn
          Left = 11
          Top = 328
          Width = 154
          Height = 25
          Caption = 'Gerar DAO'
          TabOrder = 5
        end
      end
      object TBS_Interfaces: TTabSheet
        Caption = 'Interfaces'
        ImageIndex = 3
      end
      object TBS_DTO: TTabSheet
        Caption = 'Dto'
        ImageIndex = 4
      end
      object TBS_Controllers: TTabSheet
        Caption = 'Controllers'
        ImageIndex = 5
      end
    end
  end
  object TBProjetos: TClientDataSet
    Aggregates = <>
    FileName = 'E:\Sistemas\Delphi\Gerador_C#\DADOS\TBProjetos.cds'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'NomeProjeto'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PathProjeto'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'IDXNomeprojeto'
        Fields = 'NomeProjeto'
        Options = [ixUnique]
      end>
    Params = <>
    StoreDefs = True
    Left = 736
    Top = 328
    object TBProjetosID: TAutoIncField
      FieldName = 'ID'
    end
    object TBProjetosNomeProjeto: TStringField
      FieldName = 'NomeProjeto'
      Size = 60
    end
    object TBProjetosPathProjeto: TStringField
      FieldName = 'PathProjeto'
      Size = 100
    end
  end
  object ds_Projeto: TDataSource
    DataSet = TBProjetos
    Left = 800
    Top = 328
  end
  object TBEntidade: TClientDataSet
    Aggregates = <>
    FileName = 'E:\Sistemas\Delphi\Gerador_C#\DADOS\TBCabEntidade.cds'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'IDProjeto'
        DataType = ftInteger
      end
      item
        Name = 'NomeEntidade'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'IDXNomeEntidade'
        Fields = 'NomeEntidade'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDProjeto'
    MasterFields = 'ID'
    MasterSource = ds_Projeto
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 740
    Top = 376
    object TBEntidadeID: TAutoIncField
      FieldName = 'ID'
    end
    object TBEntidadeIDProjeto: TIntegerField
      FieldName = 'IDProjeto'
    end
    object TBEntidadeNomeEntidade: TStringField
      FieldName = 'NomeEntidade'
      Size = 60
    end
    object TBEntidadeStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
  end
  object ds_Entidade: TDataSource
    DataSet = TBEntidade
    Left = 804
    Top = 376
  end
  object TBCamposEtidade: TClientDataSet
    Aggregates = <>
    FileName = 'E:\Sistemas\Delphi\Gerador_C#\DADOS\TBCamposEntidade.cds'
    IndexFieldNames = 'IDEntidade'
    MasterFields = 'ID'
    MasterSource = ds_Entidade
    PacketRecords = 0
    Params = <>
    Left = 748
    Top = 432
    object TBCamposEtidadeID: TAutoIncField
      FieldName = 'ID'
    end
    object TBCamposEtidadeIDEntidade: TIntegerField
      FieldName = 'IDEntidade'
    end
    object TBCamposEtidadeDescricaoCampo: TStringField
      FieldName = 'DescricaoCampo'
      Size = 60
    end
    object TBCamposEtidadeTipoCampo: TStringField
      FieldName = 'TipoCampo'
      Size = 40
    end
  end
  object ds_CamposEtidade: TDataSource
    DataSet = TBCamposEtidade
    Left = 812
    Top = 432
  end
  object ds_TabelaDAO: TDataSource
    DataSet = TBTabelaDAO
    Left = 668
    Top = 352
  end
  object TBTabelaDAO: TClientDataSet
    Aggregates = <>
    FileName = 'E:\Sistemas\Delphi\Gerador_C#\DADOS\TBCabDAO.cds'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'IDProjeto'
        DataType = ftInteger
      end
      item
        Name = 'NomeTBfisicaDAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'IDXNomeTbfisicaDAO'
        DescFields = 'NomeTBfisicaDAO'
        Fields = 'NomeTBfisicaDAO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDProjeto'
    MasterFields = 'ID'
    MasterSource = ds_Projeto
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 612
    Top = 352
    object TBTabelaDAOID: TAutoIncField
      FieldName = 'ID'
    end
    object TBTabelaDAOIDProjeto: TIntegerField
      FieldName = 'IDProjeto'
    end
    object TBTabelaDAONomeTBfisicaDAO: TStringField
      FieldName = 'NomeTBfisicaDAO'
      Size = 60
    end
    object TBTabelaDAOStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
  end
  object TBCamposDAO: TClientDataSet
    Aggregates = <>
    FileName = 'E:\Sistemas\Delphi\Gerador_C#\DADOS\TBCamposDAO.cds'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'IDTbDAO'
        DataType = ftInteger
      end
      item
        Name = 'DescricaoCampo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TipoCampo'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 604
    Top = 408
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
    end
    object IntegerField1: TIntegerField
      FieldName = 'IDTbDAO'
    end
    object StringField1: TStringField
      FieldName = 'DescricaoCampo'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'TipoCampo'
      Size = 40
    end
  end
  object ds_CamposDAO: TDataSource
    DataSet = TBCamposDAO
    Left = 668
    Top = 408
  end
end
