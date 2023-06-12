<?php

class ReservationBD extends Reservation
{
    private $_db;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }

    public function addReservation($date_res,$nbr_ticket, $id_seance , $id_user)
    {
        try {
            $prix=$nbr_ticket*10;
            $query = "INSERT INTO reservations (date_res, nbr_ticket, prix_total, id_seance, id_user) VALUES (:date_rese, :nbr_ticket,:prix_total, :id_seance, :id_user)";
            $res = $this->_db->prepare($query);
            $res->bindValue(':date_rese', $date_res);
            $res->bindValue(':nbr_ticket', $nbr_ticket);
            $res->bindValue(':id_seance', $id_seance);
            $res->bindValue(':id_user', $id_user);
            $res->bindValue(':prix_total', $prix);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }


}
?>
