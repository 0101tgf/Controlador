unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, ufrmLogin, cUser, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Imaging.jpeg,
  ufrmFiltroRelAbastecimento;

type
  TfrmPrincipal = class(TForm)
    pnl_ToolBar: TPanel;
    Img_Menu: TImage;
    Label_Menu: TLabel;
    pnlContent: TPanel;
    ImageList: TImageList;
    SplitView: TSplitView;
    pnl_barra_lateral: TPanel;
    TreeView_Menu: TTreeView;
    Image_Logo: TImage;
    procedure Img_MenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TreeView_MenuDblClick(Sender: TObject);
  private
    { Private declarations }
    function Login:Boolean;
    procedure CliqueTreeView_Operacoes;
    procedure CliqueTreeView_NovosCadastros;
    procedure CliqueTreeView_RelGerenciais;
    procedure CliqueTreeView_Utilitarios;
  public
    { Public declarations }
    oUserLogado : TUser;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses udm, ufrmAbastecimentos;

procedure TfrmPrincipal.CliqueTreeView_RelGerenciais;
begin

  if TreeView_Menu.Items.Item[7].Selected = true then
  begin


    if not Assigned(frmFiltroRelAbastecimento) then
    begin
      Application.CreateForm(TfrmFiltroRelAbastecimento,frmFiltroRelAbastecimento);
    end;

    frmFiltroRelAbastecimento.ShowModal;


  end;

end;

procedure TfrmPrincipal.CliqueTreeView_Utilitarios;
begin

  if TreeView_Menu.Items.Item[9].Selected = true then
  begin
  ShowMessage('Recurso em desenvolvimento..');
  end;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  {Limpar o formulario da memoria ao fecha-lo..}
  Action := TCloseAction.caFree;
  frmPrincipal := nil;

  if Assigned(oUserLogado) then
  begin
  oUserLogado.Free;
  end;
  {Fim}

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  if not Login then
  begin
    Application.Terminate;
    exit;
  end;

  frmPrincipal.Caption := 'Controlador - Gest?o de Abastecimentos |'+' Data: '+DateToStr(Now)+' | Usu?rio: '+oUserLogado.Nome+' | Empresa: Posto ABC';
  SplitView.Width := 240;

end;

procedure TfrmPrincipal.Img_MenuClick(Sender: TObject);
begin

  if SplitView.Opened then
  begin
    SplitView.Close;
  end
  else
  begin
    SplitView.Open;
  end;

end;

function TfrmPrincipal.Login:Boolean;
var
 LForm : TFrmLogin;
begin

   Result := false;

   LForm := TFrmLogin.Create(Self);
   try

      if LForm.ShowModal = mrOk then
      begin
        Result := true;
      end;

   finally
   LForm.Free;
   end;

end;


procedure TfrmPrincipal.CliqueTreeView_NovosCadastros;
begin

  if TreeView_Menu.Items.Item[1].Selected = true then
  begin
  ShowMessage('Recurso em desenvolvimento..');
  end;

  if TreeView_Menu.Items.Item[2].Selected = true then
  begin
  ShowMessage('Recurso em desenvolvimento..');
  end;

  if TreeView_Menu.Items.Item[3].Selected = true then
  begin
  ShowMessage('Recurso em desenvolvimento..');
  end;

end;

procedure TfrmPrincipal.CliqueTreeView_Operacoes;
begin

  if TreeView_Menu.Items.Item[5].Selected = true then
  begin

    if not Assigned(frmAbastecimentos) then
    begin
      Application.CreateForm(TfrmAbastecimentos,frmAbastecimentos);
    end;

    frmAbastecimentos.Parent := pnlContent;
    frmAbastecimentos.Align := TAlign.alClient;
    frmAbastecimentos.WindowState := TWindowState.wsMaximized;
    frmAbastecimentos.Show;

  end;

end;

procedure TfrmPrincipal.TreeView_MenuDblClick(Sender: TObject);
begin
    CliqueTreeView_NovosCadastros;
    CliqueTreeView_Operacoes;
    CliqueTreeView_RelGerenciais;
    CliqueTreeView_Utilitarios;
end;

end.
