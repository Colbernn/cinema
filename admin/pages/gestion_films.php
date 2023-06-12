<h2>Gestion des Films</h2>

<?php
$fl = new FilmBD($cnx);
$film = $fl->getAllFilms();
$nbr = count($film);


?>
<button type="button" id="ajout"  class="btn btn-info">Ajout</button>
<?php
for ($i = 0; $i < $nbr; $i++){

?>

<div class="card mb-3" style="max-width: 540px;">
    <div class="row g-0">
        <div class="col-md-4">
            <img src="./images/<?php print $film[$i]->image_film;?>" id="imgFilm" class="img-fluid rounded-start" alt="<?php print $film[$i]->nom_film; ?>">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h4 class="card-title" id="idTest"><?php print $film[$i]->id_film; ?></h4>
                <h5 class="card-title" id="titre"><?php print $film[$i]->nom_film; ?></h5>
                <h6 class="card-title" id="real"><?php print $film[$i]->realisateur; ?></h6>
                <h7 class="card-title" id="duree"><?php print $film[$i]->duree; ?></h7>
                <p class="card-text" id="description1"><?php print $film[$i]->description; ?></p>
                <button type="button" id="modifier" data-id="<?php echo $film[$i]->id_film; ?>" class="btn btn-warning">Modifier</button>
                <button type="button" id="supprimer"  data-id="<?php echo $film[$i]->id_film; ?>" class="btn btn-danger">Supprimer</button>
            </div>
        </div>
    </div>
</div>
    <?php
}
?>

<div class="modal" id="test" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" id="close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Formulaire pour la modification des données du film -->
                <form id="editFilmModal">
                    <div class="form-group">
                        <label for="id_film">id</label>
                        <input type="text" class="form-control" id="id_film" name="title" readonly="readonly" required>
                    </div>
                    <div class="form-group">
                        <label for="title">Titre</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="director">Réalisateur</label>
                        <input type="text" class="form-control" id="director" name="director" required>
                    </div>
                    <div class="form-group">
                        <label for="duration">Durée</label>
                        <input type="text" class="form-control" id="duration" name="duration" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="genre">Genre</label>
                        <input type="number" class="form-control" id="genre" name="genre" rows="3" required>
                    </div>

                    <div class="form-group">
                        <label for="image_film">Lien de l'image</label>
                        <input type="text" class="form-control" id="image_film" name="image_film" required>
                    </div>
                    <input type="hidden" id="film_id" name="film_id">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="annuler" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" id="save" class="btn btn-primary">Sauvegarder</button>
                <button type="button" id="ajouter" class="btn btn-primary">Ajouter</button>
            </div>
        </div>
    </div>
</div>

