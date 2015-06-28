# Your init script

# Make environment variables available to Atom
process.env.PATH = ['/usr/local/bin', process.env.PATH].join(':')

# Ensure that Python correctly outputs Unicode characters
process.env.PYTHONIOENCODING = 'utf_8'

# Prevent Python from generating bytecode (.pyc, .pyo) files
process.env.PYTHONDONTWRITEBYTECODE = '1'