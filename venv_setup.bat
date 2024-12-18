@echo on
REM Navigate to the script's directory
cd /d "%~dp0"

REM Create a new virtual environment
python -m venv .venv

REM Activate the virtual environment
call .venv\Scripts\activate

REM If you have a requirements.txt file, install the dependencies otherwise skip this step
REM make sure to have the requirements.txt file in the same directory as this script
if exist requirements.txt (
    echo requirements.txt found. Installing dependencies...
    pip install -r requirements.txt
) else (
    echo requirements.txt not found. Skipping dependency installation.
)

REM Deactivate the virtual environment
deactivate

REM Pause the script to see the output
pause