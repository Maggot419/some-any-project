unit MainModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    procedure HandleTours(Request: TWebRequest; Response: TWebResponse);
    procedure HandleTour(Request: TWebRequest; Response: TWebResponse);
  public
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{$R *.dfm}

procedure TWebModule1.HandleTours(Request: TWebRequest; Response: TWebResponse);
begin
  Response.ContentType := 'text/html; charset=utf-8';
  Response.Content :=
    '<html>' +
    '<head><meta charset="utf-8"><title>Список туров</title></head>' +
    '<body>' +
    '<h2>Список туров (демо)</h2>' +
    '<ul>' +
    '<li>Париж на выходные</li>' +
    '<li>Сочи — море и горы</li>' +
    '<li>Золотое кольцо России</li>' +
    '</ul>' +
    '</body></html>';
end;

procedure TWebModule1.HandleTour(Request: TWebRequest; Response: TWebResponse);
var
  ID: string;
begin
  ID := Request.QueryFields.Values['id'];

  Response.ContentType := 'text/html; charset=utf-8';

  if ID = '' then
  begin
    Response.Content :=
      '<html><body><h3>Ошибка: параметр id не указан</h3></body></html>';
    Exit;
  end;

  Response.Content :=
    '<html>' +
    '<head><meta charset="utf-8"><title>Информация о туре</title></head>' +
    '<body>' +
    '<h2>Вы выбрали тур с ID = ' + ID + '</h2>' +
    '<p>Позже будет информация из базы данных.</p>' +
    '</body></html>';
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  Path: string;
begin
  Path := LowerCase(Request.PathInfo);

  if Path = '/tours' then
  begin
    HandleTours(Request, Response);
    Handled := True;
    Exit;
  end;

  if Path = '/tour' then
  begin
    HandleTour(Request, Response);
    Handled := True;
    Exit;
  end;

  Response.ContentType := 'text/html; charset=utf-8';
  Response.Content :=
    '<html>' +
    '<head><meta charset="utf-8"><title>Главная</title></head>' +
    '<body>' +
    '<h2>Добро пожаловать!</h2>' +
    '<p>Используйте ссылки:</p>' +
    '<ul>' +
    '<li><a href="TourWebApp.dll/tours">Список туров</a></li>' +
    '<li><a href="TourWebApp.dll/tour?id=1">Тур №1</a></li>' +
    '</ul>' +
    '</body></html>';

  Handled := True;
end;

end.
