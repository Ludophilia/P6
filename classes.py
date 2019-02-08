import mysql.connector

class Database: 

    def __init__(self, user, password, host, use_unicode, verbosity): 

        self.connection = mysql.connector.connect(
            user = user,
            password = password,
            host = host, 
            use_unicode = use_unicode) 
          
        self.cursor = self.connection.cursor()
        self.verbose = verbosity


    def create_database(self, sql_file, sep): 
        with open(sql_file) as f: 
            for statement in f.read().split(sep): 
                self.cursor.execute(statement) 

    def add_to_table(self, table_name, values): 
        
        extra_statement = {
        "5db.Category": " (name) VALUES (%s)", 
        "5db.Nutriscore": " (grade) VALUES (%s)",
        "5db.Product": " (name, description, quantity, url, category, retailer, nutriscore) VALUES (%(product_name)s, %(ingredients_text)s, %(quantity)s, %(url)s, %(categories)s, %(stores)s, %(nutrition_grade_fr)s)",
        "5db.Research": " (product_id, substitute_id) VALUES (%s, %s)"} 
        
        addtotable_statement = ("INSERT INTO " + table_name + extra_statement[table_name]) 

        try: 
            self.cursor.execute(addtotable_statement, values)
            self.connection.commit()

        except mysql.connector.errors.IntegrityError:
            if self.verbose == True:
                print("WARNING: Element déjà enregistré dans {} !".format(table_name))

            if table_name == "5db.Research": 
                self.research_duplicate = True

    def close_cursor(self): 
        return self.cursor.close()