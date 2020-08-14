unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, AdvSpin;

type
  TKoord = Record
  dd:Integer;
  mm:Integer;
  ss:Integer;
  end;
  TAdvSpinEdit = class(AdvSpin.TAdvSpinEdit)
  protected
    procedure WndProc( var Message: TMessage ); override;
  end;
  TForm2 = class(TForm)
    Label5: TLabel;
    Label7: TLabel;
    AdvSpinEdit3: TAdvSpinEdit;
    AdvSpinEdit4: TAdvSpinEdit;
    AdvSpinEdit5: TAdvSpinEdit;
    AdvSpinEdit6: TAdvSpinEdit;
    AdvSpinEdit7: TAdvSpinEdit;
    AdvSpinEdit8: TAdvSpinEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    AdvSpinEdit1: TAdvSpinEdit;
    AdvSpinEdit2: TAdvSpinEdit;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure AdvSpinEdit1Change(Sender: TObject);
    procedure AdvSpinEdit2Change(Sender: TObject);
    procedure AdvSpinEdit3Change(Sender: TObject);
    procedure AdvSpinEdit6Change(Sender: TObject);
    procedure Shirota;
    procedure Doldota;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvSpinEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

  uses ShellApi, Math, ClipBrd;

{$R *.dfm}
procedure TAdvSpinEdit.WndProc(var Message: TMessage);
var c: String;
begin
  inherited;
  if (Self.Name='AdvSpinEdit1') or (Self.Name='AdvSpinEdit2') then
  begin
  if Message.Msg = WM_PASTE then
    begin
    c:= Clipboard.AsText;
    c:= StringReplace(c, '.', ',', [rfReplaceAll, rfIgnoreCase]);
    TAdvSpinEdit(Self).Text:= c;
    end;
  end;
end;

procedure TForm2.Shirota;
var t, m, s:string;
begin
t:= inttostr(Round(AdvSpinEdit3.FloatValue));
m:= inttostr(Round(AdvSpinEdit4.FloatValue));
s:= inttostr(Round(AdvSpinEdit5.FloatValue));
Edit1.Text:=t+'°'+m+''''+s+''''''+Button1.Caption;
//Edit1.Text:=AdvSpinEdit3.Text+'°'+AdvSpinEdit4.Text+''''+AdvSpinEdit5.Text+''''''+Button1.Caption;
end;

procedure TForm2.Doldota;
var t, m, s:string;
begin
t:= inttostr(Round(AdvSpinEdit6.FloatValue));
m:= inttostr(Round(AdvSpinEdit7.FloatValue));
s:= inttostr(Round(AdvSpinEdit8.FloatValue));
Edit2.Text:=t+'°'+m+''''+s+''''''+Button2.Caption;
//Edit2.Text:=AdvSpinEdit6.Text+'°'+AdvSpinEdit7.Text+''''+AdvSpinEdit8.Text+''''''+Button2.Caption;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
//AdvSpinEdit1.
end;

Function DDDToDDMMSS(ddd:Real):TKoord;
  var mmm: real;
begin
Result.dd:=Trunc(abs(ddd));
Result.mm:= Trunc((abs(ddd)-Result.dd)*60);
Result.ss:=Round(((abs(ddd)-Result.dd)*60-Result.mm)*60);
end;

Function DDMMSSToDDD(dd,mm,ss:real):Real;
begin
//Result:=RoundTo(dd+(mm/60)+(ss/3600),-7);
Result:=dd+(mm/60)+(ss/3600);
end;

procedure TForm2.AdvSpinEdit1Change(Sender: TObject);
var koord:TKoord;
begin
if not AdvSpinEdit1.Focused then exit;

if AdvSpinEdit1.FloatValue>0 then Button1.Caption:='N' else Button1.Caption:='S';
koord:=DDDToDDMMSS(AdvSpinEdit1.FloatValue);
AdvSpinEdit3.Value:=koord.dd;
AdvSpinEdit4.Value:=koord.mm;
AdvSpinEdit5.Value:=koord.ss;
Shirota;
end;

procedure TForm2.AdvSpinEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//ShowMessage(IntToStr(Key));

if (key=VK_DECIMAL) or (key=190) or (key=191) or (key=188) then
  if pos(',' , TAdvSpinEdit(Sender).Text)=0 then
    begin
      TAdvSpinEdit(Sender).Text:=TAdvSpinEdit(Sender).Text+',';
      TAdvSpinEdit(Sender).SelStart:=Length(TAdvSpinEdit(Sender).Text);
    end;
end;

procedure TForm2.AdvSpinEdit2Change(Sender: TObject);
var koord:TKoord;
begin
if not AdvSpinEdit2.Focused then exit;
if AdvSpinEdit2.FloatValue>0 then Button2.Caption:='E' else Button1.Caption:='W';
koord:=DDDToDDMMSS(AdvSpinEdit2.FloatValue);
AdvSpinEdit6.Value:=koord.dd;
AdvSpinEdit7.Value:=koord.mm;
AdvSpinEdit8.Value:=koord.ss;
Doldota;
end;

procedure TForm2.AdvSpinEdit3Change(Sender: TObject);
begin
if AdvSpinEdit1.Focused then Exit;
AdvSpinEdit1.FloatValue:=DDMMSSToDDD(AdvSpinEdit3.FloatValue,AdvSpinEdit4.FloatValue,AdvSpinEdit5.FloatValue);
Shirota;
end;

procedure TForm2.AdvSpinEdit6Change(Sender: TObject);
begin
if AdvSpinEdit2.Focused then Exit;
AdvSpinEdit2.FloatValue:=DDMMSSToDDD(AdvSpinEdit6.FloatValue,AdvSpinEdit7.FloatValue,AdvSpinEdit8.FloatValue);
Doldota;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if Button1.Caption='N' then Button1.Caption:='S' else Button1.Caption:='N';
AdvSpinEdit1.FloatValue:=-AdvSpinEdit1.FloatValue;
Shirota;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
if Button2.Caption='E' then Button2.Caption:='W' else Button2.Caption:='E';
AdvSpinEdit2.FloatValue:=-AdvSpinEdit2.FloatValue;
Doldota;
end;

procedure TForm2.Button3Click(Sender: TObject);
var url:string;
begin
url:='https://maps.yandex.ru/?text='+AdvSpinEdit1.Text+'+'+AdvSpinEdit2.Text;
ShellExecute( Handle, 'open', Pchar(url), nil, nil, SW_NORMAL );
end;

procedure TForm2.Button4Click(Sender: TObject);
var url,s,d:string;
begin
//url:='https://maps.google.com/?hl=ru&q=loc:'+AdvSpinEdit2.Text+'%2C'+AdvSpinEdit1.Text;
    //https://www.google.ru/maps/place/54°29'3''N+72°52'44''E/
{s:=AdvSpinEdit3.Text+'°'+AdvSpinEdit4.Text+''''+AdvSpinEdit5.Text+''''''+Button1.Caption;
d:=AdvSpinEdit6.Text+'°'+AdvSpinEdit7.Text+''''+AdvSpinEdit8.Text+''''''+Button2.Caption;
url:='https://www.google.ru/maps/place/'+s+'+'+d;
}
url:='https://www.google.ru/maps/place/'+Edit1.Text+'+'+Edit2.Text;
ShellExecute( Handle, 'open', Pchar(url), nil, nil, SW_NORMAL );
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
  Form2.FormStyle:=fsStayOnTop
  else
    Form2.FormStyle:=fsNormal;
end;

end.
