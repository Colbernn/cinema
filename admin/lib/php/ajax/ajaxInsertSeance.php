<?php
header('Content-Type: application/json');
require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Seance.class.php';
require '../classes/SeanceBD.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

try{
    $fl = new SeanceBD($cnx);
    $date_seance = $_GET['date_seance'];
    $heure_seance = $_GET['heure_seance'];
    $id_film = $_GET['id_film'];
    $id_salle = $_GET['id_salle'];
    $data[] = $fl->addSeance($date_seance,$heure_seance, $id_film , $id_salle);
    print json_encode($data);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
?>