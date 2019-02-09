from classes import *
import config as cfg
import faker
import mimesis
import csv

def main():
    db = Database(
        cfg.mysql['user'], 
        cfg.mysql['password'],
        cfg.mysql['host'],
        cfg.mysql['use_unicode'],
        True)

    if db.does_6db_exist() is False :
        db.create_database("script.sql", ";")

    #Obj : Modifier le fichier de clases pour qu'on puisse faire des ajouts dans la table.

    db.csv_to_table("stock.csv", "6db.stock")
    db.csv_to_table("produits.csv", "6db.produit")

    #table suivante : La table employé. 5 éléments, champs : id_employe, civilite, nom, prenom, fonction, latitude, longitude, commande_en_traitement (laisser null)

    #Cette fois-ci, il va falloir créer le csv avec des données aléatoirement générées

if __name__ == "__main__":
    main()