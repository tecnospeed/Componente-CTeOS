object frmEventos: TfrmEventos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Eventos'
  ClientHeight = 273
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpInutilizar: TGroupBox
    Left = 8
    Top = 8
    Width = 334
    Height = 257
    Caption = 'Inutiliza'#231#227'o de faixa de numera'#231#227'o'
    TabOrder = 0
    object lblJustInut: TLabel
      Left = 11
      Top = 72
      Width = 169
      Height = 13
      Caption = 'Justificativa (m'#237'nimo 15 caracteres)'
    end
    object edtNumeroInicial: TLabeledEdit
      Left = 11
      Top = 40
      Width = 70
      Height = 21
      EditLabel.Width = 67
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero Inicial'
      TabOrder = 0
    end
    object edtNumeroFinal: TLabeledEdit
      Left = 103
      Top = 40
      Width = 66
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'Numero Final'
      TabOrder = 1
    end
    object edtSerieEventoInut: TLabeledEdit
      Left = 184
      Top = 40
      Width = 65
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Serie'
      TabOrder = 2
    end
    object edtAnoInut: TLabeledEdit
      Left = 272
      Top = 40
      Width = 49
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Ano (AA)'
      TabOrder = 3
    end
    object mmoJustInut: TMemo
      Left = 11
      Top = 88
      Width = 310
      Height = 129
      TabOrder = 4
    end
    object btnOkEve: TButton
      Left = 246
      Top = 223
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 5
      OnClick = btnOkEveClick
    end
    object btnCanEve: TButton
      Left = 164
      Top = 223
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
  end
end
