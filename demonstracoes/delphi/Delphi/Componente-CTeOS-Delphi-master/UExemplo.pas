{
  Utilitário de exemplo para uso do componente TecnoSpeed CTeOS para integração
  com o sistema de Conhecimento de Transportes Eletrônico.

  @bold(Site oficial)
  @br
  http://www.tecnospeed.com.br

  @author(TecnoSpeed - Consultoria em TI (http://www.tecnospeed.com.br))
  @created(Abril/2010)
}

unit UExemplo;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  XPMan,
  Controls,
  Forms,
  Dialogs,
  xmldom,
  StdCtrls,
  Buttons,
  ExtCtrls,
  ComCtrls,
  IniFiles,
  spdCTeOS,
  spdCTeOSXMLUtils,
  spdCTeOSType,
  spdCTeOSException,
  spdCTeOSUtils,
  spdCTeOSDataSet,
  spdCTeOSDacte,
  spdCustomCTeOS,
//  spdXsdCCeCTeOSDataset,
//  spdCCeCTeOSDataSetAdapter,
  spdCTeOSEventosBase,
  spdCTeOSEventos,
  spdCTeOSEventosUtils,
  {$I GovTLB.inc};

// ******************************************************************************************************
//
// Declarações
//
// ******************************************************************************************************

const
  INI_FILE = 'cteOSConfig.ini';
  INI_SECTION = 'CTEOS';

type
  TTipoConfiguracao = (tcViaIni, tcViaPropriedades);

  TFrmExemplo = class(TForm)
    mStatus: TMemo;
    OpnDlgTx2: TOpenDialog;
    opnDlgXML: TOpenDialog;
    svDlgExportar: TSaveDialog;
    pnlMenu: TPanel;
    pnlConfig: TPanel;
    gbConfig: TGroupBox;
    edtProtocolo: TLabeledEdit;
    edtUF: TLabeledEdit;
    edtCNPJ: TLabeledEdit;
    edtChave: TLabeledEdit;
    edtSH: TLabeledEdit;
    grpOptions: TGroupBox;
    lblInfo: TLabel;
    Label1: TLabel;
    btnConfigIni: TBitBtn;
    btnCancelarCTeOS: TBitBtn;
    btnEnviarCTeOS: TBitBtn;
    btnConsultarCTeOS: TBitBtn;
    btnGerarXMLViaDataSet: TButton;
    btnGerarXMLViaTx2: TButton;
    btnVerificarStatus: TBitBtn;
    btnLoadConfig: TButton;
    btnAssinar: TButton;
    btnPreverDacte: TButton;
    btnConfiguraSH: TBitBtn;
    grpImpressao: TGroupBox;
    btnExportarPDF: TBitBtn;
    btnVisualizar: TBitBtn;
    cbListaCertificados: TComboBox;
    pgCtrlMessages: TPageControl;
    tbSheetMemo: TTabSheet;
    lblHidden: TLabel;
    mOutput: TMemo;
    tbsXMLFormatado: TTabSheet;
    mFmtOutput: TMemo;
    edtAmbiente: TLabeledEdit;
    btnInut: TButton;
    // Inicialização do formulário
    procedure FormCreate(Sender: TObject);
    // Destruição do formulário
    procedure FormDestroy(Sender: TObject);
    // 1.1. Configurar o CNPJ da Software House
    procedure btnConfiguraSHClick(Sender: TObject);
    // 1.2. Configurar CTeOS via arquivo .ini
    procedure btnConfigIniClick(Sender: TObject);
    // 2. LoadConfig
    procedure btnLoadConfigClick(Sender: TObject);
    // 3.Verificar Status do Serviço
    procedure btnVerificarStatusClick(Sender: TObject);
    // 4.1.Gerar XML via TX2
    procedure btnGerarXMLViaTx2Click(Sender: TObject);
    // 4.2.Gerar XML via DataSet
    procedure btnGerarXMLViaDataSetClick(Sender: TObject);
    // 5.1 Assinar CTe
    procedure btnAssinarClick(Sender: TObject);
    // 5.2 Prever DACTE
    procedure btnPreverDacteClick(Sender: TObject);
    // 6.Enviar CTe
    procedure btnEnviarCTeOSClick(Sender: TObject);
    // 7.Consultar CTe
    procedure btnConsultarCTeOSClick(Sender: TObject);
    // 8.Cancelar CTe
    procedure btnCancelarCTeOSClick(Sender: TObject);
    // 9.Visualizar
    procedure btnVisualizarClick(Sender: TObject);
    // 10.Exportar para PDF
    procedure btnExportarPDFClick(Sender: TObject);
    // Gera o XML do Tomador
    procedure CTeGenerateXMLTomadorServico(const aFileName, aXML: String);
    procedure FormShow(Sender: TObject);
    procedure btnValidarLoteEnvioClick(Sender: TObject);
    procedure btnInutClick(Sender: TObject);

  private
    CTeOS: TspdCteOS;
    CTeOSDataSet: TspdCteOSDataSet;
    fUtils: TspdGovUtils;
    // guarda o tipo da configuração, pode ser via arquivo ini ou propriedades configuradas no componente.
    fTipoConfiguracao: TTipoConfiguracao;
    // guarda o nome do arquivo do XML Tomador Serviço para utilizá-lo posteriormente na impressão
    FXMLTomadorServicoFileName: string;
    // método para configurar o componente via o arquivo cteConfig.ini
    procedure ConfiguraViaArquivo;

  public
    // Carrega as configurações do arquivo .ini
    procedure LoadConfig;
    // Atualização do status na tela
    procedure UpdateStatus(aMsg: string; Clear: Boolean = true; ReplaceLast: Boolean = False);
    // Atualização de mensagens de texto no objeto mOutput(Memo)
    procedure UpdateOutput(aMessage: string);
    // Escreve configurações em um arquivo .ini
    procedure WriteToIni(aName, aValue: string);
    // Valida a presença do arquivo .ini
    procedure CheckConfig(ClearOutput: Boolean = true);
    //Retorna o caminho dos logs
    //procedure spdCTeOSLog(const aNome, aID, aFileName: string);
    //Retorna a chave do CT-e
    function GetValueChave(aXml : string) : string;
    // Retorna o XML Destinatário do CT-e
    function getXMLDestinatario : string;
    //retorna o fuso horário da máquina
    function GetTimeZone: string;
    function HorarioVeraoAtivo: Boolean;

  end;

var
  FrmExemplo: TFrmExemplo;


implementation

{$R *.dfm}

uses
  ShellApi, StrUtils,
  UCancelamentoCTeOS,
  UEventos;

// ******************************************************************************************************
//
// Funções utilitárias
//
// ******************************************************************************************************

// Inicialização do formulário
procedure TFrmExemplo.FormCreate(Sender: TObject);
begin
  CTeOS := TspdCTeOS.Create(nil);
  CTeOSDataSet := TspdCTeOSDataSet.Create(nil);
  fUtils := TspdGovUtils.Create(nil);

  FrmExemplo.Caption := 'Tecnospeed CTeOS - Versão: ' + CTeOS.Versao;
  CTeOS.ConfigurarSoftwareHouse(edtSH.Text,'');
  CTeOS.LoadConfig();
  pgCtrlMessages.ActivePageIndex := 0; // selecionar a página XML.
  FXMLTomadorServicoFileName := '';
  fTipoConfiguracao := tcViaIni;

  CTeOS.ListarCertificados(cbListaCertificados.Items);
  CTeOS.ValidarEsquemaAntesEnvio := True;
  //CTeOS.OnLog := spdCTeOSLog;

end;

// Destruição do formulário
procedure TFrmExemplo.FormDestroy(Sender: TObject);
begin
  CTeOS.Free;
  FUtils.Free;
end;

procedure TFrmExemplo.FormShow(Sender: TObject);
begin
  btnLoadConfigClick(nil);
end;

//Retorna a chave do CTeOS
function TFrmExemplo.GetValueChave(aXml: string): string;
Var
  aPINI, aPFIN: integer;
begin
  aPINI := PosStr('<infCte Id="CTe'  , aXml)+ 15;
  Result := Copy(aXml, aPINI, 44);
end;

// Retorna o XML Destinatário do CTeOS
function TFrmExemplo.getXMLDestinatario: string;
var
aXMLDestinatario : string;
begin
      aXMLDestinatario := CTeOS.DiretorioXmlTomadorServico + '\' + edtChave.Text + '-CTeOS.xml';
      if FileExists(aXMLDestinatario) then
      begin
        Result := fUtils.LoadFromFile(aXMLDestinatario);
      end
      else  if mOutput.Text <> '' then
      begin
        Result := mOutput.Text;
      end
      else
      begin
         raise Exception.Create('Informe a chave de um CT-e Autorizado ou preencha o memo com o valor do XML Destinatário');
      end;
end;

function TFrmExemplo.GetTimeZone: string;
var
  TimeZone: TTimeZoneInformation;
  Minutos: Integer;
begin
  GetTimeZoneInformation(TimeZone);
  Minutos := TimeZone.Bias;

//Se em TIME_ZONE_ID_DAYLIGHT indica que o horario de verão esta ativado na máquina
  if HorarioVeraoAtivo then
begin
//No caso do fusorario de brasilia -3:00 o TimeZone.Bias retorna 180, no caso de horário de verão deve ser 120(-02:00) entao desconto 60
  if (Minutos > 0) then
    Minutos := Minutos - 60
  else
    Minutos := Minutos + 60;
end;
  Result := FormatFloat('00', Minutos div -60) + ':00';
end;

function TFrmExemplo.HorarioVeraoAtivo: Boolean;
var
  TimeZoneInfo: TTimezoneinformation;
begin
  Result := GetTimezoneInformation(TimeZoneInfo) in [TIME_ZONE_ID_DAYLIGHT]
end;

// Atualização do status na tela
procedure TFrmExemplo.UpdateStatus(aMsg: string; Clear: Boolean = true; ReplaceLast: Boolean = False);
begin
  if Clear then
    mStatus.Clear;
  if ReplaceLast then
    mStatus.Lines[mStatus.Lines.Count - 1] := mStatus.Lines[mStatus.Lines.Count - 1] + aMsg
  else
    mStatus.Lines.Add(aMsg);
  mStatus.Refresh;
end;

// Atualização de mensagens de texto no objeto mOutput(Memo)
procedure TFrmExemplo.UpdateOutput(aMessage: string);
begin
  mOutput.Lines.Text := aMessage;
  mFmtOutput.Lines.Text := ReformatXml(aMessage);
end;

// Carrega as configurações do arquivo .ini
procedure TFrmExemplo.LoadConfig;
var
  aMessage: string;
begin
  UpdateStatus('', true);
  try
    CTeOS.LoadConfig;
  except
    on e: Exception do
      raise EspdCTeOSException.Create(e.Message);
  end;

  if CTeOS.Ambiente = akProducao then
    edtAmbiente.Text := '1 - Produção'
  else begin
    edtAmbiente.Text := '2 - Homologação'
  end;

  aMessage := '';
  edtUF.Text := CTeOS.UF;
  edtCNPJ.Text := CTeOS.CNPJ;
  cbListaCertificados.Text := CTeOS.NomeCertificado.Text;

  UpdateStatus('Configurações carregadas via arquivo ini.');
end;

// Escreve configurações em um arquivo .ini
procedure TFrmExemplo.WriteToIni(aName, aValue: string);
var
  IniFile: TIniFile;
  aCurrentDir: string;
begin
  aCurrentDir := ExtractFilePath(ParamStr(0));
  SetCurrentDir(aCurrentDir);
  IniFile := TIniFile.Create(aCurrentDir + INI_FILE);
  try
    IniFile.WriteString(INI_SECTION, aName, aValue);
  finally
    IniFile.Free;
  end;
end;

// Valida a presença do arquivo .ini
procedure TFrmExemplo.CheckConfig(ClearOutput: Boolean = true);
var
  bConfig : Boolean;
begin
  if ClearOutput then
  begin
    mOutput.Clear;
    mFmtOutput.Clear;
  end;

  Application.ProcessMessages;

  bConfig := True;

  if trim(CTeOS.UF) = '' then
    bConfig := False;
  if trim(CTeOS.CNPJ) = '' then
    bConfig := False;
  if trim(CTeOS.NomeCertificado.Text) = '' then
  begin
    if (Trim(CTeOS.CaminhoCertificado) = '')  or  (Trim(CTeOS.SenhaCertificado) = '') then
      bConfig := False;
  end;
  if (fTipoConfiguracao = tcViaIni) and (not bConfig) then
    raise Exception.Create('Favor configurar o componente antes de prosseguir (via ini ou via propriedades).');
end;

{//Retorna o caminho dos logs
 procedure TfrmExemplo.spdCTeOSLog(const aNome, aID, aFileName: string);
  begin
     if aNome = 'env-lot' then
         fArquivoPedidoEnvio := aFilename
     else if aNome = 'rec' then
         fArquivoRetornoEnvio := aFilename
     else if aNome = 'caneve-env' then
         fArquivoPedidoCancelamento := aFileName
     else if aNome = 'caneve-ret' then
         fArquivoRetornoCancelamento := aFilename
     else if aNome = 'ped-inu' then
         fArquivoPedidoInutilizacao := aFileName;
  end;
}

procedure TFrmExemplo.CTeGenerateXMLTomadorServico(const aFileName, aXML: String);
begin
  FXMLTomadorServicoFileName := aFileName;
end;

procedure TFrmExemplo.ConfiguraViaArquivo;
var
  _ExecuteFile: string;
  _NomeCertificado: string;
begin
  try
    if (cbListaCertificados.Text <> '') and (cbListaCertificados.Text <> 'Selecione o Certificado') then
    begin
      _NomeCertificado := Trim(cbListaCertificados.Text);
      WriteToIni('NomeCertificado', _NomeCertificado);
    end;
    _ExecuteFile := ExtractFilePath(ParamStr(0)) + 'cteOSConfig.ini';
    ShellExecute(Application.Handle, nil, Pchar(_ExecuteFile), nil, nil, SW_SHOWNORMAL);
  except
    raise EspdCTeOSException.Create('Erro ao tentar abrir o arquivo ' + INI_FILE +
      '. Verifique se o arquivo está na mesma pasta que o executável.');
  end;
end;

// ******************************************************************************************************
//
// Aqui começam as funções de exemplo do componente spdCTe
//
// ******************************************************************************************************


// 1.1 Configurar o CNPJ da Software House
procedure TFrmExemplo.btnConfiguraSHClick(Sender: TObject);
begin
  try
    edtSH.SetFocus;
    CTeOS.ConfigurarSoftwareHouse(edtSH.Text, '');
  except
    on e: Exception do
      raise EspdCTeOSException.Create(e.Message);
  end;
end;

// 1.2 Configurar Arquivo .ini
procedure TFrmExemplo.btnConfigIniClick(Sender: TObject);
begin
  (Sender as TWinControl).Enabled := False;
  try
    ConfiguraViaArquivo;
 finally
    (Sender as TWinControl).Enabled := True;
  end;
end;

// 2.Executando LoadConfig
procedure TFrmExemplo.btnLoadConfigClick(Sender: TObject);
begin
  LoadConfig;
end;

// 3.Verificar Status do Serviço
procedure TFrmExemplo.btnVerificarStatusClick(Sender: TObject);
var
  _returnValue: WideString;
begin
  CheckConfig(False);
  try
    (Sender as TWinControl).Enabled := False;
    try
      UpdateStatus('Verificando status...');
      _returnValue := CTeOS.StatusDoServico;
      UpdateOutput(_returnValue);
      UpdateStatus('Status do Serviço OK.');
    finally
      (Sender as TWinControl).Enabled := true;
    end;
  except
    UpdateStatus(' falha', False, true);
    raise ;
  end;
end;

// 4.1.Gerar XML via TX2
procedure TFrmExemplo.btnGerarXMLViaTx2Click(Sender: TObject);
var
  aChave: string;
  aXML: string;
begin
  CheckConfig(False);
  mOutput.Clear;
  mFmtOutput.Clear;

  (Sender as TWinControl).Enabled := False;
  try
    OpnDlgTx2.InitialDir := ExtractFileDir(Application.ExeName);
    //OpnDlgTx2.FileName := 'CTeOS.tx2';
    if OpnDlgTx2.Execute then
    begin
      aXML := CTeOS.GerarXMLporTX2(OpnDlgTx2.FileName);
      UpdateOutput(aXML);
      UpdateStatus('XML via Tx2 gerado com sucesso.');
      aChave := GetValueChave(aXML);
      edtChave.Text := aChave;
    end;
  finally
    (Sender as TWinControl).Enabled := True;
  end;
end;

procedure TFrmExemplo.btnInutClick(Sender: TObject);
var
  _returnValue, _NumIni, _NumFim, _AnoInut, _Serie, _Justificativa : string;
  _frmEventos: TfrmEventos;
begin

  CheckConfig;
  _frmEventos := TfrmEventos.Create(Self);
  _frmEventos.ShowModal;
  try
    if _frmEventos.ModalResult = mrOk then
    begin
      (Sender as TWinControl).Enabled := False;
      UpdateStatus('Eventos CTeOS...');
      try
        try
          _NumIni := _frmEventos.edtNumeroInicial.Text;
          _NumFim := _frmEventos.edtNumeroFinal.Text;
          _Serie := _frmEventos.edtSerieEventoInut.Text;
          _AnoInut := _frmEventos.edtAnoInut.Text;
          _Justificativa := _frmEventos.mmoJustInut.Text;

          begin
            _returnValue := CTeOS.InutilizarCTeOS(_AnoInut, CTeOS.CNPJ, '67', _Serie, _NumIni, _NumFim, _Justificativa);
          end;

          UpdateOutput(_returnValue);

          UpdateStatus('Cancelamento ok.');
        except
          UpdateStatus(' falha', False, true);
          raise ;
        end;
      finally
        (Sender as TWinControl).Enabled := true;
      end;
    end
    else

  finally
    _frmEventos.Free;
  end;
end;

// 4.2.Gerar XML via DataSet
procedure TFrmExemplo.btnGerarXMLViaDataSetClick(Sender: TObject);
var
  aChave: string;
  aData, aDataFull: string;
  aCodigoUF: string;
  aDV: string;
  aModelo: string;
  aSerie: string;
  aNumero: string;
  aCodigo: string;
  aTpEmis: string;
  aVersaoManual : string;
  aXML : string;
begin
  CheckConfig(False);
  mOutput.Clear;
  mFmtOutput.Clear;

  // Codigo UF
  aCodigoUF := IntToStr(CTeOS.ObterCodigoUF(CTeOS.UF));

  // Datas
  aData := FormatDateTime('yyyy-mm-dd', Now);
  aDataFull := FormatDateTime('yyyy-mm-dd"T"hh:mm:ss', Now);

  // Codigo
  case CTeOS.VersaoManual of
    vm300:
      aCodigo := '06021956';
  end;

  // Modelo
  aModelo := '67';

  // Serie
  aSerie := IntToStr(Random(80));

  //Tipo de emissão
  aTpEmis := '1';

  // Numero
  aNumero := InputBox('Número do CTe-OS', 'Informe o nº do CTe-OS', IntToStr(Random(100000)));

  // Calcula a Chave
  case CTeOS.VersaoManual of
    vm300:
      aChave := CTeOS.CalculaChave(aCodigoUF, aData, CTeOS.CNPJ, aModelo, aSerie, aNumero, aTpEmis, aCodigo);
  end;
  edtChave.Text := aChave;

  // Configura a versão de manual do CTeOS
  CTeOSDataSet.Versao := TspdCTeOSUtils.VersaoManualToStr(CTeOS.VersaoManual);

  //Alimentar as informações do lote
  CTeOSDataSet.ConfigSection := 'XMLENVIO';

  // Configura o arquivo de mapeamento para a criação dos datasets
  CTeOSDataSet.MappingFileName := fUtils.ExpandPath(CTeOS.DiretorioEsquemas + CTeOSDataSet.Versao)+ CTeOS.MappingFileName;

  // Cria a lista de datasets
  CTeOSDataSet.CreateDataSets();

  CTeOSDataSet.Incluir;

  CTeOSDataSet.Campo('versao_1').AsString := CTeOSDataSet.Versao;
  CTeOSDataSet.Campo('versao_3').AsString := CTeOSDataSet.Versao;
  CTeOSDataSet.Campo('cUF_6').AsString := aCodigoUF;
  CTeOSDataSet.Campo('cCT_7').AsString := aCodigo;
  CTeOSDataSet.Campo('CFOP_8').AsString := '5357';
  CTeOSDataSet.Campo('natOp_9').AsString := 'TRANSPORTE RODOVIARIO DE CARGAS';
  CTeOSDataSet.Campo('mod_10').AsString := aModelo;
  CTeOSDataSet.Campo('serie_11').AsString := aSerie;
  CTeOSDataSet.Campo('nCT_12').AsString := aNumero;
  CTeOSDataSet.Campo('dhEmi_13').AsString := aDataFull + GetTimeZone;
  CTeOSDataSet.Campo('tpImp_14').AsString := '1';
  CTeOSDataSet.Campo('tpEmis_15').AsString := aTpEmis;
  CTeOSDataSet.Campo('cDV_16').AsString := '1';
  CTeOSDataSet.Campo('tpAmb_17').AsString := '2';
  CTeOSDataSet.Campo('tpCTe_18').AsString := '0';
  CTeOSDataSet.Campo('procEmi_19').AsString := '0';
  CTeOSDataSet.Campo('verProc_20').AsString := '3.00';

  CTeOSDataSet.Campo('cMunEnv_21').AsString := '4209300';
  CTeOSDataSet.Campo('xMunEnv_22').AsString := 'LAGES';
  CTeOSDataSet.Campo('UFEnv_23').AsString := 'SC';

  // 01=Rodoviário; 02=Aéreo; 03=Aquaviário; 04=Ferroviário; 05=Dutoviário
  CTeOSDataSet.Campo('modal_24').AsString := '01';

  CTeOSDataSet.Campo('tpServ_25').AsString := '6';
  CTeOSDataSet.Campo('indIEToma_26').AsString := '1';
  CTeOSDataSet.Campo('cMunIni_27').AsString := '4209300';
  CTeOSDataSet.Campo('xMunIni_28').AsString := 'LAGES';
  CTeOSDataSet.Campo('UFIni_29').AsString := 'SC';
  CTeOSDataSet.Campo('cMunFim_30').AsString := '4209300';
  CTeOSDataSet.Campo('xMunFim_31').AsString := 'LAGES';
  CTeOSDataSet.Campo('UFFim_32').AsString := 'SC';
  CTeOSDataSet.Campo('dhCont_35').AsString := '';
  CTeOSDataSet.Campo('xJust_36').AsString := '';
  CTeOSDataSet.Campo('xCaracAd_38').AsString := '';
  CTeOSDataSet.Campo('xCaracSer_39').AsString := '';
  CTeOSDataSet.Campo('xEmi_40').AsString := '';
  CTeOSDataSet.Campo('xObs_41').AsString := '';
  CTeOSDataSet.Campo('CNPJ_49').AsString := CTeOS.CNPJ;
  CTeOSDataSet.Campo('IE_50').AsString := '251796620';
  CTeOSDataSet.Campo('IEST_51').AsString := '';
  CTeOSDataSet.Campo('xNome_52').AsString := 'NEVATUR TRANSPORTES E TURISMO LTDA';
  CTeOSDataSet.Campo('xFant_53').AsString := 'NEVATUR';
  CTeOSDataSet.Campo('xLgr_55').AsString := 'RUA ARISTIDES CASSAO';
  CTeOSDataSet.Campo('nro_56').AsString := '12';
  CTeOSDataSet.Campo('xCpl_57').AsString := '';
  CTeOSDataSet.Campo('xBairro_58').AsString := 'BALANCA';
  CTeOSDataSet.Campo('cMun_59').AsString := '4216503';
  CTeOSDataSet.Campo('xMun_60').AsString := 'SAO JOAQUIM';
  CTeOSDataSet.Campo('CEP_61').AsString := '88600000';
  CTeOSDataSet.Campo('UF_62').AsString := 'SC';
  CTeOSDataSet.Campo('fone_63').AsString := '';
  CTeOSDataSet.Campo('CNPJ_65').AsString := '75412601000100';
  CTeOSDataSet.Campo('CPF_66').AsString := '';
  CTeOSDataSet.Campo('IE_67').AsString := '250777983';
  CTeOSDataSet.Campo('xNome_68').AsString := 'CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
  CTeOSDataSet.Campo('xFant_69').AsString := 'CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
  CTeOSDataSet.Campo('fone_70').AsString := '';
  CTeOSDataSet.Campo('xLgr_72').AsString := 'RUA DUQUE DE CAXIAS  S/N';
  CTeOSDataSet.Campo('nro_73').AsString := '123';
  CTeOSDataSet.Campo('xCpl_74').AsString := 'Nenhum';
  CTeOSDataSet.Campo('xBairro_75').AsString := 'Centro';
  CTeOSDataSet.Campo('cMun_76').AsString := '4216503';
  CTeOSDataSet.Campo('xMun_77').AsString := 'SAO JOAQUIM';
  CTeOSDataSet.Campo('CEP_78').AsString := '88600000';
  CTeOSDataSet.Campo('UF_79').AsString := 'SC';
  CTeOSDataSet.Campo('cPais_80').AsString := '1058';
  CTeOSDataSet.Campo('xPais_81').AsString := 'BRASIL';
  CTeOSDataSet.Campo('email_82').AsString := '';
  CTeOSDataSet.Campo('vTPrest_84').AsString := '1';
  CTeOSDataSet.Campo('vRec_85').AsString := '1';
  CTeOSDataSet.Campo('CST_92').AsString := '00';
  CTeOSDataSet.Campo('vBC_93').AsString := '1';
  CTeOSDataSet.Campo('pICMS_94').AsString := '7';
  CTeOSDataSet.Campo('vICMS_95').AsString := '0.07';
  CTeOSDataSet.Campo('CST_97').AsString := '';
  CTeOSDataSet.Campo('CST_99').AsString := '';
  CTeOSDataSet.Campo('pRedBC_100').AsString := '';
  CTeOSDataSet.Campo('vBC_101').AsString := '';
  CTeOSDataSet.Campo('pICMS_102').AsString := '';
  CTeOSDataSet.Campo('vICMS_103').AsString := '';
  CTeOSDataSet.Campo('vCred_104').AsString := '';
  CTeOSDataSet.Campo('CST_106').AsString := '';
  CTeOSDataSet.Campo('pRedBCOutraUF_107').AsString := '';
  CTeOSDataSet.Campo('vBCOutraUF_108').AsString := '';
  CTeOSDataSet.Campo('pICMSOutraUF_109').AsString := '';
  CTeOSDataSet.Campo('vICMSOutraUF_110').AsString := '';
  CTeOSDataSet.Campo('CST_112').AsString := '';
  CTeOSDataSet.Campo('indSN_113').AsString := '';
  CTeOSDataSet.Campo('vTotTrib_114').AsString := '';
  CTeOSDataSet.Campo('infAdFisco_115').AsString := '';
  CTeOSDataSet.Campo('vBCUFFim_117').AsString := '';
  CTeOSDataSet.Campo('pFCPUFFim_118').AsString := '';
  CTeOSDataSet.Campo('pICMSUFFim_119').AsString := '';
  CTeOSDataSet.Campo('pICMSInter_120').AsString := '';
  CTeOSDataSet.Campo('pICMSInterPart_121').AsString := '';
  CTeOSDataSet.Campo('vFCPUFFim_122').AsString := '';
  CTeOSDataSet.Campo('vICMSUFFim_123').AsString := '';
  CTeOSDataSet.Campo('vICMSUFIni_124').AsString := '';
  CTeOSDataSet.Campo('vPIS_126').AsString := '';
  CTeOSDataSet.Campo('vCOFINS_127').AsString := '';
  CTeOSDataSet.Campo('vIR_128').AsString := '';
  CTeOSDataSet.Campo('vINSS_129').AsString := '0.10';
  CTeOSDataSet.Campo('vCSLL_130').AsString := '';
  CTeOSDataSet.Campo('xDescServ_133').AsString := 'Tranporte de Passageiros';
  CTeOSDataSet.Campo('qCarga_135').AsString := '30';
  CTeOSDataSet.Campo('versaoModal_147').AsString := '3.00';
  CTeOSDataSet.Campo('chCte_150').AsString := '';
  CTeOSDataSet.Campo('refCteAnu_151').AsString := '';
  CTeOSDataSet.Campo('refNFe_153').AsString := '';
  CTeOSDataSet.Campo('CNPJ_155').AsString := '';
  CTeOSDataSet.Campo('CPF_156').AsString := '';
  CTeOSDataSet.Campo('mod_157').AsString := '';
  CTeOSDataSet.Campo('serie_158').AsString := '';
  CTeOSDataSet.Campo('subserie_159').AsString := '';
  CTeOSDataSet.Campo('nro_160').AsString := '';
  CTeOSDataSet.Campo('valor_161').AsString := '';
  CTeOSDataSet.Campo('dEmi_162').AsString := '';
  CTeOSDataSet.Campo('refCte_163').AsString := '';
  CTeOSDataSet.Campo('chCTe_165').AsString := '';
  CTeOSDataSet.Campo('chCte_167').AsString := '';
  CTeOSDataSet.Campo('dEmi_168').AsString := '';

  CTeOSDataSet.IncluirParte('infPercurso');
  CTeOSDataSet.Campo('UFPer_34').AsString := '';
  CTeOSDataSet.SalvarParte('infPercurso');

  CTeOSDataSet.IncluirParte('ObsCont');
  CTeOSDataSet.Campo('xTexto_44').AsString := '';
  CTeOSDataSet.Campo('xCampo_43').AsString := '';
  CTeOSDataSet.SalvarParte('ObsCont');

  CTeOSDataSet.IncluirParte('ObsFisco');
  CTeOSDataSet.Campo('xTexto_47').AsString := '';
  CTeOSDataSet.Campo('xCampo_46').AsString := '';
  CTeOSDataSet.SalvarParte('ObsFisco');

  CTeOSDataSet.IncluirParte('Comp');
  CTeOSDataSet.Campo('xNome_87').AsString := '';
  CTeOSDataSet.Campo('vComp_88').AsString := '';
  CTeOSDataSet.SalvarParte('Comp');

  CTeOSDataSet.IncluirParte('infDocRef');
  CTeOSDataSet.Campo('nDoc_137').AsString := '';
  CTeOSDataSet.Campo('serie_138').AsString := '';
  CTeOSDataSet.Campo('subserie_139').AsString := '';
  CTeOSDataSet.Campo('dEmi_140').AsString := '';
  CTeOSDataSet.Campo('vDoc_141').AsString := '';
  CTeOSDataSet.SalvarParte('infDocRef');

  CTeOSDataSet.IncluirParte('seg');
  CTeOSDataSet.Campo('respSeg_143').AsString := '';
  CTeOSDataSet.Campo('xSeg_144').AsString := '';
  CTeOSDataSet.Campo('nApol_145').AsString := '';
  CTeOSDataSet.SalvarParte('seg');

  CTeOSDataSet.IncluirParte('autXML');
  CTeOSDataSet.Campo('CNPJ_170').AsString := '';
  CTeOSDataSet.Campo('CPF_171').AsString := '';
  CTeOSDataSet.SalvarParte('autXML');

  // Modal Rodoviário
  CTeOSDataSet.IncluirParte('Rodoos');
  CTeOSDataSet.Campo('TAF_2').AsString := '';
  CTeOSDataSet.Campo('NroRegEstadual_3').AsString := '0000000000000000000001899';
  CTeOSDataSet.Campo('placa_5').AsString := 'QIZ3462';
  CTeOSDataSet.Campo('RENAVAM_6').AsString := '1116620984';
  CTeOSDataSet.Campo('CPF_8').AsString := '';
  CTeOSDataSet.Campo('CNPJ_9').AsString := '';
  CTeOSDataSet.Campo('TAF_10').AsString := '';
  CTeOSDataSet.Campo('NroRegEstadual_11').AsString := '';
  CTeOSDataSet.Campo('xNome_12').AsString := '';
  CTeOSDataSet.Campo('IE_13').AsString := '';
  CTeOSDataSet.Campo('UF_14').AsString := '';
  CTeOSDataSet.Campo('tpProp_15').AsString := '';
  CTeOSDataSet.Campo('UF_16').AsString := 'SC';
  CTeOSDataSet.SalvarParte('Rodoos');
  CTeOSDataSet.Salvar;

  (Sender as TWinControl).Enabled := False;

  try
    CheckConfig(False);
    mOutput.Clear;
    mFmtOutput.Clear;

    aXML := CTeOSDataSet.GetCteOSXML;

    UpdateOutput(aXML);
    UpdateStatus('XML via DataSets gerado com sucesso.');

  finally
    (Sender as TWinControl).Enabled := True;
  end;

end;

// 5.1. Assinar CTeOS
procedure TFrmExemplo.btnAssinarClick(Sender: TObject);
var
  _returnValue: string;
begin
  _returnValue := mOutput.Text;
  _returnValue := CTeOS.AssinarCTeOS(_returnValue);
  UpdateOutput(_returnValue);
  UpdateStatus('CTeOS Assinado.');
end;

// 5.2. Preve Dacte
procedure TFrmExemplo.btnPreverDacteClick(Sender: TObject);
var
  _xml : WideString;
begin
  if (GetValueTag('enviCTe', mOutput.Lines.Text) <> '') or
    (GetValueTag('infCte', mOutput.Lines.Text) <> '') then
  begin
    CheckConfig(false);
    CTeOS.PreverDACTE( mOutput.Lines.Text );
  end
  else
  begin
    if MessageDlg('Deseja informar um XML de Tomador?',
      mtConfirmation, [mbYes,mbCancel], 0) = mrYes then
    begin
      opnDlgXML.InitialDir := CTeOS.DiretorioXmlTomadorServico;
      if opnDlgXML.Execute then
      begin
        _xml := fUtils.LoadFromFile(opnDlgXML.FileName);
        CTeOS.PreverDACTE( _xml );
      end;
    end;
  end;
end;

// 6.Enviar CTe
procedure TFrmExemplo.btnEnviarCTeOSClick(Sender: TObject);
var
  _returnValue: string;
  envio : string;
  retorno : string;
begin
  CheckConfig(False);
  FXMLTomadorServicoFileName := '';
  try
    (Sender as TWinControl).Enabled := False;
    try
        UpdateStatus('Enviando CTeOS...');
        _returnValue := mOutput.Text;
        _returnValue := CTeOS.EnviarCteOS(_returnValue);
        UpdateOutput(_returnValue);
        edtProtocolo.Text := CTeOS.ExtrairProtocolo(_returnValue);
        UpdateStatus('Envio Ok.');
    finally
      (Sender as TWinControl).Enabled := true;
    end;
  except
    UpdateStatus(' falha', False, true);
    raise ;
  end;
  //envio := CTeOS.UltimoLogEnvio;
  //retorno := CTeOS.UltimoLogRetorno;
end;

// 7.Consultar CTe
procedure TFrmExemplo.btnConsultarCTeOSClick(Sender: TObject);
var
  _returnValue: string;
begin
  CheckConfig;
  try
    (Sender as TWinControl).Enabled := False;
    try
      if edtChave.Text <> '' then
      begin
        UpdateStatus('Consultando...');
        _returnValue := CTeOS.ConsultarCTeOS(edtChave.Text);
        edtProtocolo.Text := CTeOS.ExtrairProtocolo(_returnValue);
        UpdateOutput(_returnValue);
        UpdateStatus('Consulta ok...');
      end
      else
      begin
        ShowMessage('Favor informar uma chave antes de prosseguir');
        edtChave.SetFocus;
      end;
    finally
      (Sender as TWinControl).Enabled := true;
    end;
  except
    UpdateStatus(' falha', False, true);
    raise ;
  end;
end;

// 8.Cancelar CTe
procedure TFrmExemplo.btnCancelarCTeOSClick(Sender: TObject);
var
  _returnValue, _Chave, _Protocolo, _Justificativa, _DataHora: string;
  _frmCancelamentoCTeOS: TfrmCancelamentoCTeOS;
begin

  CheckConfig;
  _frmCancelamentoCTeOS := TfrmCancelamentoCTeOS.Create(Self);
  _frmCancelamentoCTeOS.edtChave.Text := edtChave.Text;
  _frmCancelamentoCTeOS.edtProtocolo.Text := edtProtocolo.Text;
  _frmCancelamentoCTeOS.ShowModal;
  try
    if _frmCancelamentoCTeOS.ModalResult = mrOk then
    begin
      (Sender as TWinControl).Enabled := False;
      UpdateStatus('Cancelando CTeOS...');
      try
        try
          _Chave := _frmCancelamentoCTeOS.edtChave.Text;
          _Protocolo := _frmCancelamentoCTeOS.edtProtocolo.Text;
          _Justificativa := _frmCancelamentoCTeOS.mJustificativa.Text;

          begin
            _DataHora := InputBox('Data e Hora do Evento', 'Digite a Data e Hora do Evento: ', FormatDateTime('YYYY-MM-DD"T"HH:MM:SS',Now) + GetTimeZone);
            _returnValue := CTeOS.CancelarCteOSEvento(_Chave, _Protocolo, _Justificativa, _DataHora, '1');
          end;

          UpdateOutput(_returnValue);

          UpdateStatus('Cancelamento ok.');
        except
          UpdateStatus(' falha', False, true);
          raise ;
        end;
      finally
        (Sender as TWinControl).Enabled := true;
      end;
    end
    else

  finally
    _frmCancelamentoCTeOS.Free;
  end;
end;

// 9.Visualizar
procedure TFrmExemplo.btnVisualizarClick(Sender: TObject);
var
  _XML, aXMLDestinatario: WideString;
begin
  try
    CheckConfig(false);
    _XML := getXMLDestinatario;
    CTeOS.VisualizarDACTE(_XML);
  except
    on e: Exception do
      raise EspdCTeOSException.Create(e.Message);
  end;
end;

// 10.Exportar para PDF
procedure TFrmExemplo.btnExportarPDFClick(Sender: TObject);
var
  _XML: String;
begin
    CheckConfig(false);
      if edtChave.Text <> '' then
        svDlgExportar.FileName := edtChave.Text + '.pdf';
      if svDlgExportar.Execute then
      begin
        _XML := getXMLDestinatario;
        CTeOS.ExportarDACTEParaPDF(_XML, '', svDlgExportar.FileName);
        UpdateStatus('Geração de PDF realizada com sucesso!');
      end;
end;

procedure TFrmExemplo.btnValidarLoteEnvioClick(Sender: TObject);
var
  _returnValue: string;
begin
  _returnValue := mOutput.Text;
  _returnValue := CTeOS.ValidarLoteParaEnvio('1', _returnValue);
  UpdateOutput(_returnValue);
  UpdateStatus('Lote Validado.');
end;

initialization

try
  Application.Icon.LoadFromFile('CTeOS.ico');
except

end;

finalization

end.
