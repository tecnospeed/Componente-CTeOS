VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FrmExemplo 
   Caption         =   "ExemploCTeOS"
   ClientHeight    =   9000
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8355
   LinkTopic       =   "Form1"
   ScaleHeight     =   9000
   ScaleWidth      =   8355
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   7800
      Top             =   8520
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox mmXML 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   4335
      HideSelection   =   0   'False
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   33
      Top             =   4080
      Width           =   8415
   End
   Begin VB.Frame gbOperacoes 
      Caption         =   "Operações"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4095
      Left            =   2640
      TabIndex        =   1
      Top             =   0
      Width           =   5775
      Begin VB.Frame gbImpressao 
         Caption         =   "Impressão do Dacte"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1335
         Left            =   2880
         TabIndex        =   27
         Top             =   2040
         Width           =   2655
         Begin VB.CommandButton btnExporta 
            Caption         =   "10. Exportar para PDF"
            Height          =   315
            Left            =   120
            TabIndex        =   29
            Top             =   720
            Width           =   2415
         End
         Begin VB.CommandButton btnVisualizar 
            Caption         =   "9. Visualizar"
            Height          =   315
            Left            =   120
            TabIndex        =   28
            Top             =   360
            Width           =   2415
         End
      End
      Begin VB.CommandButton btnCancelar 
         Caption         =   "8. Cancelar CTeOS"
         Height          =   315
         Left            =   2880
         TabIndex        =   26
         Top             =   1560
         Width           =   2655
      End
      Begin VB.CommandButton btnConsultaCTeOS 
         Caption         =   "7. Consultar CTeOS"
         Height          =   315
         Left            =   2880
         TabIndex        =   25
         Top             =   1200
         Width           =   2655
      End
      Begin VB.CommandButton btnEnviarCTeOS 
         Caption         =   "6. Enviar CTeOS"
         Height          =   315
         Left            =   2880
         TabIndex        =   24
         Top             =   840
         Width           =   2655
      End
      Begin VB.CommandButton btnPreverDacte 
         Caption         =   "5.2 Prever DACTE"
         Height          =   315
         Left            =   120
         TabIndex        =   23
         Top             =   3360
         Width           =   2655
      End
      Begin VB.CommandButton btnAssinar 
         Caption         =   "5.1 Assinar CTeOS"
         Height          =   315
         Left            =   120
         TabIndex        =   22
         Top             =   3000
         Width           =   2655
      End
      Begin VB.CommandButton btnDataSet 
         Caption         =   "4.2 Gerar XML via DataSet"
         Height          =   315
         Left            =   120
         TabIndex        =   21
         Top             =   2640
         Width           =   2655
      End
      Begin VB.CommandButton btnTx2 
         Caption         =   "4.1 Gerar XML via Tx2"
         Height          =   315
         Left            =   120
         TabIndex        =   20
         Top             =   2280
         Width           =   2655
      End
      Begin VB.CommandButton btnStatus 
         Caption         =   "3. Verificar Status de Serviço"
         Height          =   315
         Left            =   120
         TabIndex        =   19
         Top             =   1920
         Width           =   2655
      End
      Begin VB.CommandButton btnLoadConfig 
         Caption         =   "2. LoadConfig"
         Height          =   315
         Left            =   120
         TabIndex        =   18
         Top             =   1560
         Width           =   2655
      End
      Begin VB.CommandButton btnConfiguraIni 
         Caption         =   "1.2 Configurar via arquivo .ini"
         Height          =   315
         Left            =   120
         TabIndex        =   17
         Top             =   1200
         Width           =   2655
      End
      Begin VB.CommandButton btnConfiguraSH 
         Caption         =   "1.1 Configura Software House"
         Height          =   315
         Left            =   120
         TabIndex        =   16
         Top             =   840
         Width           =   2655
      End
      Begin VB.ComboBox cbCertificados 
         Height          =   315
         Left            =   1080
         TabIndex        =   15
         Top             =   360
         Width           =   4455
      End
      Begin VB.Label Label9 
         Caption         =   "Siga as operações na ordem assinalada"
         ForeColor       =   &H8000000D&
         Height          =   255
         Left            =   120
         TabIndex        =   30
         Top             =   3720
         Width           =   2895
      End
      Begin VB.Label lblCertificado 
         Caption         =   "Certificado: "
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.Frame gbConfig 
      Caption         =   "Configurações"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4095
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2535
      Begin VB.TextBox edtUF 
         Height          =   315
         Left            =   120
         TabIndex        =   32
         Top             =   480
         Width           =   375
      End
      Begin VB.TextBox edtProtocolo 
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Top             =   3480
         Width           =   2295
      End
      Begin VB.TextBox edtRecibo 
         Height          =   285
         Left            =   120
         TabIndex        =   7
         Top             =   2880
         Width           =   2295
      End
      Begin VB.TextBox edtChave 
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Top             =   2280
         Width           =   2295
      End
      Begin VB.TextBox edtCNPJEmit 
         Height          =   285
         Left            =   120
         TabIndex        =   5
         Top             =   1680
         Width           =   2295
      End
      Begin VB.TextBox edtCNPJSH 
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Top             =   1080
         Width           =   2295
      End
      Begin VB.Label lblProtocolo 
         Caption         =   "Nº Protocolo"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   3240
         Width           =   1095
      End
      Begin VB.Label lblRecibo 
         Caption         =   "Nº Recibo"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   2640
         Width           =   1575
      End
      Begin VB.Label lblChave 
         Caption         =   "Nº Chave"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   2040
         Width           =   855
      End
      Begin VB.Label lblCNPJEmit 
         Caption         =   "CNPJ (Apenas números) *"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   1440
         Width           =   2175
      End
      Begin VB.Label lblCNPJSH 
         Caption         =   "CNPJ Software House *"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   840
         Width           =   2055
      End
      Begin VB.Label lblUF 
         Caption         =   "UF"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.Label lblStatus 
      Height          =   375
      Left            =   0
      TabIndex        =   31
      Top             =   8520
      Width           =   8535
   End
   Begin VB.Label Label2 
      Caption         =   "UF"
      Height          =   255
      Left            =   1920
      TabIndex        =   3
      Top             =   1320
      Width           =   495
   End
