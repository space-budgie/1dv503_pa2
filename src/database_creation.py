import mysql.connector
from mysql.connector import errorcode

cnx = mysql.connector.connect(user='root', password='root',
                              host='127.0.0.1')

DB_NAME = "AuctionHouse"


