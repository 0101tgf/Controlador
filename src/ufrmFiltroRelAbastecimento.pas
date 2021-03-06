unit ufrmFiltroRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, udm, uRelAbastecimentos, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmFiltroRelAbastecimento = class(TForm)
    DateInicial: TDateTimePicker;
    DateFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btn_Cancelar: TSpeedButton;
    Panel1: TPanel;
    btn_Confirmar: TSpeedButton;
    DataSource_RelatorioAbastecimento: TDataSource;
    FDQuery_RelatorioAbastecimento: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_ConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRelAbastecimento: TfrmFiltroRelAbastecimento;

implementation

{$R *.dfm}

procedure TfrmFiltroRelAbastecimento.btn_CancelarClick(Sender: TObject);
begin
  frmFiltroRelAbastecimento.Close;
end;

procedure TfrmFiltroRelAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Limpar o formulario da memoria ao fecha-lo..}
  Action := TCloseAction.caFree;
  frmFiltroRelAbastecimento := nil;
  {Fim}
end;

procedure TfrmFiltroRelAbastecimento.FormCreate(Sender: TObject);
begin
  DateInicial.Date := Now;
  DateFinal.Date := Now;
  FDQuery_RelatorioAbastecimento.Active := false;
  FDQuery_RelatorioAbastecimento.Connection := dm.conexao;
end;

procedure TfrmFiltroRelAbastecimento.btn_ConfirmarClick(Sender: TObject);
begin

  FDQuery_RelatorioAbastecimento.Active := false;
  FDQuery_RelatorioAbastecimento.SQL.Clear;
  FDQuery_RelatorioAbastecimento.SQL.Add('select Data_Movimento,Tanque, Combustivel, Bomba, ');
  FDQuery_RelatorioAbastecimento.SQL.Add('sum(Total) as Total from TAB_ABASTECIMENTOS ');
  FDQuery_RelatorioAbastecimento.SQL.Add('where Data_Movimento between :DataIni and :DataFim group by Data_Movimento,Tanque,Bomba ');
  FDQuery_RelatorioAbastecimento.SQL.Add('order by 1');
  FDQuery_RelatorioAbastecimento.ParamByName('DataIni').AsDateTime := DateInicial.Date;
  FDQuery_RelatorioAbastecimento.ParamByName('DataFim').AsDateTime := DateFinal.Date;

  FDQuery_RelatorioAbastecimento.Active := true;

  if FDQuery_RelatorioAbastecimento.RecordCount = 0 then
  begin
    ShowMessage('N?o foram encontrado abastecimentos no per?odo informado..');
    exit;
  end;

  try
  frmRelAbastecimentos := TfrmRelAbastecimentos.Create(self);
  frmRelAbastecimentos.Relatorio.PreviewModal;
  finally
  frmRelAbastecimentos.Release;
  end;

end;

end.
