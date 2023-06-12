<h2>Bienvenue sur notre site</h2>

<?php
$fl = new FilmBD($cnx);
$film = $fl->getAllFilms();
$nbr = count($film);
?>

<div id="carouselExampleDark" class="carousel dark slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <?php
        for($i=0;$i<3;$i++){
        ?>
        <div class="carousel-item active" data-bs-interval="10000">
            <img src="./admin/images/<?php print $film[$i]->image_film;?>" class="d-block mx-auto w-100" alt="<?php print $film[$i]->nom_film;?>">
            <div class="carousel-caption d-none d-md-block">
                <h5>Avengers 4 sors enfin !</h5>
                <p id="desc"><?php print $film[$i]->description;?></p>
            </div>
        </div>
        <?php
        }
        ?>

    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

