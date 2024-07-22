import mysql.connector


def truncate_all_tables(db_name, user, password, host="localhost"):
    conn = mysql.connector.connect(
        host="localhost",
        user="tynuev_admin",
        password="tynuev_password",
        database="tynuev_db",
    )
    cursor = conn.cursor()

    # Generate Truncate Statements
    cursor.execute(
        f"SELECT CONCAT('TRUNCATE TABLE ', table_name) FROM information_schema.tables WHERE table_schema = '{db_name}'"
    )
        print(truncate_stmt)

    # Execute each Truncate Statement
    for (truncate_stmt,) in cursor:
        print(truncate_stmt)
        cursor.execute(truncate_stmt)

    conn.commit()
    cursor.close()
    conn.close()


# Usage
truncate_all_tables("your_database_name", "your_username", "your_password")
