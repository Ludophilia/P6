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

    if db.does_6db_exist() is False : #Iterer sur la liste des csv et des tables en faisant un appel à ces méthodes
        db.create_database("script.sql", ";")

        dg.generate_csv("csv/employes.csv")
        dg.generate_csv("csv/clients.csv")

        db.csv_to_table("csv/stock.csv", "6db.stock")
        db.csv_to_table("csv/produits.csv", "6db.produit")
        db.csv_to_table("csv/employes.csv", "6db.employe")
        db.csv_to_table("csv/clients.csv", "6db.client")
        db.csv_to_table("csv/adresses.csv", "6db.adresse")
        db.csv_to_table("csv/composition_produits.csv", "6db.composition_produit")
        db.csv_to_table("csv/recettes.csv", "6db.recette")
        db.csv_to_table("csv/choix_client_livraison.csv", "6db.choix_client_livraison")
        db.csv_to_table("csv/pizzerias.csv", "6db.pizzeria")
        db.csv_to_table("csv/factures.csv", "6db.facture")
        db.csv_to_table("csv/commandes.csv", "6db.commande")
        db.csv_to_table("csv/contenu_commandes.csv", "6db.contenu_commande")
        db.csv_to_table("csv/etats_preparation.csv", "6db.etat_preparation")
        db.csv_to_table("csv/etats_paiement.csv", "6db.etat_paiement")
        db.csv_to_table("csv/medias.csv", "6db.media")
        db.csv_to_table("csv/illustrations_produit.csv", "6db.illustration_produit")
        db.csv_to_table("csv/illustrations_recette.csv", "6db.illustration_recette")

if __name__ == "__main__":
    main()