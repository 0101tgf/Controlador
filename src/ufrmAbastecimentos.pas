unit ufrmAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,cAbastecimento;

type
  TfrmAbastecimentos = class(TForm)
    pnl_Centro: TPanel;
    pnl_Botom: TPanel;
    Panel_Botoes: TPanel;
    Panel6: TPanel;
    btn_Novo: TSpeedButton;
    Panel1: TPanel;
    btn_Fechar: TSpeedButton;
    Panel2: TPanel;
    btn_Cancelar: TSpeedButton;
    pnl_Client: TPanel;
    Panel_Top: TPanel;
    pnl_barra: TPanel;
    lbl_Titulo: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    edt_Documento: TEdit;
    ComboBox_Cliente: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox_Bomba: TComboBox;
    Label4: TLabel;
    Edit_QtdLitros: TEdit;
    Panel4: TPanel;
    btn_Salvar: TSpeedButton;
    edt_Total: TEdit;
    Label5: TLabel;
    edt_Imposto: TEdit;
    Label6: TLabel;
    Panel5: TPanel;
    btn_Lancar: TSpeedButton;
    Panel_Entradas: TPanel;
    DBGrid_Lancamentos: TDBGrid;
    FDMemTable: TFDMemTable;
    DataSource: TDataSource;
    FDMemTableCodEmp: TIntegerField;
    FDMemTableData_Movimento: TDateField;
    FDMemTableDocumento: TIntegerField;
    FDMemTableTanque: TIntegerField;
    FDMemTableBomba: TIntegerField;
    FDMemTableCombustivel: TStringField;
    FDMemTableQtd_Litros: TFloatField;
    FDMemTableValor_Uni: TCurrencyField;
    FDMemTableTotal: TCurrencyField;
    edt_VlrUni: TEdit;
    Label7: TLabel;
    FDMemTableImposto: TFloatField;
    Edit_TotalGeral: TEdit;
    Label8: TLabel;
    FDMemTableTotalGeral: TAggregateField;
    FDMemTableCliente: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_FecharClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure ComboBox_BombaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit_QtdLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure btn_LancarClick(Sender: TObject);
    procedure Edit_QtdLitrosExit(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure pLimparCampos(LimpaDataSet : string);
    procedure pCalculaTotalVenda;
    function  ConvertValor(vl: string): Currency;
    function  fValidaCamposObrigatorios:Boolean;
    procedure pValidaValorDigitado(Sender: TObject;var Key: Char);
    function  fCalculaImposto(valorUnitario, Litros, Imposto: Double): Double;
    function  TotalizarProduto(valorUnitario, Litros, Imposto: Double): Double;

  public
    { Public declarations }

  end;

var
  frmAbastecimentos: TfrmAbastecimentos;

implementation

{$R *.dfm}

uses udm;

procedure TfrmAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Limpar o formulario da memoria ao fecha-lo..}
  Action := TCloseAction.caFree;
  frmAbastecimentos := nil;
  {Fim}
end;

procedure TfrmAbastecimentos.FormCreate(Sender: TObject);
begin
  btn_NovoClick(self);
end;

function TfrmAbastecimentos.fValidaCamposObrigatorios: Boolean;
begin

  DBGrid_Lancamentos.SetFocus;

  Result := false;

  if (ConvertValor(edt_Documento.Text) <=0) or (edt_Documento.Text = '') then begin
  ShowMessage('Atenção, o numero do documento não pode estar vazio..');
  exit;
  end;

  if ComboBox_Cliente.ItemIndex = -1 then
  begin
  ShowMessage('Atenção informe um cliente..');
  exit;
  end;

  if ComboBox_Bomba.ItemIndex = -1 then
  begin
  ShowMessage('Atenção informe uma bomba..');
  exit;
  end;

  if (ConvertValor(Edit_QtdLitros.Text) <=0) or (Edit_QtdLitros.Text = '') then
  begin
  ShowMessage('A quantidade de litros não pode ser menor ou igual a zero..');
  exit;
  end;

  if (ConvertValor(edt_VlrUni.Text) <=0) or (edt_VlrUni.Text = '') then
  begin
  ShowMessage('O valor unitário não pode ser menor ou igual a zero..');
  exit;
  end;

  if (ConvertValor(edt_Imposto.Text) <=0) or (edt_Imposto.Text = '') then
  begin
  ShowMessage('O imposto não pode ser menor ou igual a zero..');
  exit;
  end;

  edt_Total.Text := FormatFloat('#0.00', TotalizarProduto(StrToFloat(Edit_QtdLitros.text),StrToFloat(edt_VlrUni.text),StrToFloat(edt_Imposto.Text)));

  if (ConvertValor(edt_Total.Text) <=0) or (edt_Total.Text = '') then begin
  ShowMessage('O valor total não pode ser menor ou igual a zero..');
  exit;
  end;

  Result := true;