End
Attribute VB_Name = "FrmExemplo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Declarado Objeto pertencente a Classe que faz interação com servidores da Receita'
Dim CTeOS As CTeOSX.spdCTeOSX
Dim CTeOSDataSet As CTeOSDataSetX.spdCTeOSDataSetX
Dim ArqIni As String
Dim CertificadoSelecionado As String

'******************************************************************************************************
'
'          Declaração de funções externas
'
'******************************************************************************************************
'Função para ler arquivos INI usando API window
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal Secao As String, ByVal parametro As Any, ByVal padrao As String, ByVal variavel As String, ByVal tam As Long, ByVal arquivo As String) As Long

'Função para gravar arquivos INI usando API windows
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal Secao As String, ByVal parametro As Any, ByVal valor As Any, ByVal arquivo As String) As Long

'Função para configurar o diretório atual
Private Declare Function SetCurrentDirectory Lib "kernel32" _
() 'Alias "SetCurrentDirectoryA" (ByVal lpPathName As String) As Long

Option Explicit

'Função auxiliar para pegar o fuso
Private Const TIME_ZONE_ID_DAYLIGHT As Long = 2

'Função auxiliar para pegar o fuso
Private Type SYSTEMTIME
   wYear         As Integer
   wMonth        As Integer
   wDayOfWeek    As Integer
   wDay          As Integer
   wHour         As Integer
   wMinute       As Integer
   wSecond       As Integer
   wMilliseconds As Integer
End Type

