unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmMKLink = class( TForm )
    LblOrigem: TLabel;
    EdtOrigem: TEdit;
    BtnOrigem: TButton;
    LblLink: TLabel;
    EdtLink: TEdit;
    BtnLink: TButton;
    CmbTipo: TComboBox;
    Label1: TLabel;
    BtnCreate: TButton;
    OpdMKLink: TFileOpenDialog;
    SpeedButton1: TSpeedButton;
    BtnAdd: TButton;
    GpbScript: TGroupBox;
    MmoScript: TMemo;
    procedure BtnCreateClick ( Sender: TObject );
    procedure FormCreate ( Sender: TObject );
    procedure BtnOrigemClick ( Sender: TObject );
    procedure BtnLinkClick ( Sender: TObject );
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtOrigemChange(Sender: TObject);
  private
    { Private declarations }
    fDir: String;
  public
    { Public declarations }
  end;

function CreateSymbolicLinkA ( lpSymlinkFileName: PAnsiChar;
  lpTargetFileName: PAnsiChar; dwFlags: DWORD ): Boolean; stdcall;
  external 'kernel32';

function CreateSymbolicLinkW ( lpSymlinkFileName: PWideChar;
  lpTargetFileName: PWideChar; dwFlags: DWORD ): Boolean; stdcall;
  external 'kernel32';

var
  FrmMKLink: TFrmMKLink;

implementation

uses
  Winapi.ShellAPI, System.UITypes;

{$R *.dfm}

function FileControl ( FileName, FileAlter: string;
  const Func, Flags: Cardinal ): Integer;
var
  Arquivos: TSHFileOpStructW;
begin
  FillChar ( Arquivos, SizeOf( Arquivos ), 0 );
  FileName := FileName + #0 + #0;
  FileAlter := FileAlter + #0 + #0;
  Arquivos.pFrom := PWideChar ( FileName );
  Arquivos.pTo := PWideChar ( FileAlter );
  Arquivos.wFunc := Func;
  Arquivos.fFlags := Flags;
  Arquivos.fAnyOperationsAborted := False;
  Arquivos.Wnd := Application.Handle;
  // executar
  Result := SHFileOperation ( Arquivos );
end;

procedure TFrmMKLink.BtnAddClick(Sender: TObject);
begin
  if MessageDlg ( 'Remove Directory Exist?',
    mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes then
  begin
    MmoScript.Lines.Add('rmdir /s /q "'+EdtLink.Text+'"');
  end;
  MmoScript.Lines.Add('mklink /D "'+EdtLink.Text+'" "'+EdtOrigem.Text+'"');
  MmoScript.Lines.SaveToFile(fDir+'\script.cmd');
end;

procedure TFrmMKLink.BtnCreateClick ( Sender: TObject );
begin
  if not DirectoryExists ( EdtOrigem.Text ) then
     MkDir(EdtOrigem.Text);

  if DirectoryExists ( EdtLink.Text ) then
  begin
    if MessageDlg ( 'Destination directory exists'
    + #13#10 + 'Do you want to move all files to source?',
      mtConfirmation, [ mbYesToAll, mbNo ], 0 ) = mrYesToAll then
    begin
      FileControl ( EdtLink.Text+'\*.*', EdtOrigem.Text+'\', FO_MOVE,
        FOF_SIMPLEPROGRESS );
    end;

    if MessageDlg ( 'Destination directory exists'
    + #13#10 + 'Do you want to delete everything?',
      mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes then
    begin
      FileControl ( EdtLink.Text, '', FO_DELETE,
        FOF_NOCONFIRMATION or FOF_NOCONFIRMMKDIR or FOF_SIMPLEPROGRESS);
    end
    else
      Exit;
  end;

  sleep(1000);

  if CreateSymbolicLinkW ( PWideChar( EdtLink.Text ),
    PWideChar( EdtOrigem.Text ), DWORD( CmbTipo.ItemIndex ) ) then
  begin
    showMessage ( 'Create Link :)' );
  end else begin
    showMessage ( 'Error Create Link :(' );
  end;
end;

procedure TFrmMKLink.BtnLinkClick ( Sender: TObject );
begin
  OpdMKLink.FileName := EdtLink.Text;
  if OpdMKLink.Execute ( Handle ) then
  begin
    EdtLink.Text := OpdMKLink.FileName;
    if (EdtOrigem.Text <> '') and (MessageDlg ( 'Insert origin folder name?',
      mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes) then
    begin
      if copy( EdtLink.Text, length( EdtLink.Text ), 1 ) <> '\' then
        EdtLink.Text := EdtLink.Text + '\';
      EdtLink.Text := EdtLink.Text + ExtractFileName ( EdtOrigem.Text );
    end;
  end;
end;

procedure TFrmMKLink.BtnOrigemClick ( Sender: TObject );
begin
  OpdMKLink.FileName := EdtOrigem.Text;
  if OpdMKLink.Execute ( Handle ) then
  begin
    EdtOrigem.Text := OpdMKLink.FileName;
  end;
end;

procedure TFrmMKLink.EdtOrigemChange(Sender: TObject);
begin
  if (EdtOrigem.Text <> '') and (EdtLink.Text <> '') then
  begin
      BtnAdd.Enabled := True;
      BtnCreate.Enabled := True;
  end else begin
      BtnAdd.Enabled := False;
      BtnCreate.Enabled := False;
  end;
end;

procedure TFrmMKLink.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MmoScript.Lines.SaveToFile(fDir+'\script.cmd');
end;

procedure TFrmMKLink.FormCreate ( Sender: TObject );
begin
  EdtOrigem.Text := string( ParamStr( 1 ) );
  fDir := ExtractFilePath(ParamStr(0));
  if FileExists(fDir+'\script.cmd') then
    MmoScript.Lines.LoadFromFile(fDir+'\script.cmd');
end;

procedure TFrmMKLink.SpeedButton1Click(Sender: TObject);
var
   AuxText : String;
begin
   AuxText :=  EdtOrigem.Text;
   EdtOrigem.Text := EdtLink.Text;
   EdtLink.Text := AuxText;
end;

end.
