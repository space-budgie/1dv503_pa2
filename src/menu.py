import mysql.connector
import src.database_functions
import src.database_creation

try:
    import setup
except:
    print("Something seems to be wrong with your connection, please edit setup.py and check if your SQL server "
          "is running.")
    exit()

HEADER = '''
---------------------------------------------------------------------
Welcome to the AuctionHouse Database management tool!
---------------------------------------------------------------------
'''

QUERIES = ("Search artworks not yet sold by title or artist.",
           "List all artworks not yet sold in an auction house by name.",
           "List all the artworks purchased by a selected Buyer, and their final purchase price.",
           "List all the artworks and status (sold or not with final price) by a seller.",
           "Show buyers that spent more than a certain amount.",
           "Show the amounts to transfer between sellers and buyers.",
           "Show artworks with a final selling price higher than a specified number."
           )

DB_NAME = "AuctionHouseDB"


# Main menu and choice handling
def main_menu(cnx, cursor):
    print("\n")
    print("Please select what you would like to do!")

    index = 0

    # List the names of all queries
    for query in QUERIES:
        if query:
            index += 1
            print(f"{index}. {query}")

    free_query = index + 1
    print(f"{free_query}. Enter your own query")
    quit_application = index + 2
    print(f"{quit_application}. Quit")

    # Make sure a valid choice is entered
    choice = 0
    while not choice:
        try:
            choice = int(input().replace(".", ""))

            # quit is always the last mode, if it's higher than this or lower than 1, it's not a valid option
            if choice > quit_application or choice < 1:
                print("That is not a valid choice, please try again.")
                choice = 0  # Make sure the loop runs again

        except ValueError:
            print("That is not a valid integer, please try again.")

    if choice == free_query:
        src.database_functions.free_query(cnx, cursor)

    elif choice == quit_application:
        print("See you later!")
        exit()

    elif choice == 1:
        src.database_functions.q1(cursor)

    elif choice == 2:
        src.database_functions.q2(cursor)

    elif choice == 3:
        src.database_functions.q3(cursor)

    elif choice == 4:
        src.database_functions.q4(cursor)

    elif choice == 5:
        src.database_functions.q5(cursor)

    elif choice == 6:
        src.database_functions.q6(cursor)

    elif choice == 7:
        src.database_functions.q7(cursor)


def run():
    print(HEADER)
    cnx = setup.cnx
    cursor = cnx.cursor()

    try:
        cursor.execute(f"USE {DB_NAME}")
    except mysql.connector.DatabaseError as e:
        print("Database doesn't exist yet! Creating it now...")
        src.database_creation.read_dump(cursor, setup.DUMP_LOCATION)

    # Quiting is handled by this function and with the exit() method
    while True:
        main_menu(cnx, cursor)
