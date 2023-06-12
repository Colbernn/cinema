<?php
$fl = new FilmBD($cnx);
$film = $fl->getAllFilms();
$nbr = count($film);
$sa = new FilmBD($cnx);
$salle = $sa->getAllSalles();
$nbr2 = count($salle);
?>
<form method="get" action="<?php print $_SERVER['PHP_SELF'];?>">
    <select name="choix_film" id="choix_film">
        <option value="">Par nom</option>
        <?php
        for($i=0;$i<$nbr;$i++){
            ?>
            <option value="<?php print $film[$i]->id_film;?>"><?php print $film[$i]->nom_film;?></option>
            <?php
        }
        ?>
    </select>&nbsp;&nbsp;
    <input type="submit" name="submit" id="submit" value="Description" class="btn btn-success">
</form>

<p>&nbsp;</p>
<div class="card mb-3" style="max-width: 540px;" id="description_film">
    <div class="row g-0">

        <div class="col-md-6">
            <div class="card-body">
                <form id="editFilmModal">
                    <div class="form-group">
                        <label for="date_seance">date de la seance</label>
                        <input type="text" class="form-control" id="date_seance" name="date_seance" required>
                    </div>
                    <div class="form-group">
                        <label for="heure_seance">Heure de la séance</label>
                        <input type="text" class="form-control" id="heure_seance" name="heure_seance" required>
                    </div>
                    <select name="choix_salle" id="choix_salle">
                        <option value="">Par nom</option>
                        <?php
                        for($i=0;$i<$nbr2;$i++){
                            ?>
                            <option value="<?php print $salle[$i]->id_salle;?>"><?php print $salle[$i]->type;?></option>
                            <?php
                        }
                        ?>
                    </select>&nbsp;&nbsp;
                    <input type="hidden" id="film_id" name="film_id">
                    <button type="button" id="envoyer" class="btn btn-primary">Créer</button>
                </form>
            </div>
        </div>
    </div>
</div>
