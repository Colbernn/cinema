<?php
header('Content-Type: application/json');
require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Film.class.php';
require '../classes/FilmBD.class.php';

$cnx = Connexion::getInstance($dsn,$user,$password);

try{

    $fl = new FilmBD($cnx);
    $id_film = $_GET['id_film'];
    $nom_film = $_GET['nom_film'];
    $realisateur = $_GET['realisateur'];
    $duree = $_GET['duree'];
    $description = $_GET['description'];
    $image_film = $_GET['image_film'];
    $id_genre = $_GET['id_genre'];
    $data[] = $fl->editFilm($id_film, $nom_film, $realisateur, $duree, $description, $image_film, $id_genre);

    print json_encode($data);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
?>
