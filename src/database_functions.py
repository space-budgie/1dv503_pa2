import re
import mysql.connector

AUTO_COMMIT_ASKED = False


def free_query(cnx, cursor):
    global AUTO_COMMIT_ASKED
    if not AUTO_COMMIT_ASKED and not cnx.autocommit:
        print("Autocommit is disabled! This means that changes you make to the database won't be committed.\n"
              "If you would like to keep your changes in the database, please enter the word 'commit' to enable "
              "autocommit for the rest of this execution.\n"
              "Note: committing is not necessary if you are only going to retrieve data with your queries.")

        if input("Enter 'commit' to enable autocommit, or anything else to leave it disabled: ") == 'commit':
            cnx.autocommit = True

        AUTO_COMMIT_ASKED = True

    query_to_execute = input("Please enter a query: ")

    try:
        cursor.execute(query_to_execute)
        return True  # Executed successfully
    except mysql.connector.Error as e:
        handle_query_error(query_to_execute, e)
        return False  # Executed unsuccessfully


def query(cursor, query_to_execute):
    try:
        cursor.execute(query_to_execute)
    except mysql.connector.Error as e:
        handle_query_error(query_to_execute, e)


def handle_query_error(query_to_execute, error):
    print(f"Something went wrong while executing the query {query_to_execute}!")
    show_error = input("Enter 'e' if you would like to see the error code: ")

    if re.match("^e$", show_error, re.IGNORECASE):
        print(error)


# Search unsold artworks by title or artist
def q1(cursor):
    title = input("Please enter a title, or leave blank: ")
    artist = input("Please enter an artist, or leave blank: ")

    # If both of them are empty, we want to list everything
    if (not title) and (not artist):
        title = 'title'
        artist = 'artist'

    q = "SELECT title,artist,year,medium,dimensions,url,initialPrice " \
        "FROM Artwork " \
        f"WHERE sold = 0 AND (title = {title} OR artist = {artist});"

    query(cursor, q)


# Search unsold by auction house
def q2(cursor):
    name = input("Please enter the name of an auction house: ")

    q = "SELECT Artwork.title, Artwork.artist, Artwork.year, Artwork.medium, " \
        "Artwork.dimensions, Artwork.url, Artwork.initialPrice " \
        "FROM Artwork, AuctionHouse " \
        f"WHERE Artwork.location = AuctionHouse.id AND sold = 0 AND AuctionHouse.Name = {name};"

    query(cursor, q)


def q3(cursor):
    name = input("Please enter the name of a buyer")

    q = "SELECT Artwork.title, Artwork.artist, Artwork.year, Artwork.medium, " \
        "Artwork.dimensions, Artwork.url, Receipts.finalPrice " \
        "FROM Receipts " \
        "JOIN Buyer ON Receipts.buyer = Buyer.id " \
        "JOIN Artwork ON Receipts.artwork = Artwork.id " \
        f"WHERE Buyer.Name = {name}"

    query(cursor, q)


def q4(cursor):
    name = input("Please enter the name of a seller: ")

    q = "SELECT Artwork.title, Artwork.artist, Artwork.year, Artwork.medium, " \
        "Artwork.dimensions, Artwork.url, Artwork.initialPrice, Artwork.sold, Receipts.finalPrice" \
        "FROM Artwork, Receipts, Seller" \
        f"WHERE Artwork.id = Receipts.artwork AND Artwork.seller = Seller.id AND Seller.Name = {name};"

    query(cursor, q)


def q5(cursor):
    amount = 0
    while not amount:
        try:
            amount = int(input("Please enter an amount: "))
        except ValueError:
            print("I'm sorry, that was not a valid number, please try again.")

    q = "SELECT Buyer.name, SUM(Receipts.finalPrice) AS totalSpent " \
        "FROM Buyer " \
        "JOIN Receipts ON Receipts.buyer = Buyer.id " \
        "GROUP BY Receipts.buyer" \
        "ORDER BY totalSpent DESC;"

    query(cursor, q)


def q6(cursor):
    q = "SELECT Seller, Buyer, SUM(Amount) AS Amount, SellerAccount, BuyerCreditcard " \
        "FROM Transfer " \
        "GROUP BY Buyer " \
        "ORDER BY Buyer ASC;"

    query(cursor, q)


def q7(cursor):
    price = 0
    while not price:
        try:
            price = int(input("Please enter a price: "))
        except ValueError:
            print("I'm sorry, that was not a valid number, please try again.")

    q = "SELECT Artwork.title, Receipts.finalPrice " \
        "FROM Artwork, Receipts " \
        f"WHERE Receipts.artwork = Artwork.id AND Receipts.finalPrice > {price} " \
        "ORDER BY Receipts.finalPrice DESC;"

    query(cursor, q)
