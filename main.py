import config as cfg
from classes import *


def main():
    db = Database(
        cfg.mysql['user'], 
        cfg.mysql['password'],
        cfg.mysql['host'],
        cfg.mysql['use_unicode'],
        True)

    dg = DataGenerator('fr')

    if db.does_6db_exist() is False :
        db.create_database("script.sql", ";")

    if 0 == 1:
        db.csv_to_table("stock.csv", "6db.stock")
        db.csv_to_table("produits.csv", "6db.produit")
        dg.generate_csv("employes.csv")
        db.csv_to_table("employes.csv", "6db.employe")
        
    #table suivante : La table employé. 5 éléments, champs : id_employe, civilite, nom, prenom, fonction, latitude, longitude, commande_en_traitement (laisser null)

    #Cette fois-ci, il va falloir créer le csv avec des données aléatoirement générées

    
    

    # print(mimesis.datetime.datetime(),
    # mimesis.datetime.formatted_datetime(start=2018, end=2019))


if __name__ == "__main__":
    main()