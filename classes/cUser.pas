unit cUser;

interface

uses System.Classes,
     System.SysUtils,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
     FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

type
  TUser = Class
  private
    FConexao: TFDConnection;
    FCodEmp: integer;
    FCodigo: integer;
    FNome: string;
    FSenha: string;
    FAtivo: Integer;
    FErro: string;

  public
    property Conexao: TFDConnection read FConexao write FConexao;
    property CodEmp: integer read FCodEmp write FCodEmp;
    property Codigo: integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Senha: string read FSenha write FSenha;
    property Ativo: Integer read FAtivo write FAtivo;
    property Erro: string read FErro write FErro;
    constructor Create(AConexao:TFDConnection);
    destructor Destroy; override;
    function FazerLogin(ANome,ASenha: String): Boolean;

  End;

implementation

{ TUser }

{$region 'CONSTRUTOR E DESTRUIDOR'}
constructor TUser.Create(AConexao: TFDConnection);
begin
 Conexao := aConexao;
end;

destructor TUser.Destroy;
begin
  inherited;
end;
{$endregion}

{$region 'METODOS'}
function TUser.FazerLogin(ANome,ASenha: String): Boolean;
var
Qry:TFDQuery;
begin

  Result := false;

  if (ANome.Trim.IsEmpty) or (ASenha.Trim.IsEmpty) then
  begin
    Erro := 'Por favor, informe usuário e senha..';
    exit;
  end;

  try

    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=Conexao;
    Qry.Active := false;
    Qry.SQL.Clear;
    Qry.SQL.Add('select CodEmp,Codigo,Nome,Senha,Ativo from TAB_USER Where CodEmp = :CodEmp and Ativo = 1');
    Qry.SQL.Add('AND lower(Nome) = :Nome and lower(Senha) = :Senha limit 1 ');
    Qry.ParamByName('Nome').AsString  := ANome.ToLower;
    Qry.ParamByName('Senha').AsString := ASenha.ToLower;
    Qry.ParamByName('CodEmp').AsInteger := 1;

    Try

      Qry.Active := true;

      if Qry.RecordCount > 0 then
      begin
         CodEmp := Qry.FieldByName('CodEmp').AsInteger;
         Codigo     := Qry.FieldByName('Codigo').AsInteger;
         Nome    := Qry.FieldByName('Senha').AsString;
         Ativo    := Qry.FieldByName('Ativo').AsInteger;
         Erro := '';
         Result := true;
      end
      else
      begin
        result := false;
        Erro := 'Usuário não encontrado, solicite suporte..';
      end;

    Except
      Result:=false;
      Erro := 'Falha ao executar instrução SQL, solicite suporte..';
    End;

  finally

    if Assigned(Qry) then
    begin
    Qry.Free;
    end;


  end;

end;

{$endregion}

end.
