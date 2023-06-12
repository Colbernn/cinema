<?php
class UtilisateursBD extends Utilisateurs
{
    private $_db;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }
    public function addUtilisateur($nom,$prenom,$age,$mail,$image_utilisateur, $mdp){
        try {
            $query = "INSERT INTO utilisateurs (nom, prenom, age,mail,image_utilisateur, mdp_utilisateur) VALUES (:nom, :prenom, :age, :mail,:image_utilisateur,:mdp_utilisateur)";
            $res = $this->_db->prepare($query);
            $res->bindValue(':nom', $nom);
            $res->bindValue(':prenom', $prenom);
            $res->bindValue(':age', $age);
            $res->bindValue(':mail', $mail);
            $res->bindValue(':image_utilisateur', $image_utilisateur);
            $res->bindValue(':mdp_utilisateur', $mdp);
            $res->execute();

        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }


}