from fastapi import FastAPI, HTTPException
from db import get_db_connection
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Welcome to the Contact Book API!"}

app = FastAPI()

@app.post("/contacts/")
def create_contact(fullname: str, email: str, phone: str, group_id: int = None):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("""
            INSERT INTO Contacts (FullName, Email, Phone, GroupID)
            VALUES (%s, %s, %s, %s)
        """, (fullname, email, phone, group_id))
        conn.commit()
        return {"message": "Contact created"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@app.get("/contacts/")
def get_contacts():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Contacts")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

@app.put("/contacts/{contact_id}")
def update_contact(contact_id: int, fullname: str, email: str, phone: str):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        UPDATE Contacts
        SET FullName = %s, Email = %s, Phone = %s
        WHERE ContactID = %s
    """, (fullname, email, phone, contact_id))
    conn.commit()
    cursor.close()
    conn.close()
    return {"message": "Contact updated"}

@app.delete("/contacts/{contact_id}")
def delete_contact(contact_id: int):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Contacts WHERE ContactID = %s", (contact_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return {"message": "Contact deleted"}
