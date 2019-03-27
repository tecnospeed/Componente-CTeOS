unit UEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmEventos = class(TForm)
    grpInutilizar: TGroupBox;
    edtNumeroInicial: TLabeledEdit;
    edtNumeroFinal: TLabeledEdit;
    edtSerieEventoInut: TLabeledEdit;
    edtAnoInut: TLabeledEdit;
    mmoJustInut: TMemo;
    lblJustInut: TLabel;
    btnOkEve: TButton;
    btnCanEve: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOkEveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEventos: TfrmEventos;

implementation

{$R *.dfm}

procedure TfrmEventos.btnOkEveClick(Sender: TObject);
begin
  ModalResult := mrNone;
 { if grpInutilizar.Visible then
  begin
    if (Trim(mJustificativa.Lines.Text) = '') or (Length(mJustificativa.Lines.Text) < 15)  then
    begin
      mJustificativa.SetFocus;
      raise Exception.Create('Campo justificativa está vazio ou com quantidade de caracteres inferior à 15.');
    end;

    if Trim(edtChave.Text) = '' then
    begin
      edtChave.SetFocus;
      raise Exception.Create('Campo Chave não foi preenchido');
    end;

    if Trim(edtProtocolo.Text) = '' then
    begin
      edtProtocolo.SetFocus;
      raise Exception.Create('Campo Protocolo não foi preenchido');
    end;

    if Trim(mJustificativa.Lines.Text) = '' then
    begin
      mJustificativa.SetFocus;
      raise Exception.Create('Campo Justificativa não foi preenchido');
    end;
  end;
                    }
  ModalResult := mrOk;
end;

procedure TfrmEventos.FormCreate(Sender: TObject);
begin
    edtAnoInut.MaxLength := 2;
    edtAnoInut.NumbersOnly := True;
    edtNumeroInicial.NumbersOnly := True;
    edtNumeroFinal.NumbersOnly := True;
    edtSerieEventoInut.NumbersOnly := True;

    edtAnoInut.Text := '19';
end;

end.
