@echo off
title ManganEX Launcher

echo Starting ManganEX Backend...
start "ManganEX Backend" cmd /k "cd /d ""%~dp0backend"" && (if exist venv\Scripts\activate.bat (call venv\Scripts\activate.bat) else (echo Using system python)) && python -m uvicorn app.main:app --reload"

timeout /t 3 /nobreak >nul

echo Starting ManganEX Frontend...
start "ManganEX Frontend" cmd /k "cd /d ""%~dp0frontend"" && npm.cmd run dev"

timeout /t 4 /nobreak >nul

echo Opening ManganEX...
start http://localhost:5173

exit