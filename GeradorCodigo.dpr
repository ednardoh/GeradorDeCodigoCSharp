program GeradorCodigo;

uses
  Vcl.Forms,
  uGeradorCodigoCSharp in 'uGeradorCodigoCSharp.pas' {frmGeradorCodigo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGeradorCodigo, frmGeradorCodigo);
  Application.Run;
end.