'Função auxiliar para pegar o fuso
Private Type TIME_ZONE_INFORMATION
   Bias As Long
   StandardName(0 To 63) As Byte  'unicode (0-based)
   StandardDate As SYSTEMTIME
   StandardBias As Long
   DaylightName(0 To 63) As Byte  'unicode (0-based)
   DaylightDate As SYSTEMTIME
   DaylightBias As Long
End Type

'Função auxiliar para pegar o fuso
Private Declare Function GetTimeZoneInformation Lib "kernel32.dll" (lpTimeZoneInformation As TIME_ZONE_INFORMATION) As Long

'Função para pegar o fuso
Private Function GetCurrentTimeBias() As String

   Dim tzi As TIME_ZONE_INFORMATION
   Dim dwBias As Long
   Dim tmp As String

   Select Case GetTimeZoneInformation(tzi)
   Case TIME_ZONE_ID_DAYLIGHT
      dwBias = tzi.Bias + tzi.DaylightBias
   Case Else
      dwBias = tzi.Bias + tzi.StandardBias
   End Select

   tmp = "-0" & CStr(dwBias \ 60) & ":00"

   GetCurrentTimeBias = tmp
   
End Function

'Inicialização
Private Sub Form_Initialize()

  'Instancia o Objeto responsável pela interação com servidores da Receita
  Set CTeOS = New CTeOSX.spdCTeOSX
  
  'Instancia o Objeto responsável pela geração do DataSet
  Set CTeOSDataSet = New CTeOSDataSetX.spdCTeOSDataSetX
  
  'Utiliza Método do Componente para Listar Certificados instalado no SO
  Dim i As Integer
  Dim vetor As Variant

  vetor = Split(CTeOS.ListarCertificados, "|")
  cbCertificados.Clear
  For i = LBound(vetor) To UBound(vetor)
          cbCertificados.AddItem vetor(i)
  Next

  'Arquivo INI a ser manipulado com parametrizações
  ArqIni = App.Path + "\cteOSConfig.ini"
    
End Sub

'1.1. Configurar o CNPJ da Software House
Private Sub btnConfiguraSH_Click()
On Error GoTo TrataErroSH
    CTeOS.ConfigurarSoftwareHouse "CNPJ_sh", "token_sh" 'Token gerado no https://conta.tecnospeed.com.br/
TrataErroSH:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'1.2. Configurar CTeOS via arquivo .ini
Private Sub btnConfiguraIni_Click()
On Error GoTo TrataErroConfigIni
    
  Dim Rs As String
  
  Rs = cbCertificados.Text
  If Rs <> "" Then
  write_ini "CTeOS", "NomeCertificado", Rs
  Shell "C:\Windows\System32\notepad.exe " + App.Path + "\cteOSConfig.ini", vbNormalFocus
  Else
  AtualizaStatusNaTela ("Favor selecionar um certificado")
  End If
TrataErroConfigIni:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'2. LoadConfig
Private Sub btnLoadConfig_Click()
On Error GoTo TrataErroLoadConfig
    CTeOS.LoadConfig ArqIni
    edtUF.Text = CTeOS.UF
    edtCNPJEmit.Text = CTeOS.CNPJ
    cbCertificados.Text = CTeOS.NomeCertificado
    AtualizaStatusNaTela "Configurações carregadas via ini."
Exit Sub
TrataErroLoadConfig:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'3.Verificar Status do Servi?o
Private Sub btnStatus_Click()
 On Error GoTo TratarErroStatus
    CheckConfig (False)
    Dim Retorno As String
    Retorno = CTeOS.StatusdoServico()
    AtualizaRetornoNaTela (Retorno)
    AtualizaStatusNaTela ("Status do Serviço: OK")
