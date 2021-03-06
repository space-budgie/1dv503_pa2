from mysql.connector import errorcode

cnx = mysql.connector.connect(user='root', password='root',
                              host='127.0.0.1')
                              auth_plugin='mysql_native_password')

DB_NAME = "AuctionHouse"
cursor = cnx.cursor()
cursor.execute("USE AuctionHouseDB")
cursor.execute("SELECT * FROM Buyer")
print(cursor.column_names)

