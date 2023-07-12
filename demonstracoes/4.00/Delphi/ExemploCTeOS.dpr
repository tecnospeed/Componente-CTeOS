program ExemploCTeOS;

uses
  Forms,
  UCancelamentoCTeOS in 'UCancelamentoCTeOS.pas' {frmCancelamentoCTeOS},
  UExemplo in 'UExemplo.pas' {FrmExemplo},
  UEventos in 'UEventos.pas' {frmEventos};

{FrmExemplo}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmExemplo, FrmExemplo);
  Application.CreateForm(TfrmEventos, frmEventos);
  Application.Run;
end.
