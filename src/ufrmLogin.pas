unit ufrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cUser, udm;

type
  TfrmLogin = class(TForm)
    pnl_principal: TPanel;
    pnl_usuario: TPanel;
    edt_User: TEdit;
    pnl_senha: TPanel;
    edt_senha: TEdit;
    pnl_entrar: TPanel;
    btn_entrar: TSpeedButton;
    pnl_cancelar: TPanel;
    btn_cancelar: TSpeedButton;
    Panel_Login: TPanel;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_entrarClick(Sender: TObject);
    procedure edt_senhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses ufrmPrincipal;

procedure TfrmLogin.btn_cancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btn_entrarClick(Sender: TObject);
var
  oUser : TUser;
begin

  oUser := TUser.Create(dm.conexao);
  try

    if oUser.FazerLogin(edt_User.Text,edt_senha.Text) then
    begin
    frmPrincipal.oUserLogado := oUser;
    ModalResult := mrOk;
    end
    else
    begin
    ShowMessage(oUser.Erro);
    oUser.Free;
    Abort;
    end;

  finally
  // objeto oUser e destruido no onclose do form principal..
  end;

end;

procedure TfrmLogin.edt_senhaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin
  btn_entrarClick(sender);
  end;

end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Limpar o formulario da memoria ao fecha-lo..}
  Action := TCloseAction.caFree;
  frmLogin := nil;
  {Fim}
end;

end.
