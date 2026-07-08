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
python -m dashboard.dashboard
PS C:\Users\ITAPT\Downloads\usb_sentinel_server> python -m dashboard.dashboard                                   
Traceback (most recent call last):
  File "<frozen runpy>", line 203, in _run_module_as_main
  File "<frozen runpy>", line 88, in _run_code
  File "C:\Users\ITAPT\Downloads\usb_sentinel_server\dashboard\dashboard.py", line 10, in <module>
    from flask import Flask, Response, jsonify, render_template, request
ModuleNotFoundError: No module named 'flask'
PS C:\Users\ITAPT\Downloads\usb_sentinel_server> pip install requirements.txt
Program 'pip.exe' failed to run: An Application Control policy has blocked this fileAt line:1 char:1
+ pip install requirements.txt
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~.
At line:1 char:1
+ pip install requirements.txt
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ResourceUnavailable: (:) [], ApplicationFailedException
    + FullyQualifiedErrorId : NativeCommandFailed










python -m pip --version
