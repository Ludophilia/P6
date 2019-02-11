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

    if db.does_6db_exist() is False : #Iterer sur la liste des csv et des tables en faisant un appel à 
        db.create_database("script.sql", ";")
        db.csv_to_table("csv/stock.csv", "6db.stock")
        db.csv_to_table("csv/produits.csv", "6db.produit")
        dg.generate_csv("csv/employes.csv")
        db.csv_to_table("csv/employes.csv", "6db.employe")
        dg.generate_csv("csv/clients.csv")
        db.csv_to_table("csv/clients.csv", "6db.client")
        dg.generate_csv("csv/adresses.csv")
        db.csv_to_table("csv/adresses.csv", "6db.adresse")
        db.csv_to_table("csv/composition_produits.csv", "6db.composition_produit")
        db.csv_to_table("csv/recettes.csv", "6db.recette")

        
    #table suivante : La table choix_client_livraison. Champs : id_choix_livraison, id_client, id_adresse, option_livraison, paiement_livraison | 

    db.csv_to_table("csv/choix_client_livraison.csv", "6db.choix_client_livraison")
    
    # print(mimesis.datetime.datetime(),
    # mimesis.datetime.formatted_datetime(start=2018, end=2019))


if __name__ == "__main__":
    main()