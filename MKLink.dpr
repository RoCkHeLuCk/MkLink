program MKLink;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {FrmMKLink},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.Title := 'MKLink V1.0';
  Application.CreateForm(TFrmMKLink, FrmMKLink);
  Application.Run;

end.
