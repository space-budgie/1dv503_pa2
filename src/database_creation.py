import mysql.connector
from mysql.connector import errorcode

cnx = mysql.connector.connect(user='root', password='root',
                              auth_plugin='mysql_native_password')

cursor = cnx.cursor()
cursor.execute("USE AuctionHouseDB")
cursor.execute("SELECT * FROM Buyer")
print(cursor.column_names)


