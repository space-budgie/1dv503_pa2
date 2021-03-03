import mysql.connector
from mysql.connector import errorcode
from random import randint
import time

cnx = mysql.connector.connect(user='root', password='root',
                              host='127.0.0.1', auth_plugin='mysql_native_password')

DB_NAME = "AuctionHouseDB"

cursor = cnx.cursor(buffered=True)

cursor.execute(f"USE {DB_NAME};")
cursor.execute(f"DROP TABLE IF EXISTS Receipts;")

# Create table
cursor.execute("CREATE TABLE `Receipts` ("
               " `id` mediumint(8) unsigned NOT NULL auto_increment,"
               " `date` DATE NOT NULL,"
               " `finalPrice` BIGINT NOT NULL,"
               " `artwork` mediumint(8) unsigned NOT NULL,"
               " `auctionHouse` mediumint(8) unsigned NOT NULL,"
               " `buyer` mediumint(8) unsigned NOT NULL,"
               " PRIMARY KEY (`id`),"
               " FOREIGN KEY (`artwork`) REFERENCES Artwork(`id`),"
               " FOREIGN KEY (`auctionHouse`) REFERENCES AuctionHouse(`id`),"
               " FOREIGN KEY (`buyer`) REFERENCES Buyer(`id`)"
               ") AUTO_INCREMENT=1;")

# Get all artworks
cursor.execute("SELECT id, initialPrice, sold, location FROM Artwork")

# Include all buyers at least once
chosen_buyers = list(range(1, 21, 1))

# Add 30 more random buyers because we have 50 artworks (not all used, because not all of them are sold)
chosen_buyers += [randint(1, 20) for _ in range(30)]

statement = ""

index = 0
for artwork in cursor:

    # If the artwork is labeled as sold
    if artwork[2] == 1:

        # generate a random date, price higher than the initialPrice and a random buyer
        date = ""
        date += str(randint(1990, 2020))  # year
        month = randint(1, 12)
        date += str(month) if month > 9 else "0" + str(month)
        day = randint(1, 28)
        date += str(day) if day > 9 else "0" + str(day)

        statement += (f"INSERT INTO Receipts(date, finalPrice, artwork, auctionHouse, buyer) "
                      f"VALUES ({date}, {artwork[1] + randint(100, 10000000)}, {artwork[0]}, "
                      f"{artwork[3]}, {chosen_buyers[index]});")

        index += 1

print(statement)

