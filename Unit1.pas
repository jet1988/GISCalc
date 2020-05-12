unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, MaskEdEx,
  Vcl.Buttons, AdvSpin;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MaskEditEx1: TMaskEditEx;
    MaskEditEx2: TMaskEditEx;
    MaskEditEx3: TMaskEditEx;
    MaskEditEx4: TMaskEditEx;
    MaskEditEx13: TMaskEditEx;
    MaskEditEx14: TMaskEditEx;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    MaskEditEx5: TMaskEditEx;
    MaskEditEx6: TMaskEditEx;
    Label6: TLabel;
    MaskEditEx7: TMaskEditEx;
    MaskEditEx8: TMaskEditEx;
    MaskEditEx9: TMaskEditEx;
    MaskEditEx10: TMaskEditEx;
    MaskEditEx11: TMaskEditEx;
    MaskEditEx12: TMaskEditEx;
    BitBtn5: TBitBtn;
    Memo1: TMemo;
    Label5: TLabel;
    Label7: TLabel;
    AdvSpinEdit1: TAdvSpinEdit;
    AdvSpinEdit2: TAdvSpinEdit;
    AdvSpinEdit3: TAdvSpinEdit;
    AdvSpinEdit4: TAdvSpinEdit;
    AdvSpinEdit5: TAdvSpinEdit;
    AdvSpinEdit6: TAdvSpinEdit;
    AdvSpinEdit7: TAdvSpinEdit;
    AdvSpinEdit8: TAdvSpinEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure DDD(ddd:Real; p:byte);
    procedure DDMM(dd:Integer; mmm:Real; p:byte);
    procedure DDMMSS(dd,mm:Integer; sss:Real; p:byte);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEditEx8Change(Sender: TObject);
    procedure MaskEditEx10Change(Sender: TObject);
    procedure MaskEditEx12Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure MaskEditEx11Enter(Sender: TObject);
    procedure MaskEditEx9Enter(Sender: TObject);
    procedure MaskEditEx7Enter(Sender: TObject);
    procedure MaskEditEx3Enter(Sender: TObject);
    procedure MaskEditEx5Enter(Sender: TObject);
    procedure MaskEditEx4Enter(Sender: TObject);
    procedure MaskEditEx6Enter(Sender: TObject);
    procedure MaskEditEx1Enter(Sender: TObject);
    procedure MaskEditEx2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

  uses ShellApi, Math;

{$R *.dfm}

procedure TForm1.BitBtn5Click(Sender: TObject);
var URL: string;
begin
URL:='https://www.google.ru/maps/place/'+MaskEditEx13.Text+'+'+MaskEditEx14.Text+'/';
Memo1.Text:=URL;
ShellExecute( Handle, 'open', PChar(URL), nil, nil, SW_NORMAL );
end;

procedure TForm1.DDD(ddd:Real; p:byte);
var mmm, sss : Real;
    dd, mm : Integer;
begin
  //ddd:=StrToFloat(MaskEditEx1.Text);

  dd:= abs(Trunc(ddd));
  mmm:=RoundTo(abs(Frac(ddd)*60),-6);
  mm:= abs(Trunc(mmm));
  sss:=RoundTo(abs(Frac(mmm)*60),-6);

  case p of
    1: begin
    MaskEditEx3.Text:=IntToStr(dd);
    MaskEditEx5.Text:=FloatToStr(mmm);

    MaskEditEx7.Text:=IntToStr(dd);
    MaskEditEx9.Text:=IntToStr(mm);
    MaskEditEx11.Text:=FloatToStr(sss);

    MaskEditEx13.Text:=MaskEditEx7.Text+'°'+MaskEditEx9.Text+'′'+IntToStr(Round(sss))+'′′';
    if ddd>0 then MaskEditEx13.Text:=MaskEditEx13.Text+'N'
      else MaskEditEx13.Text:=MaskEditEx13.Text+'S';
    end;
    2: begin
    MaskEditEx4.Text:=IntToStr(dd);
    MaskEditEx6.Text:=FloatToStr(mmm);

    MaskEditEx8.Text:=IntToStr(dd);
    MaskEditEx10.Text:=IntToStr(mm);
    MaskEditEx12.Text:=FloatToStr(sss);

    MaskEditEx14.Text:=MaskEditEx8.Text+'°'+MaskEditEx10.Text+'′'+IntToStr(Round(sss))+'′′';
    if ddd>0 then MaskEditEx14.Text:=MaskEditEx14.Text+'E'
      else MaskEditEx14.Text:=MaskEditEx14.Text+'W';
    end;
  end;

end;

procedure TForm1.DDMM(dd:Integer; mmm:Real; p:Byte);
var ddd, sss : Real;
    mm : Integer;
begin
  ddd:=RoundTo(dd+(mmm/60),-6);
  mm:= abs(Trunc(mmm));
  sss:=RoundTo(abs(Frac(mmm)*60),-6);

  case p of
    1: begin
    MaskEditEx1.Text:=FloatToStr(ddd);

    MaskEditEx7.Text:=IntToStr(dd);
    MaskEditEx9.Text:=IntToStr(mm);
    MaskEditEx11.Text:=FloatToStr(sss);

    MaskEditEx13.Text:=MaskEditEx7.Text+'°'+MaskEditEx9.Text+'′'+IntToStr(Round(sss))+'′′';
    if ddd>0 then MaskEditEx13.Text:=MaskEditEx13.Text+'N'
      else MaskEditEx13.Text:=MaskEditEx13.Text+'S';
    end;
    2: begin
    MaskEditEx2.Text:=FloatToStr(ddd);

    MaskEditEx8.Text:=IntToStr(dd);
    MaskEditEx10.Text:=IntToStr(mm);
    MaskEditEx12.Text:=FloatToStr(sss);

    MaskEditEx14.Text:=MaskEditEx8.Text+'°'+MaskEditEx10.Text+'′'+IntToStr(Round(sss))+'′′';
    if ddd>0 then MaskEditEx14.Text:=MaskEditEx14.Text+'E'
      else MaskEditEx14.Text:=MaskEditEx14.Text+'W';
    end;
  end;
