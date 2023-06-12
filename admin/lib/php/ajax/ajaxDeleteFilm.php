<?php
header('Content-Type: application/json');

require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Film.class.php';
require '../classes/FilmBD.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$fl = new FilmBD($cnx);
$data[] = $fl->deleteFilm($_GET['id_film']);
print json_encode($data);
?>
