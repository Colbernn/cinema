<?php
$fl = new FilmBD($cnx); //$cnx est fourni par l'index
$film = $fl->getVueAllFilms();

$nbr = count($film);
?>

    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col"></th>
            <th scope="col">Titre</th>
            <th scope="col">Realisateur</th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <?php

        for ($i = 0; $i < $nbr; $i++) {
            ?>

            <tr id="<?php print $film[$i]->id_film;?>">
                <th scope="row"><?php print $film[$i]->id_film; ?></th>
                <td  id="<?php print $film[$i]->id_film; ?>"
                    name="image_film"><img src="./admin/images/<?php print $film[$i]->image_film; ?>" class="img-fluid img-film" alt="<?php print $film[$i]->image_film; ?>"></td>
                <td  id="<?php print $film[$i]->id_film; ?>" class="titre_film"
                    name="nom_film"><?php print $film[$i]->nom_film; ?></td>
                <td  id="<?php print $film[$i]->id_film; ?>"
                    name="realisateur"><?php print $film[$i]->realisateur; ?></td>
                <td  id="<?php print $film[$i]->id_film; ?>"
                     name="date"><?php print $film[$i]->date_seance; ?></td>
                <td id="<?php print $film[$i]->id_film; ?>"
                    name="seances"><button data-id="<?php echo $film[$i]->id_seance; ?>" class="btn btn-success"><?php print $film[$i]->heure_seance; ?></button></td>


            </tr>
            <?php

        }
        ?>

        </tbody>
    </table>

<div class="modal" id="reservation" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" id="fermer" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Formulaire pour la modification des données du film -->
                <form id="editFilmModal">
                    <div class="form-group">
                        <label for="date_res">Date</label>
                        <input type="text" class="form-control" id="date_res" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="seance_res">Seance</label>
                        <input type="text" class="form-control" id="seance_res" name="seance_res" required>
                    </div>
                    <div class="form-group">
                        <label for="nbr_ticket">Nombre Tickets</label>
                        <input type="number" class="form-control" id="nbr_ticket" name="nbr_ticket" required>
                    </div>
                    <div class="form-group">
                        <label for="id_user">Client</label>
                        <input type="number" class="form-control" id="user_res" name="id_user" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="annul" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" id="ad" class="btn btn-primary">Ajouter</button>
            </div>
        </div>
    </div>
</div>