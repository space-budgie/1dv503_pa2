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