end;

procedure TfrmAbastecimentos.pCalculaTotalVenda;
begin
  Edit_TotalGeral.Text :=  FormatFloat('#0.00', FDMemTable.FieldByName('TotalGeral').Value);
end;

procedure TfrmAbastecimentos.pLimparCampos(LimpaDataSet : string);
begin

 if LimpaDataSet = 'SIM' then
 begin

   if FDMemTable.Active then
   begin
   FDMemTable.Active := false;
   end;

   FDMemTable.Open;

 end;

 edt_Documento.Text := '';
 ComboBox_Cliente.ItemIndex := -1;
 ComboBox_Bomba.ItemIndex := -1;
 Edit_QtdLitros.Text := '';
 edt_Total.Text := '';
 edt_VlrUni.Text := '';
 edt_Imposto.Text := '13';
 Edit_TotalGeral.Text := '';

end;

procedure TfrmAbastecimentos.pValidaValorDigitado(Sender: TObject;
  var Key: Char);
begin

  if key in ['0','1','2','3','4','5','6','7','8','9',',',#8] = false then
  begin
  key:=#0;
  end;

end;

function TfrmAbastecimentos.TotalizarProduto(valorUnitario, Litros,
  Imposto: Double): Double;
  var
  FCalculo : Double;
  FCalculoImposto : Double;
begin
  FCalculo := (valorUnitario * Litros);
  FCalculoImposto := fCalculaImposto(valorUnitario,Litros,Imposto);
  FCalculo := FCalculo+FCalculoImposto;
  result := FCalculo;
end;

procedure TfrmAbastecimentos.btn_CancelarClick(Sender: TObject);
begin
 pLimparCampos('SIM');
 pnl_Client.Enabled := false;
end;

procedure TfrmAbastecimentos.btn_FecharClick(Sender: TObject);
begin
  frmAbastecimentos.Close;
end;

procedure TfrmAbastecimentos.btn_LancarClick(Sender: TObject);
var
  LNumeroDoc : Integer;
  LImposto : String;
begin

  if not fValidaCamposObrigatorios then
  begin
  exit;
  end;

  try
  FDMemTable.Append;
  FDMemTable.FieldByName('CodEmp').AsInteger := 1;
  FDMemTable.FieldByName('Data_Movimento').AsDateTime := Now;
  FDMemTable.FieldByName('Documento').AsInteger := StrToInt(edt_Documento.Text);
  FDMemTable.FieldByName('Cliente').AsString := ComboBox_Cliente.Text;

    case ComboBox_Bomba.ItemIndex of

      0:
      begin
      FDMemTable.FieldByName('Bomba').AsInteger := 1;
      FDMemTable.FieldByName('Tanque').AsInteger := 1;
      FDMemTable.FieldByName('Combustivel').AsString := 'Gasolina';
      end;
      1:
      begin
      FDMemTable.FieldByName('Bomba').AsInteger := 2;
      FDMemTable.FieldByName('Tanque').AsInteger := 1;
      FDMemTable.FieldByName('Combustivel').AsString := 'Gasolina';
      end;
      2:
      begin
      FDMemTable.FieldByName('Bomba').AsInteger := 1;
      FDMemTable.FieldByName('Tanque').AsInteger := 2;
      FDMemTable.FieldByName('Combustivel').AsString := 'Diesel';
      end;
      3:
      begin
      FDMemTable.FieldByName('Bomba').AsInteger := 2;
      FDMemTable.FieldByName('Tanque').AsInteger := 2;
      FDMemTable.FieldByName('Combustivel').AsString := 'Diesel';
      end;

    end;


  FDMemTable.FieldByName('Qtd_Litros').AsFloat := StrToFloat(Edit_QtdLitros.Text);
  FDMemTable.FieldByName('Valor_Uni').AsCurrency := StrToCurr(edt_VlrUni.Text);
  LImposto := FormatFloat('#0.00',fCalculaImposto(StrToFloat(Edit_QtdLitros.text),StrToFloat(edt_VlrUni.text),StrToFloat(edt_Imposto.Text)));
  FDMemTable.FieldByName('Imposto').AsCurrency := StrToCurr(LImposto);
  FDMemTable.FieldByName('Total').AsCurrency := StrToCurr(edt_Total.Text);
  FDMemTable.Post;
  except
  ShowMessage('Falha ao lançar abastecimento, solicite suporte..');
  exit;
  end;

  pLimparCampos('NÃO');

  try
  pCalculaTotalVenda;
  except
  ShowMessage('Falha ao calcular totais abastecimento..');
  exit;
  end;

  FDMemTable.last;
  edt_Documento.Text := IntToStr(FDMemTable.FieldByName('Documento').AsInteger+1);

end;

procedure TfrmAbastecimentos.btn_NovoClick(Sender: TObject);
var
  LNumeroDoc : Integer;
  oAbastecimento : TAbastecimento;
begin

  pLimparCampos('SIM');

  oAbastecimento := TAbastecimento.Create(dm.conexao);
  try

    if oAbastecimento.GerarNumeroDocumento(LNumeroDoc) then
    begin
    edt_Documento.Text := LNumeroDoc.ToString;
    pnl_Client.Enabled := true;
    end
    else
    begin
    ShowMessage('Falha ao gerar numero do documento, solicite suporte..');
    pnl_Client.Enabled := false;
    end;

  finally
  oAbastecimento.Free;
  end;



end;

procedure TfrmAbastecimentos.btn_SalvarClick(Sender: TObject);
var
  LAbastecimento : TAbastecimento;
  LErro : String;
begin

  LAbastecimento := TAbastecimento.Create(dm.conexao);
  try

    if not LAbastecimento.SalvarAbastecimentos(FDMemTable,LErro) then
    begin
    ShowMessage(LErro);
    end
    else
    begin
    ShowMessage('Abastecimentos registrados com sucesso..');
    btn_NovoClick(Self);
    end;

  finally
  LAbastecimento.Free;
  end;


end;

procedure TfrmAbastecimentos.ComboBox_BombaChange(Sender: TObject);
begin

  case ComboBox_Bomba.ItemIndex of
  -1: begin edt_VlrUni.Text := ''; end;
  0:  begin edt_VlrUni.Text := '5,80' end;
  1:  begin edt_VlrUni.Text := '5,80' end;
  2:  begin edt_VlrUni.Text := '3,80'; end;
  3:  begin edt_VlrUni.Text := '3,80'; end;
  end;

end;

function TfrmAbastecimentos.ConvertValor(vl: string): Currency;
begin
    vl := StringReplace(vl, ',', ',', [rfReplaceAll]);
    vl := StringReplace(vl, '.', '', [rfReplaceAll]);
    vl := StringReplace(vl, 'R$', '', [rfReplaceAll]);

    try
        Result := StrToFloat(vl) / 100;
    except
        Result := 0;
    end;
end;

procedure TfrmAbastecimentos.Edit_QtdLitrosExit(Sender: TObject);
begin

  if (edt_VlrUni.Text <> '') and (Edit_QtdLitros.Text <> '') then
  begin
  edt_Total.Text := FormatFloat('#0.00', TotalizarProduto(StrToFloat(Edit_QtdLitros.text),StrToFloat(edt_VlrUni.text),StrToFloat(edt_Imposto.Text)));
  end;

end;

procedure TfrmAbastecimentos.Edit_QtdLitrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  pValidaValorDigitado(Sender,Key);
end;

function TfrmAbastecimentos.fCalculaImposto(valorUnitario, Litros,
  Imposto: Double): Double;
begin
  Result := (valorUnitario * Litros)*Imposto/100;
end;

end.
