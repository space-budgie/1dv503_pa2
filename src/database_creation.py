from mysql.connector import errorcode
import mysql.connector

#Source: https://stackoverflow.com/questions/34275794/how-do-i-import-a-mysql-database-in-a-python-script


# cnx = mysql.connector.connect(user='root', password='root',
#                               host='127.0.0.1',
#                               auth_plugin='mysql_native_password')

cnx = mysql.connector.connect(user='root', password='root',
                              unix_socket= '/Applications/MAMP/tmp/mysql/mysql.sock')

cursor = cnx.cursor()

file = open('data/SQLs/DatabaseDump.sql')
sql = file.read()

for result in cursor.execute(sql, multi=True):
  if result.with_rows:
    result.fetchall()

