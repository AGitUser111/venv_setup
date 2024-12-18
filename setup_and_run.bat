@echo on
REM Navigate to the script's directory
cd /d "%~dp0"

REM Check if the virtual environment folder exists and create a new one if it doesn't
if exist .venv (
    echo Virtual environment already exists. Skipping creation.

    REM Activate the virtual environment
    call .venv\Scripts\activate

) else (
    echo Virtual environment does not exist. Creating a new one...
    
    REM Create a new virtual environment
    python -m venv .venv

    REM Activate the virtual environment
    call .venv\Scripts\activate

    REM If you have a requirements.txt file, install the dependencies otherwise skip this step
    REM ***** make sure to have the requirements.txt file in the same directory as this script *****
    if exist requirements.txt (
        echo requirements.txt found. Installing dependencies...
        pip install -r requirements.txt
    ) else (
        echo requirements.txt not found. Skipping dependency installation.
    )
)

REM Run the Python script. Change 'example.py' to the name of your script.
python example.py

REM Deactivate the virtual environment
deactivate

REM Pause the script to see the output
pause