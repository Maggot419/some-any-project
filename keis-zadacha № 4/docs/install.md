# Инструкция по установке TourWebApp

1. Собрать DLL в Delphi.
2. Создать папку C:\inetpub\wwwroot\TourApp\bin
3. Скопировать DLL.
4. Создать Application Pool (No Managed Code).
5. Создать IIS Application → TourApp.
6. Разрешить ISAPI Extensions.
7. Открыть:
   http://localhost/TourApp/bin/TourWebApp.dll