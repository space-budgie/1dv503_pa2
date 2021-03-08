import mysql.connector

# EDIT ME
DUMP_LOCATION = 'data/SQLs/DatabaseDump.sql'


# EDIT ME
cnx = mysql.connector.connect(user='root', password='root',
                                host='127.0.0.1',
                                auth_plugin='mysql_native_password')


# EDIT ME
cnx.autocommit = False
