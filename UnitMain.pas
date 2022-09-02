unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.IniFiles;

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
    ckbAuto: TCheckBox;
    ckbDelete: TCheckBox;
    btnOrigin: TButton;
    btnDestine: TButton;
    lblName: TLabel;
    procedure BtnCreateClick ( Sender: TObject );
    procedure FormCreate ( Sender: TObject );
    procedure BtnOrigemClick ( Sender: TObject );
    procedure BtnLinkClick ( Sender: TObject );
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtOrigemChange(Sender: TObject);
    procedure btnDestineClick(Sender: TObject);
    procedure btnOriginClick(Sender: TObject);
  private
    { Private declarations }
    fDir: String;
    fIniFile: TIniFile;
    procedure IniConfigSave( );
    procedure IniConfigLoad( );
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
  if (ckbDelete.Checked)
  OR (MessageDlg ( 'Add comand line: Remove Directory Exist?',
    mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes) then
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
    if (ckbAuto.Checked) OR (MessageDlg ( 'Destination directory exists'
    + #13#10 + 'Do you want to move all files to source?',
      mtConfirmation, [ mbYesToAll, mbNo ], 0 ) = mrYesToAll) then
    begin
      FileControl ( EdtLink.Text+'\*.*', EdtOrigem.Text+'\', FO_MOVE,
        FOF_SILENT or FOF_NOCONFIRMATION or FOF_NOCONFIRMMKDIR
        or FOF_SIMPLEPROGRESS );
    end;

    if (ckbAuto.Checked) OR (MessageDlg ( 'Destination directory exists'
    + #13#10 + 'Do you want to delete everything?',
      mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes) then
    begin
      FileControl ( EdtLink.Text, '', FO_DELETE, FOF_SILENT or
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

procedure TFrmMKLink.btnDestineClick(Sender: TObject);
begin
  if copy( EdtLink.Text, length( EdtLink.Text ), 1 ) <> '\' then
     EdtLink.Text := EdtLink.Text + '\';
  EdtLink.Text := EdtLink.Text + ExtractFileName ( EdtOrigem.Text );
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

procedure TFrmMKLink.btnOriginClick(Sender: TObject);
begin
  if copy( EdtOrigem.Text, length( EdtOrigem.Text ), 1 ) <> '\' then
     EdtOrigem.Text := EdtOrigem.Text + '\';
  EdtOrigem.Text := EdtOrigem.Text + ExtractFileName ( EdtLink.Text );
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
    Self.IniConfigSave( );
    FIniFile.Free;
end;

procedure TFrmMKLink.FormCreate ( Sender: TObject );
begin
  EdtOrigem.Text := string( ParamStr( 1 ) );
  fDir := ExtractFilePath(ParamStr(0));
  if FileExists(fDir+'\script.cmd') then
    MmoScript.Lines.LoadFromFile(fDir+'\script.cmd');

  FIniFile := TIniFile.Create( ExtractFilePath( ParamStr( 0 ) ) +
    'Config.ini' );
  Self.IniConfigLoad( );
end;

procedure TFrmMKLink.SpeedButton1Click(Sender: TObject);
var
   AuxText : String;
begin
   AuxText :=  EdtOrigem.Text;
   EdtOrigem.Text := EdtLink.Text;
   EdtLink.Text := AuxText;
end;

procedure TFrmMKLink.IniConfigLoad( );
begin
  Self.Left := FIniFile.ReadInteger( Self.Name, 'Left', Self.Left );
  Self.Top := FIniFile.ReadInteger( Self.Name, 'Top', Self.Top );
  Self.ClientWidth := FIniFile.ReadInteger( Self.Name, 'Width',
    Self.ClientWidth );
  Self.ClientHeight := FIniFile.ReadInteger( Self.Name, 'Height',
    Self.ClientHeight );
  Self.MakeFullyVisible( Self.Monitor );
  if FIniFile.ReadBool( Self.Name, 'Maximized', False ) then
    Self.WindowState := wsMaximized;

  ckbAuto.Checked := FIniFile.ReadBool( Self.Name, 'Auto', ckbAuto.Checked );
  ckbDelete.Checked := FIniFile.ReadBool( Self.Name, 'Delete', ckbDelete.Checked );
end;

procedure TFrmMKLink.IniConfigSave( );
begin
  Self.MakeFullyVisible( Self.Monitor );
  if Self.WindowState <> wsMaximized then
  begin
    FIniFile.WriteInteger( Self.Name, 'Left', Self.Left );
    FIniFile.WriteInteger( Self.Name, 'Top', Self.Top );
    FIniFile.WriteInteger( Self.Name, 'Width', Self.ClientWidth );
    FIniFile.WriteInteger( Self.Name, 'Height', Self.ClientHeight );
    FIniFile.WriteBool( Self.Name, 'Maximized', False );
  end
  else
    FIniFile.WriteBool( Self.Name, 'Maximized', true );

  FIniFile.WriteBool( Self.Name, 'Auto', ckbAuto.Checked );
  FIniFile.WriteBool( Self.Name, 'Delete', ckbDelete.Checked );

  FIniFile.UpdateFile;
end;


end.
