mysql -u root -p

DROP DATABASE usb_monitor;
CREATE DATABASE usb_monitor;
EXIT;
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p


"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p usb_monitor < "C:\Users\ITAPT\Downloads\usb_monitor.sql"



CREATE USER 'usb_agent'@'%' IDENTIFIED BY 'UsbAgent@2026';

GRANT SELECT, INSERT, UPDATE, DELETE
ON usb_monitor.*
TO 'usb_agent'@'%';

FLUSH PRIVILEGES;