Exit Sub
TratarErroStatus:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'4.1.Gerar XML via TX2
Private Sub btnTx2_Click()
    On Error GoTo TratarErroTx2
    CheckConfig (True)
    Dim arquivo As String
    Dim Retorno As String
   arquivo = FileOpen("TX2 (*.tx2) | *.tx2") 'Carrega o arquivo .tx2
   Dim fso As New FileSystemObject
   If arquivo <> "" Then
    ConfiguraCteOSDataSet
    CTeOSDataSet.LoadFromTX2 (arquivo)
    Retorno = CTeOSDataSet.GetCteOSXML()
    AtualizaRetornoNaTela (Retorno)
    edtChave.Text = Mid((CTeOSDataSet.GetCampo("Id_4")), 4, 44)
    AtualizaStatusNaTela ("Gerar XML por TX2: OK")
   End If
   Exit Sub
TratarErroTx2:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'4.2.Gerar XML via DataSet
Private Sub btnDataSet_Click()
    On Error GoTo TratarErroDataSet
    Dim XML As String
            CheckConfig (True)
            ConfiguraCteOSDataSet
            CTeOSDataSet.Incluir
            DadosdoCTeOS
            DadosTomador
            DadosEmitente
            PrestacaodeServico
            DadosImpostos
            VersaoModal
            ModalRodoviario
            CTeOSDataSet.Salvar
            XML = CTeOSDataSet.GetCteOSXML()
            edtChave.Text = Mid((CTeOSDataSet.GetCampo("Id_4")), 4, 44)
            AtualizaRetornoNaTela (XML)
            AtualizaStatusNaTela ("Gerar XML por DataSet: OK")
TratarErroDataSet:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'5.1 Assinar CTeOS
Private Sub btnAssinar_Click()
    On Error GoTo TratarErroAssina
Dim XML As String
XML = CTeOS.AssinarCTeOS(CTeOS.CompressXML(mmXML.Text))
AtualizaRetornoNaTela (XML)
AtualizaStatusNaTela ("Assinar CTeOS: OK")
TratarErroAssina:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'5.2 Prever DACTEOS
Private Sub btnPreverDacte_Click()
On Error GoTo TratarErroPrever
CheckConfig (False)
Dim XML As String
XML = mmXML.Text
If Trim(XML) <> "" Then
CTeOS.PreverDACTE XML, ""
Else
lblStatus = "Por gentileza informe o XML Assinado no memo."
End If
TratarErroPrever:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'6.Enviar CTeOS
Private Sub btnEnviarCTeOS_Click()
On Error GoTo TratarErroEnvia
    CheckConfig (False)
    Dim Retorno As String
    Retorno = CTeOS.EnviarCTeOS(CTeOS.CompressXML(mmXML.Text))
    edtProtocolo.Text = CTeOS.ExtrairProtocolo(Retorno)
    AtualizaRetornoNaTela (Retorno)
    AtualizaStatusNaTela ("Enviar CTeOS: OK")
TratarErroEnvia:
  If Err.Description <> "" Then
    lblStatus = Err.Description
  End If
End Sub

'7.Consultar CTeOS
Private Sub btnConsultaCTeOS_Click()
On Error GoTo TratarErroConsultaCTeOS
CheckConfig (True)
    Dim Retorno As String
    Retorno = CTeOS.ConsultarCTeOS(edtChave.Text)
    edtProtocolo.Text = CTeOS.ExtrairProtocolo(Retorno)
    AtualizaRetornoNaTela (Retorno)
    AtualizaStatusNaTela ("Consultar Recibo CTeOS: OK")