end;

procedure TForm1.DDMMSS(dd,mm:Integer; sss:Real; p:byte);
var ddd, mmm : Real;
begin
ddd:=RoundTo(dd+(mm/60)+(sss/3600),-6);
mmm:=RoundTo(abs(Frac(ddd)*60),-6);

case p of
    1: begin
    MaskEditEx1.Text:=FloatToStr(ddd);

    MaskEditEx3.Text:=IntToStr(dd);
    MaskEditEx5.Text:=FloatToStr(mmm);

    MaskEditEx13.Text:=MaskEditEx7.Text+'°'+MaskEditEx9.Text+'′'+IntToStr(Round(sss))+'′′';
    if ddd>0 then MaskEditEx13.Text:=MaskEditEx13.Text+'N'
      else MaskEditEx13.Text:=MaskEditEx13.Text+'S';
    end;
    2: begin
    MaskEditEx2.Text:=FloatToStr(ddd);

    MaskEditEx4.Text:=IntToStr(dd);
    MaskEditEx6.Text:=FloatToStr(mmm);

    MaskEditEx8.Text:=IntToStr(dd);
    MaskEditEx10.Text:=IntToStr(mm);
    MaskEditEx12.Text:=FloatToStr(sss);

    MaskEditEx14.Text:=MaskEditEx8.Text+'°'+MaskEditEx10.Text+'′'+IntToStr(Round(sss))+'′′';
    if ddd>0 then MaskEditEx14.Text:=MaskEditEx14.Text+'E'
      else MaskEditEx14.Text:=MaskEditEx14.Text+'W';
    end;
  end;
end;

procedure TForm1.MaskEditEx10Change(Sender: TObject);
begin
DDMMSS(StrToInt(MaskEditEx8.Text),StrToInt(MaskEditEx10.Text),StrToFloat(MaskEditEx12.Text),2);
end;

procedure TForm1.MaskEditEx11Enter(Sender: TObject);
begin
DDMMSS(StrToInt(MaskEditEx7.Text),StrToInt(MaskEditEx9.Text),StrToFloat(MaskEditEx11.Text),1);
end;

procedure TForm1.MaskEditEx12Change(Sender: TObject);
begin
DDMMSS(StrToInt(MaskEditEx8.Text),StrToInt(MaskEditEx10.Text),StrToFloat(MaskEditEx12.Text),2);
end;

procedure TForm1.MaskEditEx1Enter(Sender: TObject);
begin
DDD(StrToFloat(MaskEditEx1.Text),1);
end;

procedure TForm1.MaskEditEx2Enter(Sender: TObject);
begin
DDD(StrToFloat(MaskEditEx2.Text),2);
end;

procedure TForm1.MaskEditEx3Enter(Sender: TObject);
begin
DDMM(StrToInt(MaskEditEx3.Text),StrToFloat(MaskEditEx5.Text),1);
end;

procedure TForm1.MaskEditEx4Enter(Sender: TObject);
begin
DDMM(StrToInt(MaskEditEx4.Text),StrToFloat(MaskEditEx6.Text),2);
end;

procedure TForm1.MaskEditEx5Enter(Sender: TObject);
begin
DDMM(StrToInt(MaskEditEx3.Text),StrToFloat(MaskEditEx5.Text),1);
end;

procedure TForm1.MaskEditEx6Enter(Sender: TObject);
begin
DDMM(StrToInt(MaskEditEx4.Text),StrToFloat(MaskEditEx6.Text),2);
end;

procedure TForm1.MaskEditEx7Enter(Sender: TObject);
begin
DDMMSS(StrToInt(MaskEditEx7.Text),StrToInt(MaskEditEx9.Text),StrToFloat(MaskEditEx11.Text),1);
end;

procedure TForm1.MaskEditEx8Change(Sender: TObject);
begin
DDMMSS(StrToInt(MaskEditEx8.Text),StrToInt(MaskEditEx10.Text),StrToFloat(MaskEditEx12.Text),2);
end;

procedure TForm1.MaskEditEx9Enter(Sender: TObject);
begin
DDMMSS(StrToInt(MaskEditEx7.Text),StrToInt(MaskEditEx9.Text),StrToFloat(MaskEditEx11.Text),1);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
  var URL,k:string;
  s,d:real;

begin
s:= StrToFloat(MaskEditEx1.Text);
d:= StrToFloat(MaskEditEx2.Text);

URL:='http://maps.yandex.ru/?ll='+FloatToStr(d)+','+FloatToStr(s)+'&z=18&l=sat,skl,&pt='+FloatToStr(d)+','+FloatToStr(s)+',pmwtm1';
//URL:='http://maps.yandex.ru/?text='+MaskEditEx2.Text+','+MaskEditEx1.Text;
Memo1.Text:=URL;
ShellExecute( Handle, 'open', PChar(URL), nil, nil, SW_NORMAL );
end;

end.
