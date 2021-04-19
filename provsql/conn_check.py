
import psycopg2
import os

# DEFAULTS
DEFAULT_PORT = 2345
DEFAULT_PASSWORD = '123'
DEFAULT_HOST = '127.0.0.1'

# variables
password = os.getenv('POSTGRES_PASSWORD')
if (password is None):
    password = DEFAULT_PASSWORD
port = DEFAULT_PORT
host = DEFAULT_HOST


def main(password, host, port):
    # create connection
    conn = psycopg2.connect(database="postgres", user="postgres", password=password, host=host, port=port)

    print(conn)
    conn.close()
    print ('exit')

if (__name__ == '__main__'):
    main(password = password, host=host ,port=port)