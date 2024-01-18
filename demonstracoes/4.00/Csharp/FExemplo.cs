using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.IO;
using System.Xml;
using System.Text.RegularExpressions;

namespace ExemploCTeOS
{
    public partial class FrmExemplo : Form
    {
        //******************************************************************************************************
        //
        //          Importação de funções externas
        //
        //******************************************************************************************************        

        //Carga de Dlls
        [DllImport("kernel32.dll", EntryPoint = "GetPrivateProfileString")]
        private static extern int GetPrivateProfileString(string lpAppName, string lpKeyName, string lpDefault, StringBuilder lpReturnedString, int nSize, string lpFileName);
        [DllImport("kernel32.dll", EntryPoint = "WritePrivateProfileString")]
        private static extern bool WritePrivateProfileString(string lpAppName, string lpKeyName, string lpString, string lpFileName);

        //******************************************************************************************************
        //
        //          Declaração de variáveis
        //
        //******************************************************************************************************     

        //Declaração de variáveis do componente spdCTeOSX
        CTeOSX.spdCTeOSX CTeOS;
        CTeOSDataSetX.spdCTeOSDataSetX CTeOSDataSet;

        //Caminho para o arquivo de configuração
        //Arquivo INI a ser manipulado com parametrizações
        string ArqIni = Application.StartupPath + "C:\\Users\\tecnospeed\\Documents\\Demos\\ATUALIZAÇÃO\\Componente-CTeOS-master\\demonstracoes\\c#\\Tecnospeed CTeOS\\bin\\Debug\\cteOSConfig.ini";
        string CertificadoSelecionado;


        //******************************************************************************************************
        //
        //          Funções utilitárias
        //
        //******************************************************************************************************

        // Configura CTeOSDataSet
        private void ConfiguraCteOSDataSet()
        {
            string _VersaoManual = "4.00";
            CTeOSDataSet.Versao = _VersaoManual;
            CTeOSDataSet.ConfigSection = "XMLENVIO";
            CTeOSDataSet.MappingFileName = CTeOS.DiretorioEsquemas + _VersaoManual + "\\" + CTeOS.MappingFileName;
            CTeOSDataSet.CreateDataSets();
        }
        // Preenche os Dados do CTeOS do DataSet
        private void DadosdoCTeOS()
        {
            CTeOSDataSet.SetCampo("cUF_6", "42");
            CTeOSDataSet.SetCampo("cCT_7", "06021956");
            CTeOSDataSet.SetCampo("CFOP_8", "5352");
            CTeOSDataSet.SetCampo("natOp_9", "Aquisicao");
            CTeOSDataSet.SetCampo("mod_10", "67");
            CTeOSDataSet.SetCampo("serie_11", "2");
            CTeOSDataSet.SetCampo("nCT_12", "485");
            CTeOSDataSet.SetCampo("dhEmi_13", "2019-02-25T15:40:00-03:00");
            CTeOSDataSet.SetCampo("tpImp_14", "1");
            CTeOSDataSet.SetCampo("tpEmis_15", "1");
            CTeOSDataSet.SetCampo("cDV_16", "8");
            CTeOSDataSet.SetCampo("tpAmb_17", "2");
            CTeOSDataSet.SetCampo("tpCTe_18", "0");
            CTeOSDataSet.SetCampo("procEmi_19", "0");
            CTeOSDataSet.SetCampo("verProc_20", "3.00");
            CTeOSDataSet.SetCampo("cMunEnv_21", "4105805");
            CTeOSDataSet.SetCampo("xMunEnv_22", "COLOMBO");
            CTeOSDataSet.SetCampo("UFEnv_23", "PR");
            CTeOSDataSet.SetCampo("modal_24", "01");
            CTeOSDataSet.SetCampo("tpServ_25", "7");
            CTeOSDataSet.SetCampo("indIEToma_26", "1");
            CTeOSDataSet.SetCampo("cMunIni_27", "4105805");
            CTeOSDataSet.SetCampo("xMunIni_28", "COLOMBO");
            CTeOSDataSet.SetCampo("UFIni_29", "PR");
            CTeOSDataSet.SetCampo("cMunFim_30", "4105805");
            CTeOSDataSet.SetCampo("xMunFim_31", "COLOMBO");
            CTeOSDataSet.SetCampo("UFFim_32", "PR");

            CTeOSDataSet.SetCampo("xDescServ_133", "Tranporte de Passageiros");
            CTeOSDataSet.SetCampo("qCarga_135", "30");
        }

