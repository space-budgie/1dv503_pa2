import mysql.connector
import re
import database_functions

HEADER = '''
---------------------------------------------------------------------
Welcome to the AuctionHouse Database management tool!
---------------------------------------------------------------------
'''

QUERIES = (("List all buyer names", "SELECT name FROM Buyer"),
           (),
           (),
           (),
           ())

DB_NAME = "AuctionHouseDB"


# Initial database setup
def initial():
    print(HEADER)
    cnx = ""

    # Run this until valid connection is formed
    while not cnx:
        username = input("Please enter the username of your MySQL installation: ")
        password = input("Please enter the password of your MySQL installation: ")
        extra = input("Do you want to configure host, port and auth_plugin? "
                      "If not localhost, port 3306 and caching_sha2_password (for MySQL 8+) are used. [y/N]: ")

        # Check if extra matches some form of yes
        extra = bool(re.match("^(yes|y)$", extra, re.IGNORECASE))

        if extra:
            host = input("Please enter the host of your MySQL installation: ")
            port = 0

            # Make sure a valid integer is entered as the port
            while not port:
                try:
                    port = int(input("Please enter the port of your MySQL installation: "))
                except ValueError:  # Not a valid integer
                    print("That is not a valid port, please try again.")
            auth_plugin = input("Please enter the auth_plugin of your MySQL installation: ")

        try:
            if not extra:
                cnx = mysql.connector.connect(user=username, password=password)
            elif extra:
                cnx = mysql.connector.connect(user=username, password=password,
                                              host=host, port=port, auth_plugin=auth_plugin)

        except mysql.connector.Error as e:
            print("Something went wrong creating the connection!")
            try_again = input("Would you like to try again? [Y/n or enter e to see the error message and try again]")

            if re.match("^(no|n)$", try_again, re.IGNORECASE):
                print("All right, bye then!")
                exit()
            elif re.match("^e$", try_again, re.IGNORECASE):
                print(e)
            else:
                print("Trying again!\n")

    # Lastly, return the valid connection
    return cnx


# Main menu and choice handling
def main_menu(cnx, cursor):
    print("\n")
    print("Please select what you would like to do!")

    index = 0

    # List the names of all queries
    for query in QUERIES:
        if query:
            index += 1
            print(f"{index}. {query[0]}")

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
        # Allow the user to enter their own query, and print results if the query executed succesfully
        if database_functions.free_query(cnx, cursor):
            print_result(list(cursor), cursor.column_names)

    elif choice == quit_application:
        print("See you later!")
        exit()

    else:
        database_functions.query(cursor, QUERIES[choice - 1][1])
        print_result(list(cursor), cursor.column_names)


# Pretty printing of the result of a query
def print_result(result, column_names):
    if not result:
        print("This query didn't return anything!")
    else:

        # Add the column names to the result for printing
        result.insert(0, column_names)

        # Find the highest length of all attributes

        highest_length = 0
        for entity in result:
            for attribute in entity:

                # Make sure the attribute exists
                if attribute:
                    attribute_length = len(str(attribute))
                    if attribute_length > highest_length:
                        highest_length = attribute_length

        # The vertical row that should be printed after each row
        # result[0] is the columns and therefore contains the right amount of data
        vertical_row = "-" * highest_length * len(result[0]) + "--"

        print(vertical_row)
        for entity in result:
            print("|", end="")
            for attribute in entity:
                # Print everything in a table aligned to the left, padded with the appropriate amount of spaces
                print(f"{attribute}{' ' * (highest_length - len(str(attribute)))} |", end="")
            print()
            print(vertical_row)

    input("Press enter to return to the main menu")


def main():
    cnx = initial()
    cursor = cnx.cursor()
    cursor.execute(f"USE {DB_NAME}")

    # Quiting is handled by this function and with the exit() method
    while True:
        main_menu(cnx, cursor)


if __name__ == '__main__':
    main()
