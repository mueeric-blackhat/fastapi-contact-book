import mysql.connector

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",             # XAMPP default MySQL user
        password="",             # empty password by default
        database="contact_book"  # your DB name
    )
