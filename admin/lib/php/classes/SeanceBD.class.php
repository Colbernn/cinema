<?php

class SeanceBD extends Seance
{
    private $_db;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }

    public function addSeance($date_seance,$heure_seance, $id_film , $id_salle)
    {
        try {
            var_dump($date_seance,$heure_seance, $id_film , $id_salle);
            $query = "INSERT INTO seances (date_seance, heure_seance, id_film, id_salle) VALUES (:date_seance, :heure_seance, :id_film, :id_salle)";
            $res = $this->_db->prepare($query);
            $res->bindValue(':date_seance', $date_seance);
            $res->bindValue(':heure_seance', $heure_seance);
            $res->bindValue(':id_film', $id_film);
            $res->bindValue(':id_salle', $id_salle);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function deleteSeance($id)
    {
        try {
            $query = "delete from seances where id_seance = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }


}
?>