TratarErroConsultaCTeOS:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'8.Cancelar CTeOS
Private Sub btnCancelar_Click()
 On Error GoTo TratarErroCancela
  Load FCancela
  
  FCancela.edtChave.Text = edtChave.Text
  FCancela.edtProtocolo.Text = edtProtocolo.Text
  
  FCancela.Show vbModal
    Dim Chave As String
    Dim Protocolo As String
    Dim Justificativa As String
    Dim Retorno As String
    Dim Sequencia As String
    
    Chave = FCancela.edtChave.Text
    Protocolo = FCancela.edtProtocolo.Text
    Justificativa = FCancela.mJustificativa.Text
    Sequencia = FCancela.edtSeq.Text
    
    If Chave <> "" And Protocolo <> "" And Justificativa <> "" Then
    
    Retorno = CTeOS.CancelarCTeOSEvento(Chave, Protocolo, Justificativa, Format(Now, "yyyy-mm-ddThh:mm:ss") & GetCurrentTimeBias, Sequencia)
    
    AtualizaRetornoNaTela (Retorno)
    
    AtualizaStatusNaTela ("Cancelar CTeOS: OK")
    Else
    End If
    
    Unload FCancela
    
TratarErroCancela:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'9.Visualizar
Private Sub btnVisualizar_Click()
On Error GoTo TratarErroVisualizar
CheckConfig (False)
Dim XML As String
XML = GetXMLDestinatario(CTeOS.DiretorioXMLTomadorServico, edtChave.Text, mmXML.Text)
CTeOS.VisualizarDACTE XML, ""
TratarErroVisualizar:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'10.Exportar para PDF
Private Sub btnExporta_Click()
On Error GoTo TratarErroExportar
CheckConfig (False)
    Dim XML As String
    XML = GetXMLDestinatario(CTeOS.DiretorioXMLTomadorServico, edtChave.Text, mmXML.Text)
    CaminhoPDF (XML)
TratarErroExportar:
    If Err.Description <> "" Then
        lblStatus = Err.Description
    End If
End Sub

'Função que verifica se o componente foi configurado
Private Sub CheckConfig(ClearOutput As Boolean)
Dim bConfig As Boolean
If ClearOutput Then
    mmXML.Text = ""
End If

bConfig = True

If CTeOS.UF = "" Then
    bConfig = False
End If

If CTeOS.CNPJ = "" Then
    bConfig = False
End If

If CTeOS.NomeCertificado = "" Then
    bConfig = False
End If
If bConfig = False Then
    Err.Raise vbObjectError + 1, "Form1", "Favor configurar o componente antes de prosseguir (via ini ou via propriedades)."
End If
End Sub

'Função que define o caminho do PDF
Private Sub CaminhoPDF(XML As String)
    Dim CaminhoArquivoPDF As String
    CaminhoArquivoPDF = InputBox("Caminho do arquivo PDF", "Informe o caminho do arquivo PDF", "C:\DacteOS.PDF")
    If CaminhoArquivoPDF <> "" Then
        CTeOS.ExportarDACTEParaPDF CTeOS.CompressXML(XML), "", CaminhoArquivoPDF
        AtualizaRetornoNaTela "PDF gerado com sucesso: " + CaminhoArquivoPDF
    Else
      lblStatus = "Por gentileza informe um caminho válido."
    End If
End Sub

'Função que configura o componente DataSet
Private Sub ConfiguraCteOSDataSet()
    CTeOSDataSet.Versao = "4.00"
    CTeOSDataSet.ConfigSection = "XMLENVIO"
    CTeOSDataSet.MappingFileName = CTeOS.DiretorioEsquemas + "4.00\" + CTeOS.MappingFileName
    CTeOSDataSet.CreateDataSets
End Sub

'Função para escrever no arquivo .ini
Function write_ini(ByVal section$, ByVal chv$, ByVal variavel$) As String
    Dim arquivo As String
    Dim Retorno As String
    arquivo = ArqIni
    Retorno = WritePrivateProfileString(ByVal section$, ByVal chv$, ByVal variavel$, ByVal arquivo)
End Function

'Função que atualiza o Status
Private Sub AtualizaStatusNaTela(valor As String)
    lblStatus.Caption = valor
    lblStatus.Visible = True
End Sub

'Função que atualiza o Memo
Private Sub AtualizaRetornoNaTela(valor As String)

    mmXML.Text = CTeOS.ReformatXML(valor)
    
