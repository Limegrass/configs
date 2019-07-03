command -v pip >/dev/null 2>&1 || {echo >&2 "Python and pip required. Aborting."; exit 1; }
pip install jupyter
jupyter console --generate-config
# set to correct path in WSL
# echo "c.ZMQTerminalInteractiveShell.include_other_output = True" >> ~/.jupyter/jupyter_console_config.py
