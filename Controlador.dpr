program Controlador;

uses
  Vcl.Forms,
  ufrmPrincipal in 'src\ufrmPrincipal.pas' {frmPrincipal},
  ufrmLogin in 'src\ufrmLogin.pas' {frmLogin},
  udm in 'src\udm.pas' {dm: TDataModule},
  cUser in 'classes\cUser.pas',
  ufrmAbastecimentos in 'src\ufrmAbastecimentos.pas' {frmAbastecimentos},
  cAbastecimento in 'classes\cAbastecimento.pas',
  uRelAbastecimentos in 'relatorios\uRelAbastecimentos.pas' {frmRelAbastecimentos},
  ufrmFiltroRelAbastecimento in 'src\ufrmFiltroRelAbastecimento.pas' {frmFiltroRelAbastecimento};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