End Sub

'Verifica se o arquivo existe no caminho passado
Private Function FileExists(Fname As String) As Boolean
    
    If Fname = "" Or Right(Fname, 1) = "\" Then
      FileExists = False: Exit Function
    End If
    
    FileExists = (Dir(Fname) <> "")
    
End Function

'Retorna caminho do XML do tomador
Private Function GetXMLDestinatario(Diretorio As String, Chave As String, XML As String)

    Dim PathXMLDestinatario As String
    
    PathXMLDestinatario = Diretorio + "\" + Chave + "-cteos.xml"
    
    If FileExists(PathXMLDestinatario) Then
        Dim fso As New FileSystemObject
        Dim ValueXML As String
        Dim arqtxt As TextStream
        
        Set arqtxt = fso.OpenTextFile(PathXMLDestinatario)
        ValueXML = arqtxt.ReadAll
        GetXMLDestinatario = ValueXML
    ElseIf XML <> "" Then
        GetXMLDestinatario = XML
    Else
    Err.Raise vbObjectError + 1, "ExemploCTeOS", "Informe a chave de um CTeOS Autorizado ou preencha o memo com o valor do XML Destinatário."
    End If

End Function

'Função auxiliar para abrir arquivo
Function FileOpen(filtro) As String
    CommonDialog.Filter = filtro
    CommonDialog.InitDir = App.Path
    CommonDialog.ShowOpen
    If CommonDialog.FileName = "" Then
    Else
        FileOpen = CommonDialog.FileName ' The FileName property contains the selecteOSd file name.
    End If
