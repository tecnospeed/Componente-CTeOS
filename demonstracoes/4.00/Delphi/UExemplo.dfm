object FrmExemplo: TFrmExemplo
  Left = 554
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Demonstra'#231#227'o do Componente CTeOS'
  ClientHeight = 700
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 700
    Align = alClient
    TabOrder = 0
    object pnlConfig: TPanel
      Left = 0
      Top = 1
      Width = 675
      Height = 296
      BevelOuter = bvNone
      BorderWidth = 5
      TabOrder = 0
      object gbConfig: TGroupBox
        Left = 5
        Top = 5
        Width = 213
        Height = 251
        Align = alCustom
        Caption = ' Configura'#231#245'es '
        TabOrder = 0
        object edtCNPJ: TLabeledEdit
          Left = 3
          Top = 143
          Width = 190
          Height = 21
          TabStop = False
          Color = cl3DLight
          EditLabel.Width = 142
          EditLabel.Height = 13
          EditLabel.Caption = 'CNPJ (Apenas n'#250'meros)*'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtProtocolo: TLabeledEdit
          Left = 10
          Top = 221
          Width = 190
          Height = 21
          TabStop = False
          EditLabel.Width = 75
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'N'#186' do Protocolo'
          EditLabel.ParentBiDiMode = False
          TabOrder = 3
        end
        object edtUF: TLabeledEdit
          Left = 14
          Top = 28
          Width = 57
          Height = 21
          TabStop = False
          Color = cl3DLight
          EditLabel.Width = 17
          EditLabel.Height = 13
          EditLabel.Caption = 'UF'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtChave: TLabeledEdit
          Left = 10
          Top = 180
          Width = 190
          Height = 21
          TabStop = False
          EditLabel.Width = 61
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'N'#186' da Chave'
          EditLabel.ParentBiDiMode = False
          TabOrder = 2
        end
        object edtAmbiente: TLabeledEdit
          Left = 77
          Top = 28
          Width = 123
          Height = 21
          TabStop = False
          Color = cl3DLight
          EditLabel.Width = 53
          EditLabel.Height = 13
          EditLabel.Caption = 'Ambiente'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edttoken: TEdit
          Left = 3
          Top = 95
          Width = 197
          Height = 21
          TabOrder = 5
          Text = 'Token Software house'
        end
        object StaticText1: TStaticText
          Left = 5
          Top = 48
          Width = 140
          Height = 17
          Caption = 'Configurar Softwhare house'
          TabOrder = 6
        end
      end
    end
    object grpOptions: TGroupBox
      Left = 224
      Top = 7
      Width = 448
      Height = 250
      Align = alCustom
      Caption = ' Opera'#231#245'es '
      TabOrder = 1
      object lblInfo: TLabel
        Left = 15
        Top = 229
        Width = 191
        Height = 13
        Caption = 'Siga as opera'#231#245'es na ordem assinalada.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel
        Left = 9
        Top = 18
        Width = 56
        Height = 13
        Caption = 'Certificado:'
      end
      object btnConfigIni: TBitBtn
        Left = 14
        Top = 66
        Width = 200
        Height = 25
        Caption = '1.2. Configurar arquivo .ini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnConfigIniClick
      end
      object btnCancelarCTeOS: TBitBtn
        Left = 225
        Top = 120
        Width = 214
        Height = 25
        Caption = '8. Cancelar CTeOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = btnCancelarCTeOSClick
      end
      object btnEnviarCTeOS: TBitBtn
        Left = 225
        Top = 66
        Width = 214
        Height = 25
        Caption = '6. Enviar CTeOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = btnEnviarCTeOSClick
      end
      object btnConsultarCTeOS: TBitBtn
        Left = 225
        Top = 93
        Width = 214
        Height = 25
        Hint = 'Consulta Avulsa'
        Caption = '7. Consultar CTeOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = btnConsultarCTeOSClick
      end
      object btnGerarXMLViaDataSet: TButton
        Left = 14
        Top = 174
        Width = 200
        Height = 25
        Caption = '4.2 Gerar XML via DataSet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = btnGerarXMLViaDataSetClick
      end
      object btnGerarXMLViaTx2: TButton
        Left = 14
        Top = 147
        Width = 200
        Height = 25
        Caption = '4.1. Gerar XML via Tx2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnGerarXMLViaTx2Click
      end
      object btnVerificarStatus: TBitBtn
        Left = 14
        Top = 120
        Width = 200
        Height = 25
        Caption = '3. Verificar Status do Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnVerificarStatusClick
      end
      object btnLoadConfig: TButton
        Left = 14
        Top = 93
        Width = 200
        Height = 25
        Caption = '2. LoadConfig (arquivo .ini)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnLoadConfigClick
      end
      object btnAssinar: TButton
        Left = 15
        Top = 201
        Width = 199
        Height = 25
        Caption = '5.1 Assinar CTeOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = btnAssinarClick
      end
      object btnPreverDacte: TButton
        Left = 225
        Top = 39
        Width = 214
        Height = 25
        Caption = '5.2 Prever DACTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = btnPreverDacteClick
      end
      object btnConfiguraSH: TBitBtn
        Left = 14
        Top = 39
        Width = 200
        Height = 25
        Caption = '1.1. Configura Software House'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnConfiguraSHClick
      end
      object grpImpressao: TGroupBox
        Left = 225
        Top = 151
        Width = 214
        Height = 82
        BiDiMode = bdLeftToRight
        Caption = ' Impress'#227'o do DACTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 12
        TabStop = True
        object btnExportarPDF: TBitBtn
          Left = 5
          Top = 50
          Width = 200
          Height = 25
          Caption = '10. Exportar para PDF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnExportarPDFClick
        end
        object btnVisualizar: TBitBtn
          Left = 5
          Top = 23
          Width = 200
          Height = 25
          Caption = '9. Visualizar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnVisualizarClick
        end
      end
      object cbListaCertificados: TComboBox
        Left = 67
        Top = 15
        Width = 372
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Selecione o Certificado'
      end
    end
  end
  object pgCtrlMessages: TPageControl
    Left = 6
    Top = 263
    Width = 666
    Height = 432
    ActivePage = tbSheetMemo
    Align = alCustom
    TabOrder = 1
    TabStop = False
    object tbSheetMemo: TTabSheet
      Caption = 'XML'
      object lblHidden: TLabel
        Left = 0
        Top = 339
        Width = 658
        Height = 32
        Align = alBottom
        Alignment = taCenter
        Caption = 'Antes de come'#231'ar, configure o arquivo mdfeConfig.ini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        ExplicitWidth = 715
      end
      object mOutput: TMemo
        Left = 0
        Top = 0
        Width = 658
        Height = 377
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object mStatus: TMemo
        Left = 0
        Top = 371
        Width = 658
        Height = 33
        TabStop = False
        Align = alBottom
        TabOrder = 1
      end
    end
    object tbsXMLFormatado: TTabSheet
      Caption = 'XML Formatado'
      ImageIndex = 1
      object mFmtOutput: TMemo
        Left = 0
        Top = 0
        Width = 658
        Height = 404
        TabStop = False
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object btnInut: TButton
    Left = 594
    Top = 262
    Width = 75
    Height = 19
    Caption = 'Eventos'
    TabOrder = 2
    OnClick = btnInutClick
  end
  object edtSH: TEdit
    Left = 8
    Top = 72
    Width = 197
    Height = 21
    TabOrder = 3
    Text = 'CNPJ Software house'
  end
  object OpnDlgTx2: TOpenDialog
    Left = 25
    Top = 582
  end
  object OpnDlgXML: TOpenDialog
    Left = 65
    Top = 582
  end
  object svDlgExportar: TSaveDialog
    Left = 105
    Top = 582
  end
end
