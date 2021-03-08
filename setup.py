import mysql.connector

# EDIT ME
DUMP_LOCATION = 'data/SQLs/DatabaseDump.sql'


# EDIT ME
cnx = mysql.connector.connect(user='root', password='root',
                                host='127.0.0.1',
                                auth_plugin='mysql_native_password')


# MAMP CONNECTION
# cnx = mysql.connector.connect(user='root', password='root',
#                               unix_socket='/Applications/MAMP/tmp/mysql/mysql.sock')


# EDIT ME
cnx.autocommit = False
