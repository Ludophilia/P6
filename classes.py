import mysql.connector
import csv

class Database: 

    def __init__(self, user, password, host, use_unicode, verbosity): 

        self.connection = mysql.connector.connect(
            user = user,
            password = password,
            host = host, 
            use_unicode = use_unicode) 
          
        self.cursor = self.connection.cursor()
        self.verbose = verbosity

    def does_6db_exist(self): 
        self.cursor.execute("show databases")
        result = self.cursor.fetchall()
        if ('6db',) in result:
            print ("Base de données déjà crée, étape suivante...")
        else:
            print ("Création de la base de données...")
        return ('6db',) in result 

    def create_database(self, sql_file, sep): 
        with open(sql_file) as f: 
            for statement in f.read().split(sep): 
                self.cursor.execute(statement) 

    def csv_to_table(self, csv_file, table_name):
        with open(csv_file) as f: 
            data = csv.reader(f, csv.QUOTE_NONE)
            for _ in data: 
                print(_)
                self.add_to_table(table_name, _)

    def add_to_table(self, table_name, values): 
        
        tail_statement = {
        "6db.stock": " (nom, categorie, quantite_restante) VALUES (%s, %s, %s)",
        "6db.produit" : " (nom, description, categorie, prix_ttc) VALUES (%s, %s, %s, %s)", 
    
        "5db.Product": " (name, description, quantity, url, category, retailer, nutriscore) VALUES (%(product_name)s, %(ingredients_text)s, %(quantity)s, %(url)s, %(categories)s, %(stores)s, %(nutrition_grade_fr)s)",
        "5db.Research": " (product_id, substitute_id) VALUES (%s, %s)"} 
        
        addtotable_statement = ("INSERT INTO " + table_name + tail_statement[table_name]) 

        try: 
            self.cursor.execute(addtotable_statement, values)
            self.connection.commit()

        except mysql.connector.errors.IntegrityError:
            if self.verbose == True:
                print("WARNING: Element déjà enregistré dans {} !".format(table_name))

    def close_cursor(self): 
        return self.cursor.close()