End Function

        'Preenche os Dados do CTeOS do DataSet
        Private Sub DadosdoCTeOS()
            
            CTeOSDataSet.SetCampo "cUF_6", "42"
            CTeOSDataSet.SetCampo "cCT_7", "06021956"
            CTeOSDataSet.SetCampo "CFOP_8", "5352"
            CTeOSDataSet.SetCampo "natOp_9", "Aquisicao"
            CTeOSDataSet.SetCampo "mod_10", "67"
            CTeOSDataSet.SetCampo "serie_11", "2"
            CTeOSDataSet.SetCampo "nCT_12", "485"
            CTeOSDataSet.SetCampo "dhEmi_13", "2019-02-25T15:40:00-03:00"
            CTeOSDataSet.SetCampo "tpImp_14", "1"
            CTeOSDataSet.SetCampo "tpEmis_15", "1"
            CTeOSDataSet.SetCampo "cDV_16", "8"
            CTeOSDataSet.SetCampo "tpAmb_17", "2"
            CTeOSDataSet.SetCampo "tpCTe_18", "0"
            CTeOSDataSet.SetCampo "procEmi_19", "0"
            CTeOSDataSet.SetCampo "verProc_20", "3.00"
            CTeOSDataSet.SetCampo "cMunEnv_21", "4105805"
            CTeOSDataSet.SetCampo "xMunEnv_22", "COLOMBO"
            CTeOSDataSet.SetCampo "UFEnv_23", "PR"
            CTeOSDataSet.SetCampo "modal_24", "01"
            CTeOSDataSet.SetCampo "tpServ_25", "7"
            CTeOSDataSet.SetCampo "indIEToma_26", "1"
            CTeOSDataSet.SetCampo "cMunIni_27", "4105805"
            CTeOSDataSet.SetCampo "xMunIni_28", "COLOMBO"
            CTeOSDataSet.SetCampo "UFIni_29", "PR"
            CTeOSDataSet.SetCampo "cMunFim_30", "4105805"
            CTeOSDataSet.SetCampo "xMunFim_31", "COLOMBO"
            CTeOSDataSet.SetCampo "UFFim_32", "PR"

            CTeOSDataSet.SetCampo "xDescServ_133", "Tranporte de Passageiros"
            CTeOSDataSet.SetCampo "qCarga_135", "30"
        End Sub

        'Preenche os Dados do Tomador do DataSet
        Private Sub DadosTomador()
            CTeOSDataSet.SetCampo "CNPJ_65", "11111111111111"
            CTeOSDataSet.SetCampo "IE_67", "1111111111"
            CTeOSDataSet.SetCampo "xNome_68", "Fulano"
            CTeOSDataSet.SetCampo "xFant_69", "Fantasia Fulano"
            CTeOSDataSet.SetCampo "xLgr_72", "Rua dos Programadores"
            CTeOSDataSet.SetCampo "nro_73", "123"
            CTeOSDataSet.SetCampo "xCpl_74", "Nenhum"
            CTeOSDataSet.SetCampo "xBairro_75", "Centro"
            CTeOSDataSet.SetCampo "cMun_76", "4105805"
            CTeOSDataSet.SetCampo "xMun_77", "COLOMBO"
            CTeOSDataSet.SetCampo "CEP_78", "89233198"
            CTeOSDataSet.SetCampo "UF_79", "PR"
            CTeOSDataSet.SetCampo "cPais_80", "1058"
            CTeOSDataSet.SetCampo "xPais_81", "BRASIL"
            CTeOSDataSet.SetCampo "email_82", "email@teste.com"
        End Sub

        'Preenche os Dados do Emitente do DataSet
        Private Sub DadosEmitente()
            CTeOSDataSet.SetCampo "CNPJ_49", "22222222222222"
            CTeOSDataSet.SetCampo "IE_50", "222222222"
            CTeOSDataSet.SetCampo "xNome_52", "Emitente Teste"
            CTeOSDataSet.SetCampo "xFant_53", "Emitente"
            CTeOSDataSet.SetCampo "xLgr_55", "RUA ARISTIDES CASSAO"
            CTeOSDataSet.SetCampo "nro_56", "12"
            CTeOSDataSet.SetCampo "xBairro_58", "BALANCA"
            CTeOSDataSet.SetCampo "cMun_59", "4216503"
            CTeOSDataSet.SetCampo "xMun_60", "SAO JOAQUIM"
            CTeOSDataSet.SetCampo "CEP_61", "88600000"
            CTeOSDataSet.SetCampo "UF_62", "SC"
            CTeOSDataSet.SetCampo "CRT_1573", "1"
        End Sub

        'Preenche os Dados da Pretacao de Servico do DataSet
        Private Sub PrestacaodeServico()
            CTeOSDataSet.SetCampo "vTPrest_84", "1"
            CTeOSDataSet.SetCampo "vRec_85", "1"
        End Sub

        'Preenche os Dados dos impostos do DataSet
        Private Sub DadosImpostos()
            CTeOSDataSet.SetCampo "CST_92", "00"
            CTeOSDataSet.SetCampo "vBC_93", "1"
            CTeOSDataSet.SetCampo "pICMS_94", "7"
            CTeOSDataSet.SetCampo "vICMS_95", "0.07"
            CTeOSDataSet.SetCampo "vINSS_129", "0.10"
        End Sub

        'Preenche os Dados da Versao Modal do DataSet
        Private Sub VersaoModal()
            CTeOSDataSet.SetCampo "versaoModal_147", "4.00"
            CTeOSDataSet.SetCampo "versao_3", "4.00"
            CTeOSDataSet.SetCampo "versao_1", "4.00"

        End Sub
        'Preenche os Dados do Modal Rodoviario do DataSet
        Private Sub ModalRodoviario()
            CTeOSDataSet.IncluirParte ("Rodoos")
            CTeOSDataSet.SetCampo "TAF_2", "000000001232"
            CTeOSDataSet.SetCampo "placa_5", "AAA1234"
            CTeOSDataSet.SetCampo "UF_16", "PR"
            CTeOSDataSet.SalvarParte ("Rodoos")
        End Sub
