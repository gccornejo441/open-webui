# activate venv.  If conda env, use conda activate
python -m uvicorn open_webui.main:app --host 0.0.0.0 --port 8080 --reload