        // Preenche os Dados do Tomador do DataSet
        private void DadosTomador()
        {
            CTeOSDataSet.SetCampo("CNPJ_65", "11111111111111");
            CTeOSDataSet.SetCampo("IE_67", "1111111111");
            CTeOSDataSet.SetCampo("xNome_68", "Fulano");
            CTeOSDataSet.SetCampo("xFant_69", "Fantasia Fulano");
            CTeOSDataSet.SetCampo("xLgr_72", "Rua dos Programadores");
            CTeOSDataSet.SetCampo("nro_73", "123");
            CTeOSDataSet.SetCampo("xCpl_74", "Nenhum");
            CTeOSDataSet.SetCampo("xBairro_75", "Centro");
            CTeOSDataSet.SetCampo("cMun_76", "4105805");
            CTeOSDataSet.SetCampo("xMun_77", "COLOMBO");
            CTeOSDataSet.SetCampo("CEP_78", "89233198");
            CTeOSDataSet.SetCampo("UF_79", "PR");
            CTeOSDataSet.SetCampo("cPais_80", "1058");
            CTeOSDataSet.SetCampo("xPais_81", "BRASIL");
            CTeOSDataSet.SetCampo("email_82", "email@teste.com");
        }

        // Preenche os Dados do Emitente do DataSet
        private void DadosEmitente()
        {
            CTeOSDataSet.SetCampo("CNPJ_49", "22222222222222");
            CTeOSDataSet.SetCampo("IE_50", "222222222");
            CTeOSDataSet.SetCampo("xNome_52", "Emitente Teste");
            CTeOSDataSet.SetCampo("xFant_53", "Emitente");

            CTeOSDataSet.SetCampo("xLgr_55", "RUA ARISTIDES CASSAO");
            CTeOSDataSet.SetCampo("nro_56", "12");
            CTeOSDataSet.SetCampo("xBairro_58", "BALANCA");
            CTeOSDataSet.SetCampo("cMun_59", "4216503");
            CTeOSDataSet.SetCampo("xMun_60", "SAO JOAQUIM");
            CTeOSDataSet.SetCampo("CEP_61", "88600000");
            CTeOSDataSet.SetCampo("UF_62", "SC");


            if (CTeOSDataSet.CampoExiste("fone_63"))
            {

                CTeOSDataSet.SetCampo("fone_63", "18988222777");

            }
            else
            {

                CTeOSDataSet.SetCampo("fone_63", "");
               

            }

            CTeOSDataSet.SetCampo("CRT_1573", "1");
        }

        // Preenche os Dados da Pretacao de Servico do DataSet
        private void PrestacaodeServico()
        {
            CTeOSDataSet.SetCampo("vTPrest_84", "1");
            CTeOSDataSet.SetCampo("vRec_85", "1");
        }

        // Preenche os Dados dos impostos do DataSet
        private void DadosImpostos()
        {
            CTeOSDataSet.SetCampo("CST_92", "00");
            CTeOSDataSet.SetCampo("vBC_93", "1");
            CTeOSDataSet.SetCampo("pICMS_94", "7");
            CTeOSDataSet.SetCampo("vICMS_95", "0.07");
            CTeOSDataSet.SetCampo("vINSS_129", "0.10");
        }

        // Preenche os Dados da Versao Modal do DataSet
        private void VersaoModal()
        {
            CTeOSDataSet.SetCampo("versaoModal_147", "3.00");
            CTeOSDataSet.SetCampo("versao_3", "4.00");
            CTeOSDataSet.SetCampo("versao_1", "4.00");
        }

