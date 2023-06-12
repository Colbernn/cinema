<?php
header('Content-Type: application/json');

require '../dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Utilisateurs.class.php';
require '../classes/UtilisateursBD.class.php';
$cnx = Connexion::getInstance($dsn,$user,$password);

$fl = new UtilisateursBD($cnx);
$nom = $_GET['nom'];
$prenom = $_GET['prenom'];
$age = $_GET['age'];
$mail= $_GET['mail'];
$image_utilisateur=$_GET['image_utilisateur'];
$mdp= $_GET['mdp_utilisateur'];


$data[] = $fl->addUtilisateur($nom,$prenom,$age,$mail,$image_utilisateur, $mdp);
print json_encode($data);
?>