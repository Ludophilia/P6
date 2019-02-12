import csv
import random
import mysql.connector
from mimesis import Generic
from mimesis.enums import *


class DataGenerator:

    def __init__(self, language):
        self.facility = Generic(language)

    def generate_csv(self, csv_file):
        
        with open(csv_file,'w') as csvfile:
            csv_writer = csv.writer(csvfile)
            gender = [['Madame',Gender.FEMALE], ['Monsieur',Gender.MALE]]

            if csv_file == "csv/employes.csv":
                
                occupation = ["Livreur", "Preparateur de Commande"]
                
                for _ in range(10) :
                    lucky_number = random.randint(0,1)
                    csv_writer.writerow([gender[lucky_number][0],
                        self.facility.person.last_name(),
                        self.facility.person.name(gender=gender[lucky_number][1]),
                        occupation[random.randint(0,1)],
                        self.facility.address.latitude(),
                        self.facility.address.longitude()
                        ])

            if csv_file == "csv/clients.csv":
                
                password_length = random.randint(8, 48)
                tel = ["06", "07"]
                
                for _ in range(10):
                    lucky_number = random.randint(0,1)
                    csv_writer.writerow([gender[lucky_number][0],
                        self.facility.person.last_name(),
                        self.facility.person.name(gender=gender[lucky_number][1]),
                        self.facility.person.email(domains=["@outlook.fr", "@laposte.net", "@gmail.com", "@hotmail.fr", "@orange.fr", "@yahoo.fr", "@openclassrooms.com"]),
                        self.facility.person.telephone(mask=tel[lucky_number]+'########', placeholder='#'),
                        self.facility.person.password(length=password_length, hashed=True)
                        ])

            if csv_file == "csv/adresses.csv":

                for _ in range(20) :
                     csv_writer.writerow([
                        self.facility.address.street_number(maximum=200),
                        self.facility.address.street_suffix()+" "+self.facility.address.street_name(),
                        self.facility.address.postal_code()
                        ])


class DatabaseManager: 

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
        "6db.employe" : " (civilite, nom, prenom, fonction, latitude, longitude) VALUES (%s, %s, %s, %s, %s, %s)",
        "6db.client" : " (civilite, nom, prenom, adresse_mail, numero_telephone, mot_de_passe) VALUES (%s, %s, %s, %s, %s, %s)",
        "6db.adresse" : " (numero_voie, nom_voie, code_postal) VALUES (%s, %s, %s)",
        "6db.composition_produit" : " (id_produit, id_ingredient) VALUES (%s, %s)",
        "6db.recette" : " (reference_produit, recette) VALUES (%s, %s)",
        "6db.choix_client_livraison" : " (id_client, id_adresse, option_livraison, paiement_livraison) VALUES (%s, %s, %s, %s)",
        "6db.pizzeria" : " (nom_pizzeria, id_adresse) VALUES (%s, %s)",
        "6db.facture" : " (chemin_facture) VALUES (%s)",
        "6db.commande" : " (ref_client, montant, date_creation, choix_livraison, id_facture, id_pizzeria) VALUES (%s, %s, %s, %s, %s, %s)",
        "6db.contenu_commande" : " (id_commande, id_produit, quantite_produit) VALUES (%s, %s, %s)",
        "6db.etat_preparation" : " (ref_commande,etat_preparation, date) VALUES (%s, %s, %s)",
        "6db.etat_paiement" : " (ref_commande,etat_paiement, date) VALUES (%s, %s, %s)",
        "6db.media" : " (nom, type_media, chemin_media) VALUES (%s, %s, %s)",
        "6db.illustration_produit" : " (ref_produit, ref_media) VALUES (%s, %s)",
        "6db.illustration_recette" : " (ref_recette, ref_media) VALUES (%s, %s)"}  
        
        addtotable_statement = ("INSERT INTO " + table_name + tail_statement[table_name]) 

        try: 
            self.cursor.execute(addtotable_statement, values)
            self.connection.commit()

        except mysql.connector.errors.IntegrityError:
            if self.verbose == True:
                print("WARNING: Element déjà enregistré dans {} !".format(table_name))

    def close_cursor(self): 
        return self.cursor.close()