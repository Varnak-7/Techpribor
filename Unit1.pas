unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.Edit, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPClient;

type
  TForm1 = class(TForm)
    TrackBar1: TTrackBar;
    Label1: TLabel;
    TrackBar2: TTrackBar;
    Label2: TLabel;
    Timer1: TTimer;
    TrackBar3: TTrackBar;
    Memo1: TMemo;
    Label3: TLabel;
    TrackBar4: TTrackBar;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    IdUDPClient1: TIdUDPClient;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    TrackBar5: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
      IdUDPClient1.Host:=Edit3.Text;
      IdUDPClient1.Port:=StrToInt(Edit4.Text);

      Timer1.Interval:=Trunc(trackbar3.Value);
      Timer1.Enabled:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

       Label3.Text:=IntToStr(Trunc(trackbar3.Value))+'ms';
       Label1.Text:=IntToStr(Trunc(trackbar1.Value));
       Label2.Text:=IntToStr(Trunc(trackbar2.Value));
       Label4.Text:=FloatToStr(trackbar4.Value)+'mhz';
       TrackBar5.Value:=(TrackBar1.Value/((TrackBar1.Value + TrackBar2.Value)/100))*0.45;
end;
///////////////////////////////kkjljoljoj////////////////////////////

procedure TForm1.Memo1DblClick(Sender: TObject);
begin
     Memo1.Lines.Clear;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
        Memo1.Lines.Add('#,'+IntToStr(Trunc(TrackBar1.Value))+
        ','+IntToStr(Trunc(TrackBar2.Value))+','+FloatToStr(trackbar4.Value)+
        ','+Edit1.Text+','+Edit2.Text);
        IdUDPClient1.Send('#,'+IntToStr(Trunc(TrackBar1.Value))+
        ','+IntToStr(Trunc(TrackBar2.Value))+','+FloatToStr(trackbar4.Value)+
        ','+Edit1.Text+','+Edit2.Text+#13+#10);
        Label6.Text:= '#,'+IntToStr(Trunc(TrackBar1.Value))+
        ','+IntToStr(Trunc(TrackBar2.Value))+','+FloatToStr(trackbar4.Value)+
        ','+Edit1.Text+','+Edit2.Text;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
              Label1.Text:=IntToStr(Trunc(TrackBar1.Value));
             TrackBar5.Value:=(TrackBar1.Value/((TrackBar1.Value + TrackBar2.Value)/100))*0.45;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
       Label2.Text:=IntToStr(Trunc(TrackBar2.Value));

      TrackBar5.Value:=(TrackBar1.Value/((TrackBar1.Value + TrackBar2.Value)/100))*0.45;
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
       Timer1.Interval:=Trunc(trackbar3.Value);
       Label3.Text:=IntToStr(Trunc(trackbar3.Value))+'ms';
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
       Label4.Text:=FloatToStr(trackbar4.Value)+'mhz';
end;

procedure TForm1.TrackBar5Change(Sender: TObject);
begin
      Label5.Text:=FloatToStr((trackbar5.Value))+'°' ;
end;

end.
