<?php
header('Content-Type: application/json');

require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Film.class.php';
require '../classes/FilmBD.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$fl = new FilmBD($cnx);
$nom_film = $_GET['nom_film'];
$realisateur = $_GET['realisateur'];
$duree = $_GET['duree'];
$description = $_GET['description'];
$image_film = $_GET['image_film'];
$id_genre = $_GET['id_genre'];
$data[] = $fl->addFilm($nom_film, $realisateur, $duree, $description, $image_film, $id_genre);
print json_encode($data);
?>