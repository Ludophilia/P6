from classes import *
import config as cfg
import faker
import mimesis


#J'aimerais créer la base de données p6 à partir du script

def main():
    db = Database(
        cfg.mysql['user'], 
        cfg.mysql['password'],
        cfg.mysql['host'],
        cfg.mysql['use_unicode'],
        True)

    # db.cursor.execute("SHOW databases")
    # a = db.cursor.fetchall()
    # print(a)
    
    db.create_database("script.sql", ";")

if __name__ == "__main__":
    main()