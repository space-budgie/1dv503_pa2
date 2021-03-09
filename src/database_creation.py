from mysql.connector import errorcode
import mysql.connector
import os

# Source: https://stackoverflow.com/questions/34275794/how-do-i-import-a-mysql-database-in-a-python-script


def read_dump(cursor, location):
    try:
        file = open(os.path.abspath(location))
        sql = file.read()

        for result in cursor.execute(sql, multi=True):
            if result.with_rows:
                result.fetchall()

        file.close()
    except StopIteration:  # Ignore the StopIteration error
        pass
