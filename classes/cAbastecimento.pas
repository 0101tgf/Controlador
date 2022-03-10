unit cAbastecimento;

interface

uses System.Classes,
     System.SysUtils,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
     FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

type
  TAbastecimento = Class
    private
    FConexao: TFDConnection;

    public
    constructor Create(AConexao:TFDConnection);
    destructor Destroy; override;
    property Conexao: TFDConnection read FConexao write FConexao;
    function GerarNumeroDocumento(out ANumero : Integer):Boolean;
    function SalvarAbastecimentos(AMemoriaTemporaria: TFDMemTable; out AErro : String):Boolean;
  End;


implementation

{ TAbastecimento }

{$region 'CONSTRUTOR E DESTRUIDOR'}
constructor TAbastecimento.Create(AConexao: TFDConnection);
begin
  Conexao := AConexao;
end;

destructor TAbastecimento.Destroy;
begin
  inherited;
end;

{$endregion}

{$region 'METODOS'}

function TAbastecimento.GerarNumeroDocumento(out ANumero: Integer): Boolean;
var
  qry : TFDQuery;
begin

  Result := false;
  qry := TFDQuery.Create(nil);
  qry.Connection := Conexao;
  try

    try

      qry.Active := false;
      qry.SQL.clear;
      qry.SQL.Add('select max(Documento) as Documento from TAB_ABASTECIMENTOS Where CodEmp = :CodEmp');
      qry.ParamByName('CodEmp').AsInteger := 1;
      qry.Active := true;

      if qry.RecordCount = 0 then
      begin
        exit;
      end;

      if qry.FieldByName('Documento').AsString.Trim.IsEmpty then
      begin
        ANumero := 1;
      end
      else
      begin
        ANumero := qry.FieldByName('Documento').AsString.ToInteger+1;
      end;

      Result := true;

    except
    Result := false;
    end;

  finally
  qry.DisposeOf;
  end;

end;

function TAbastecimento.SalvarAbastecimentos(AMemoriaTemporaria: TFDMemTable;
  out AErro: String): Boolean;
  var
  qry : TFDQuery;
begin

  Result := false;

  if AMemoriaTemporaria.IsEmpty then
  begin
    AErro := 'Atenção, não existem abastecimentos para salvar..';
    exit;
  end;

  qry := TFDQuery.Create(nil);
  qry.Connection := Conexao;
  try

    AMemoriaTemporaria.First;

    while not AMemoriaTemporaria.Eof do
    begin

      qry.Active := false;
      qry.SQL.clear;
      qry.SQL.Add('insert into TAB_ABASTECIMENTOS (CodEmp, Data_Movimento, Documento, Cliente, ');
      qry.SQL.Add('Tanque, Bomba, Combustivel, Qtd_Litros, Valor_Uni, Imposto, Total) ');
      qry.SQL.Add('values (:CodEmp, :Data_Movimento, :Documento, :Cliente, :Tanque, :Bomba, ');
      qry.SQL.Add(':Combustivel,:Qtd_Litros,:Valor_Uni,:Imposto,:Total)');
      qry.ParamByName('CodEmp').AsInteger := 1;
      qry.ParamByName('Data_Movimento').AsDate := AMemoriaTemporaria.FieldByName('Data_Movimento').AsDateTime;
      qry.ParamByName('Documento').AsInteger := AMemoriaTemporaria.FieldByName('Documento').AsInteger;
      qry.ParamByName('Cliente').AsString := AMemoriaTemporaria.FieldByName('Cliente').AsString;
      qry.ParamByName('Tanque').AsInteger := AMemoriaTemporaria.FieldByName('Tanque').AsInteger;
      qry.ParamByName('Bomba').AsInteger := AMemoriaTemporaria.FieldByName('Bomba').AsInteger;
      qry.ParamByName('Combustivel').AsString := AMemoriaTemporaria.FieldByName('Combustivel').AsString;
      qry.ParamByName('Qtd_Litros').AsFloat := AMemoriaTemporaria.FieldByName('Qtd_Litros').AsFloat;
      qry.ParamByName('Valor_Uni').AsCurrency := AMemoriaTemporaria.FieldByName('Valor_Uni').AsCurrency;
      qry.ParamByName('Imposto').AsCurrency := AMemoriaTemporaria.FieldByName('Imposto').AsCurrency;
      qry.ParamByName('Total').AsCurrency := AMemoriaTemporaria.FieldByName('Total').AsCurrency;
      qry.ExecSQL;


      AMemoriaTemporaria.Next;

    end;

    Result := true;

  finally
  qry.DisposeOf;
  end;

end;

{$endregion}

end.
