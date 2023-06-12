<?php

class FilmBD extends Film
{
    private $_db;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }

    public function editFilm($id_film, $nom_film, $realisateur, $duree, $description, $image_film, $id_genre)
    {
        try {
            $query = "UPDATE films SET nom_film = :nom, realisateur = :realisateur, duree = :duree, description = :description, image_film = :image, id_genre = :genre WHERE id_film = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':nom', $nom_film);
            $res->bindValue(':realisateur', $realisateur);
            $res->bindValue(':duree', $duree);
            $res->bindValue(':description', $description);
            $res->bindValue(':image', $image_film);
            $res->bindValue(':id', $id_film);
            $res->bindValue(':genre', $id_genre);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function addFilm($nom_film, $realisateur, $duree, $description, $image_film, $id_genre){
        try {
            $query = "INSERT INTO films (nom_film, realisateur, duree, description, image_film, id_genre) VALUES (:nom, :realisateur, :duree, :description, :image, :genre)";
            $res = $this->_db->prepare($query);
            $res->bindValue(':nom', $nom_film);
            $res->bindValue(':realisateur', $realisateur);
            $res->bindValue(':duree', $duree);
            $res->bindValue(':description', $description);
            $res->bindValue(':image', $image_film);
            $res->bindValue(':genre', $id_genre);
            $res->execute();
            //print "query : ".$query;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function deleteFilm($id)
    {
        try {
            $query = "delete from films where id_film = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function getFilmById($id)
    {
        try {
            $query = "select * from films where id_film = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id);
            $res->execute();
            $data = $res->fetch();
            return $data;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

    public function getVueAllFilms()
    {
        try {
            $query = "select * from vue_films_seances_genres order by nom_film";
            $res = $this->_db->prepare($query);
            $res->execute();

            while ($data = $res->fetch()) {
                $_array[] = new Film($data);
            }
            //var_dump($_array);
            if (!empty($_array)) {
                return $_array;
            } else {
                return null;
            }


        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }
    public function getAllFilms()
    {
        try {
            $query = "select * from films order by nom_film";
            $res = $this->_db->prepare($query);
            $res->execute();

            while ($data = $res->fetch()) {
                $_array[] = new Film($data);
            }
            //var_dump($_array);
            if (!empty($_array)) {
                return $_array;
            } else {
                return null;
            }


        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }
    public function getAllSalles()
    {
        try {
            $query = "select * from salles order by id_salle";
            $res = $this->_db->prepare($query);
            $res->execute();

            while ($data = $res->fetch()) {
                $_array[] = new Film($data);
            }
            //var_dump($_array);
            if (!empty($_array)) {
                return $_array;
            } else {
                return null;
            }


        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
        }
    }

}