        // Preenche os Dados do Modal Rodoviario do DataSet
        private void ModalRodoviario()
        {
            CTeOSDataSet.IncluirParte("Rodoos");
            CTeOSDataSet.SetCampo("TAF_2", "000000001232");
            CTeOSDataSet.SetCampo("placa_5", "AAA1234");
            CTeOSDataSet.SetCampo("UF_16", "PR");
            CTeOSDataSet.SalvarParte("Rodoos");
        }

        // Templaate de Aviso
        private void Aviso(string aMensagem)
        {
            MessageBox.Show(aMensagem, "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        //Atualiza o valor de retorno de um método na tela
        private void AtualizaRetornoNaTela(string Valor)
        {
            mmXML.Text = Valor;
            mmXMLFormatado.Text = CTeOS.ReformatXML(Valor);
        }

        //Atualiza o status na tela
        private void AtualizaStatusNaTela(string Valor)
        {
            lblStatus.Text = Valor;
        }

        // Tratamento de Exceptions
        private void TratarExcecao(Exception ex)
        {
            MessageBox.Show(ex.Message, "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        //Grava valor no arquivo .ini
        public static bool WriteIniValue(string section, string key, string value, string filename)
        {
            return WritePrivateProfileString(section, key, value, filename);
        }
        //Lê valor do arquivo .ini
        public static string GetIniValue(string section, string key, string filename)
        {
            int chars = 256;
            StringBuilder buffer = new StringBuilder(chars);
            string sDefault = "";
            if (GetPrivateProfileString(section, key, sDefault,
              buffer, chars, filename) != 0)
            {
                return buffer.ToString();
            }
            else
            {
                return null;
            }
        }

        // Verifica se o componente está configurado
        private void CheckConfig(bool ClearOutput = true)
        {
            bool bConfig;
            if (ClearOutput)
            {
                mmXML.Clear();
                mmXMLFormatado.Clear();
            }

            bConfig = true;

            if (CTeOS.UF == null)
            {
                bConfig = false;
            }
            if (CTeOS.CNPJ == null)
            {
                bConfig = false;
            }
            if (CTeOS.NomeCertificado == null)
            {
                if (CTeOS.CaminhoCertificado == null || CTeOS.SenhaCertificado == null)
                {
                    bConfig = false;
                }
            }
            if (!bConfig)
            {
                throw new Exception("Favor configurar o componente antes de prosseguir (via ini ou via propriedades).");
            }
        }

        //Obter o valor de um arquivo
        private static string LoadFromFile(string diretorio)
        {
            try
            {
                using (StreamReader sr = new StreamReader(diretorio))
                {
                    String XMLDestinatario = sr.ReadToEnd();
                    return XMLDestinatario;
                }
            }
            catch (IOException e)
            {
                throw new Exception(e.Message);
            }
        }

        //Obter o XML Destinatário do CTeOS
        public static string GetXMLDestinatario(string diretorio, string chave, string xml)
        {
            string PathXMLDestinatario = diretorio + "\\" + chave + "-cteos.xml";
            if (File.Exists(PathXMLDestinatario))
            {
                return LoadFromFile(PathXMLDestinatario);
            }
            else if (xml != "")
            {
                return xml;
            }
            else
            {
                throw new Exception("Informe a chave de um CTeOS Autorizado ou preencha o memo com o valor do XML Destinatário");
            }
        }

        //Inicialização
        public FrmExemplo()
        {
            InitializeComponent();
            //Instancia o Objeto responsável pelaT interação com servidores da Receita
            CTeOS = new CTeOSX.spdCTeOSX();
            CTeOSDataSet = new CTeOSDataSetX.spdCTeOSDataSetX();

            //Utiliza Método do Componente para Listar Certificados instalado no SO            
            string Certificados;
            string[] vetor;

            Certificados = CTeOS.ListarCertificados();
            vetor = Certificados.Split('|');

            cbCertificados.Items.Clear();

            foreach (string _cert in vetor)
            {
                cbCertificados.Items.Add(_cert);
            }

        }

        // 1.1 Configurar o CNPJ da Software House
        private void BtnConfiguraSH_Click(object sender, EventArgs e)
        {
            CTeOS.ConfigurarSoftwareHouse("CNPJ_SH", "TOKEN_SH"); // TOKEN OBTIDO NO https://conta.tecnospeed.com.br/
        }

        // 1.2 Configurar Arquivo .ini
        private void BtnConfiguraIni_Click(object sender, EventArgs e)
        {
            if (cbCertificados.SelectedIndex != -1)
            {
                CertificadoSelecionado = cbCertificados.Items[cbCertificados.SelectedIndex].ToString();
                CTeOS.NomeCertificado = CertificadoSelecionado;

                //Grava o nome do certificado selecionado no arquivo .ini
                WriteIniValue("CTeOS", "NomeCertificado", CertificadoSelecionado, ArqIni);
                System.Diagnostics.Process.Start(ArqIni);
            }
            else
            {
                Aviso("Favor selecionar um certificado");
            }
        }

        // 2.Executando LoadConfig
        private void BtnLoadConfig_Click(object sender, EventArgs e)
        {
            try
            {
                CTeOS.LoadConfig(ArqIni);
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("LoadConfig CTeOS: Erro");
                TratarExcecao(ex);
            }
            edtUF.Text = CTeOS.UF;
            edtCNPJEmit.Text = CTeOS.CNPJ;
            cbCertificados.Text = CTeOS.NomeCertificado;
            AtualizaStatusNaTela("Configurações carregadas via arquivo ini.");
        }

        // 3.Verificar Status do Serviço
        private void BtnStatus_Click(object sender, EventArgs e)
        {
            CheckConfig(false);
            try
            {
                string _ValorDeRetorno = CTeOS.StatusdoServico();

                AtualizaRetornoNaTela(_ValorDeRetorno);

                AtualizaStatusNaTela("Status do Serviço: OK");
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Status do Serviço: Erro");
                TratarExcecao(ex);
            }

        }

        // 4.1.Gerar XML via TX2
        private void BtnTx2_Click(object sender, EventArgs e)
        {
            CheckConfig();
            try
            {
                OpenFileDialog openFileDialog1 = new OpenFileDialog();
                openFileDialog1.Filter = "Tx2 files (*.tx2)|*.tx2";
                openFileDialog1.InitialDirectory = Application.StartupPath;
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    ConfiguraCteOSDataSet();
                    CTeOSDataSet.LoadFromTX2(openFileDialog1.FileName);
                    string _ValorDeRetorno = CTeOSDataSet.GetCteOSXML();
                    AtualizaRetornoNaTela(_ValorDeRetorno);
                    edtChave.Text = CTeOSDataSet.GetCampo("Id_4").Substring(3, 44);
                    AtualizaStatusNaTela("Gerar XML por TX2: OK");
                }
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Gerar XML por TX2: Erro");
                TratarExcecao(ex);
            }
        }

        // 4.2.Gerar XML via DataSet
        private void BtnDataSet_Click(object sender, EventArgs e)
        {
            CheckConfig();
            ConfiguraCteOSDataSet();
            CTeOSDataSet.Incluir();
            DadosdoCTeOS();
            DadosTomador();
            DadosEmitente();
            PrestacaodeServico();
            DadosImpostos();
            VersaoModal();
            ModalRodoviario();
            CTeOSDataSet.Salvar();
            string _XML = CTeOSDataSet.GetCteOSXML();
            edtChave.Text = CTeOSDataSet.GetCampo("Id_4").Substring(3, 44);
            AtualizaRetornoNaTela(_XML);
            AtualizaStatusNaTela("XML via DataSets gerado com sucesso.");
        }

        // 5.1. Assinar CTeOS
        private void BtnAssinar_Click(object sender, EventArgs e)
        {
            string _XML = CTeOS.AssinarCTeOS(CTeOS.CompressXML(mmXML.Text));
            AtualizaRetornoNaTela(_XML);
            AtualizaStatusNaTela("Assinar CTeOS: OK");
        }

        // 5.2. Preve DacteOS
        private void BtnPreverDacte_Click(object sender, EventArgs e)
        {
            CheckConfig(false);
            try
            {
                string _XML = mmXML.Text;
                if (_XML.Trim() != "")
                {
                    CTeOS.PreverDACTE(_XML, "");
                }
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Prever DacteOS: Erro");
                TratarExcecao(ex);
            }
        }

        // 6.Enviar CTeOS
        private void BtnEnviarCTe_Click(object sender, EventArgs e)
        {
            CheckConfig(false);
            try
            {

                string _XMLDeEnvio;
                string _ValorDeRetorno;

                _XMLDeEnvio = CTeOS.CompressXML(mmXML.Text);
                _XMLDeEnvio = CTeOS.AssinarCTeOS(ref _XMLDeEnvio);
                _ValorDeRetorno = CTeOS.EnviarCTeOS(_XMLDeEnvio);

                edtProtocolo.Text = CTeOS.ExtrairProtocolo(_ValorDeRetorno);

                AtualizaRetornoNaTela(_ValorDeRetorno);

                AtualizaStatusNaTela("Enviar CTeOS: OK");
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Enviar CTeOS: Erro");
                TratarExcecao(ex);
            }
        }

        // 8.Consultar CTeOS
        private void btnConsultaCTeOS_Click(object sender, EventArgs e)
        {
            CheckConfig();
            try
            {
                if (edtChave.Text != "")
                {
                    string _ValorDeRetorno = CTeOS.ConsultarCTeOS(edtChave.Text);
                    edtProtocolo.Text = CTeOS.ExtrairProtocolo(_ValorDeRetorno);
                    AtualizaRetornoNaTela(_ValorDeRetorno);

                    AtualizaStatusNaTela("Consultar CTeOS: OK");
                }
                else
                {
                    Aviso("Favor informar uma chave antes de prosseguir");
                }
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Consultar CTeOS: Erro");
                TratarExcecao(ex);
            }
        }

        // 9.Cancelar CTeOS
        private void BtnCancelar_Click(object sender, EventArgs e)
        {
            CheckConfig();
            try
            {
                WindowsFormsApp3.FCancelaCTeOS frmCancela = new WindowsFormsApp3.FCancelaCTeOS();
                DialogResult Result;

                frmCancela.edtChave.Text = edtChave.Text;
                frmCancela.edtNumeroProtocolo.Text = edtProtocolo.Text;
                string _Data = String.Format("{0:yyyy-MM-dd'T'HH:mm:sszzz}", DateTime.Now);

                Result = frmCancela.ShowDialog();

                if (Result == DialogResult.OK)
                {

                    string _ValorDeRetorno = CTeOS.CancelarCTeOSEvento(frmCancela.edtChave.Text,
                                         frmCancela.edtNumeroProtocolo.Text,
                                         frmCancela.mmJustificativa.Text,
                                         _Data,
                                         "1");

                    AtualizaRetornoNaTela(_ValorDeRetorno);

                    AtualizaStatusNaTela("Cancelar CTeOS: OK");
                }
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Cancelar CTeOS: Erro");
                TratarExcecao(ex);
            }
        }

        // 10.Visualizar
        private void BtnVisualizar_Click(object sender, EventArgs e)
        {
            CheckConfig(false);
            try
            {
                string XML = GetXMLDestinatario(CTeOS.DiretorioXMLTomadorServico, edtChave.Text, mmXML.Text);
                CTeOS.VisualizarDACTE(XML, "");
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Visualizar: Erro");
                TratarExcecao(ex);
            }
        }

        // 11.Exportar para PDF
        private void BtnExporta_Click(object sender, EventArgs e)
        {
            CheckConfig(false);
            try
            {
                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    string XML = GetXMLDestinatario(CTeOS.DiretorioXMLTomadorServico, edtChave.Text, mmXML.Text);
                    CTeOS.ExportarDACTEParaPDF(XML, "", saveFileDialog1.FileName);
                }
            }
            catch (Exception ex)
            {
                AtualizaStatusNaTela("Exportar para PDF: Erro");
                TratarExcecao(ex);
            }
        }
    }
}
