import re
import mysql.connector
from tabulate import tabulate

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
        header = [column[0] for column in cursor.description]

        print(tabulate(cursor.fetchall(),
                       headers=header,
                       tablefmt='psql'))

        input("Press enter to return to the main menu")

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


def get_result(cursor):
    result = cursor.fetchall()
    if result:
        return result
    else:
        print("That query did not return anything.")


# Search unsold artworks by title or artist
def q1(cursor):
    title = input("Please enter a title, or leave blank (example: Mackerel on a Plate): ")
    artist = input("Please enter an artist, or leave blank (example: Perera Ed): ")

    # If both of them are empty, we want to list everything
    if (not title) and (not artist):
        title = 'title'
        artist = 'artist'
    else:
        title = "'" + title +"'"
        artist = "'"+ artist +"'"

    q = "SELECT title,artist,year,medium,dimensions,initial_price " \
        "FROM Artwork " \
        f"WHERE sold = 0 AND (title = {title} OR artist = {artist});"

    query(cursor, q)
    myresult = get_result(cursor)

    if myresult:
        print(tabulate(myresult, headers=['title','artist','year','medium','dimensions','initial_price' ], tablefmt='psql'))
    input("Press enter to return to the main menu")

# Search unsold by auction house
# try: Phasellus LLC
def q2(cursor):
    name = input("Please enter the name of an auction house (example: Phasellus LLC): ")

    q = "SELECT Artwork.title, Artwork.artist, Artwork.year, Artwork.medium, " \
        "Artwork.dimensions, Artwork.url, Artwork.initial_price " \
        "FROM Artwork, AuctionHouse " \
        f"WHERE Artwork.location = AuctionHouse.id AND sold = 0 AND AuctionHouse.name = '{name}';"

    query(cursor, q)
    myresult = get_result(cursor)

    if myresult:
        print(tabulate(myresult, headers=['title','artist','year','medium','dimensions','url','initial_price' ], tablefmt='psql'))
    input("Press enter to return to the main menu")

# List all purchased artwork (with final price of each) by a selected buyer
# try: Yvonne Galloway
def q3(cursor):
    name = input("Please enter the name of a buyer (example: Yvonne Galloway): ")

    q = "SELECT Artwork.title, Artwork.artist, Artwork.year, Artwork.medium, " \
        "Artwork.dimensions, Receipts.final_price " \
        "FROM Receipts " \
        "JOIN Buyer ON Receipts.buyer = Buyer.id " \
        "JOIN Artwork ON Receipts.artwork = Artwork.id " \
        f"WHERE Buyer.name = '{name}';"

    query(cursor, q)
    myresult = get_result(cursor)

    if myresult:
        print(tabulate(myresult, headers=['title','artist','year','medium','dimensions','final_price' ], tablefmt='psql'))
    input("Press enter to return to the main menu")

# List all the artwork and status (sold or not with final price of each in case is sold) by a selected seller
# try: Ezekiel Cunningham
def q4(cursor):
    name = input("Please enter the name of a seller (example: Ezekiel Cunningham): ")

    q = "SELECT Artwork.title, Artwork.artist, Artwork.year, Artwork.medium, " \
        "Artwork.dimensions, Artwork.initial_price, Artwork.sold, Receipts.final_price " \
        "FROM Artwork, Receipts, Seller " \
        f"WHERE Artwork.id = Receipts.artwork AND Artwork.seller = Seller.id AND Seller.name = '{name}';"

    query(cursor, q)
    myresult = get_result(cursor)

    if myresult:
        print(tabulate(myresult, headers=['title','artist','year','medium','dimensions','final_price', 'sold', 'final_price'], tablefmt='psql'))
    input("Press enter to return to the main menu")

# Show buyers who spent more than a certain amount
def q5(cursor):
    amount = 0
    while not amount:
        try:
            amount = int(input("Please enter an amount: "))
        except ValueError:
            print("I'm sorry, that was not a valid number, please try again.")

    q = "SELECT Buyer.name, SUM(Receipts.final_price) AS total_spent " \
        "FROM Buyer " \
        "JOIN Receipts ON Receipts.buyer = Buyer.id " \
        "GROUP BY Receipts.buyer " \
        f"HAVING total_spent > {amount} " \
        "ORDER BY total_spent DESC;"

    query(cursor, q)
    myresult = get_result(cursor)

    if myresult:
        print(tabulate(myresult, headers=['buyer name','total spent'], tablefmt='psql'))
    input("Press enter to return to the main menu")

# View table money transfer
def q6(cursor):
    q = "SELECT Seller, Seller_Account, Buyer, Buyer_Credit_Card, Amount " \
        "FROM Transfer " \
        "ORDER BY Seller ASC;"

    query(cursor, q)
    myresult = get_result(cursor)

    if myresult:
        print(tabulate(myresult, headers=['seller','seller bank account','buyer','buyer credit card','total amount'], tablefmt='psql'))
    input("Press enter to return to the main menu")

# Artwork sold at a price higher than given
def q7(cursor):
    price = 0
    while not price:
        try:
            price = int(input("Please enter a price: "))
        except ValueError:
            print("I'm sorry, that was not a valid number, please try again.")

    q = "SELECT Artwork.title, Receipts.final_price " \
        "FROM Artwork, Receipts " \
        f"WHERE Receipts.artwork = Artwork.id AND Receipts.final_price > {price} " \
        "ORDER BY Receipts.final_price DESC;"

    query(cursor, q)
    myresult = get_result(cursor)

    if myresult:
        print(tabulate(myresult, headers=['artwork title','final price'], tablefmt='psql'))
    input("Press enter to return to the main menu")