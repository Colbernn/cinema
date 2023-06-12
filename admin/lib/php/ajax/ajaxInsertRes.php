<?php
header('Content-Type: application/json');

require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Reservation.class.php';
require '../classes/ReservationBD.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);
var_dump($_GET);
$fl = new ReservationBD($cnx);
$date_res = $_GET['date_res'];
$nbr_ticket = $_GET['nbr_ticket'];
$id_seance = $_GET['id_seance'];
$id_user = $_GET['id_user'];
$data[] = $fl->addReservation($date_res,$nbr_ticket, $id_seance , $id_user);
print json_encode($data);
?>
