# TourWebApp — Delphi WebBroker ISAPI Application

Этот проект представляет собой веб-приложение, построенное на технологии **Delphi WebBroker** и развёрнутое как **ISAPI DLL** под IIS.  
Приложение демонстрирует простейшую маршрутизацию:

- `/` — главная страница  
- `/tours` — список туров (демо данные)  
- `/tour?id=1` — просмотр одного тура  

---

## 📌 Требования

- Delphi (версии 10.x / 11.x — любой, поддерживающий WebBroker)
- Windows 10 / 11
- IIS 10+
- Включённые компоненты IIS:
  - ISAPI Extensions
  - ISAPI Filters
  - CGI (не обязательно)
  - Static Content

---

## 📁 Структура проекта

TourWebApp/
│ README.md
│ .gitignore
│ TourWebApp.dpr
│ TourWebApp.dproj
│ TourWebApp.res
│ MainModule.pas
│ MainModule.dfm
│
└── docs/
install.md
architecture.md
database.sql

---

## 🔧 Как собрать проект

1. Открыть `TourWebApp.dproj` в Delphi.
2. Выбрать конфигурацию:
	Platform: Win32
	Configuration: Debug или Release
3. Нажать **Build (Ctrl+F9)**.
4. В папке \Win32\Debug\ появится файл TourWebApp.dll

## 🌐 Развёртывание на IIS

### 1. Создать папку приложения
C:\inetpub\wwwroot\TourApp\bin

### 2. Скопировать туда DLL
TourWebApp.dll → C:\inetpub\wwwroot\TourApp\bin\

### 3. Создать Application Pool
Name: TourAppPool
.NET CLR: No Managed Code
Pipeline: Integrated

### 4. Создать IIS Application
Alias: TourApp
Physical Path: C:\inetpub\wwwroot\TourApp
Application Pool: TourAppPool

### 5. Включить ISAPI extensions
В Windows Components (IIS Features):
- ✔ ISAPI Extensions  
- ✔ ISAPI Filters  

В IIS → *Server → ISAPI and CGI restrictions*:  
→ Разрешить ISAPI DLL

---

## 🚀 Запуск

Главная страница:

http://localhost/TourApp/bin/TourWebApp.dll

Список туров:

http://localhost/TourApp/bin/TourWebApp.dll/tours

Тур по ID:

http://localhost/TourApp/bin/TourWebApp.dll/tour?id=1

---

## 📘 Описание

Приложение построено на стандартных модулях WebBroker:

- `MainModule.pas` — основной маршрутизатор
- `MainModule.dfm` — определения Actions
- Проект собирается в ISAPI DLL для IIS




