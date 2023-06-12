<?php
require_once '../vendor/autoload.php';
require '../admin/lib/php/dbPgConnect.php';
require '../admin/lib/php/classes/Connexion.class.php';
require '../admin/lib/php/classes/Film.class.php';
require '../admin/lib/php/classes/FilmBD.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$fl = new FilmBD($cnx);
$film = $fl->getAllFilms();
$nbr = count($film);

$mpdf = new \Mpdf\Mpdf();

$mpdf->WriteHTML('<h1>Nos films</h1>');
$mpdf->SetXY(20,30);
for($i=0;$i<$nbr;$i++){

    $mpdf->WriteHTML('nom : '.$film[$i]->nom_film);
    $mpdf->WriteHTML('Realisteur : '.$film[$i]->realisateur);
    $mpdf->WriteHTML('Genre : '.$film[$i]->id_genre);
    $mpdf->WriteHTML('Durée : '.$film[$i]->duree);
    $mpdf->WriteHTML('Description : '.$film[$i]->description);
    $mpdf->WriteHTML('<br>');
}

$mpdf->Output();
