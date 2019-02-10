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

    if "p" == "np":
        db.csv_to_table("csv/stock.csv", "6db.stock")
        db.csv_to_table("csv/produits.csv", "6db.produit")
        dg.generate_csv("csv/employes.csv")
        db.csv_to_table("csv/employes.csv", "6db.employe")
        dg.generate_csv("csv/clients.csv")
        db.csv_to_table("csv/clients.csv", "6db.client")
        dg.generate_csv("csv/adresses.csv")
        db.csv_to_table("csv/adresses.csv", "6db.adresse")
        
    #table suivante : La table composition_produit. Champs : | On la fait à la main celle là.

    

    # print(mimesis.datetime.datetime(),
    # mimesis.datetime.formatted_datetime(start=2018, end=2019))


if __name__ == "__main__":
    main()