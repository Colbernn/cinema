$(document).ready(function () {
    $('#desc_gestion_films').hide();
    $('#desc_gestion_seances').hide();
    $('.titre_film').mouseover(function () {
        $(this).css({
            'color': 'red',
            'font-weight': 'bold',
            'font-size':'20px'
        })
    });

    $('.titre_film').mouseout(function (){
            $(this).css({
                'color': 'initial',
                'font-weight': 'normal',
                'font-size':'initial'
            })
    });
    $('#titre_gestion_films').mouseover(function () {
        $('#desc_gestion_films').show();
    });
    $('#titre_gestion_seances').mouseover(function () {
        $('#desc_gestion_seances').show();
    });

    $('#submit_inscription').click(function(event) {
        event.preventDefault();

        let userNom = $('#nom').val();
        let userPrenom = $('#prenom').val();
        let userMDP = $('#mdp').val();
        let userAge = $('#age').val();
        let userMail = $('#email').val();
        let user_image = "image.jpg";
        let parametre = "nom=" + userNom + "&prenom=" + userPrenom + "&age=" + userAge + "&mail=" + userMail + "&image_utilisateur=" + user_image + "&mdp_utilisateur=" + userMDP;
        console.log(parametre);
        $.ajax({
            url: './admin/lib/php/ajax/ajaxInsertUser.php',
            type: 'GET',
            data: parametre,
            datatype:'json',
            success: function() {
                location.reload();
            }
        });
    });
    $('.btn-warning').click(function() {
        let filmId = $(this).data("id");

        parametre = "id_film=" + filmId;
        console.log(parametre);
        let retour = $.ajax({
            type: 'GET',
            data: parametre,
            datatype: 'json',
            url: './lib/php/ajax/ajaxRechercheFilm.php',
            success: function(filmData) {
                console.log(filmData);
                // Afficher les informations du film dans la fenêtre modale
                $('.modal-title').text(filmData[0].nom_film);
                $('#titre').val(filmData[0].nom_film);
                $('#id_film').val(filmData[0].id_film);
                console.log(filmData[0].nom_film);
                $('#real').val(filmData[0].realisateur);
                $('#duree').val(filmData[0].duree);
                $('#imgFilm').val(filmData[0].image_film);
                $('#title').val(filmData[0].nom_film);
                $('#director').val(filmData[0].realisateur);
                $('#genre').val(filmData[0].id_genre);
                $('#duration').val(filmData[0].duree);
                $('#description').val(filmData[0].description);
                console.log(filmData[0].description);
                $('#image_film').val(filmData[0].image_film);
            }


        });
        $('#test').show();
        $('#ajouter').hide();
    });

    $('#save').click(function(event) {
        event.preventDefault();


        let filmId = $('#id_film').val();
        let filmTitle = $('#title').val();
        let filmDirector = $('#director').val();
        let filmDuration = $('#duration').val();
        let filmDescription = $('#description').val();
        let filmGenre = $('#genre').val();
        let filmImage = $('#image_film').val();
        let parametre = "id_film=" + filmId + "&nom_film=" + filmTitle + "&realisateur=" + filmDirector + "&duree=" + filmDuration + "&description=" + filmDescription + "&image_film=" + filmImage + "&id_genre=" + filmGenre;
        console.log(parametre);
        $.ajax({
            url: './lib/php/ajax/ajaxEditFilm.php',
            type: 'GET',
            data: parametre,
            datatype:'json',
            success: function() {
               location.reload();
            }
        });
    });

    $('#ajout').click(function (){
        $('#test').show();
        $('#id_film').hide();
        $('#save').hide();
    });

    $('#ajouter').click(function(event) {
        event.preventDefault();

        let filmTitle = $('#title').val();
        let filmDirector = $('#director').val();
        let filmDuration = $('#duration').val();
        let filmDescription = $('#description').val();
        let filmImage = $('#image_film').val();
        let filmGenre = $('#genre').val();
        let parametre = "nom_film=" + filmTitle + "&realisateur=" + filmDirector + "&duree=" + filmDuration + "&description=" + filmDescription + "&image_film=" + filmImage + "&id_genre=" + filmGenre;
        console.log(parametre);
        $.ajax({
            url: './lib/php/ajax/ajaxInsertFilm.php',
            type: 'GET',
            data: parametre,
            datatype:'json',
            success: function() {
                location.reload();
            }
        });
    });

    $('#close').click(function(){
        $('#test').hide();
    });
    $('#annuler').click(function(){
        $('#test').hide();
    });

    $('.btn-danger').click(function (){
        console.log("hello");
        let filmId = $(this).data("id");
        let parametre = "id_film=" + filmId;
        console.log(filmId);
        let retour = $.ajax({
            type: 'GET',
            data: parametre,
            datatype: 'json',
            url: './lib/php/ajax/ajaxDeleteFilm.php',
            success: function() {
                location.reload();
            }
        });
    });

$('#submit').remove();
$('#description_film').hide();

$('#choix_film').change(function () {
    console.log("test");
    let name = $(this).attr('name');
    console.log("test");
    let id_film = $(this).val();
    console.log("name = " + name + " et id_film = " + id_film);
    let parametre = 'id_film=' + id_film;
    let retour = $.ajax({
        type: 'GET',
        data: parametre,
        datatype: 'json',
        url: './lib/php/ajax/ajaxRechercheFilm.php',
        success: function (data) {
            console.log(data);
            $('#description_film').show();
            $('#detail_film').html("Nom : " + data[0].nom_film + "<br>Description : " + data[0].description);
        }

    });
});

    $('#envoyer').click(function(event) {
        event.preventDefault();


        let date_seance = $('#date_seance').val();
        let heure_seance = $('#heure_seance').val();
        let id_film = $('#choix_film').val();
        let id_salle = $('#choix_salle').val();

        let parametre = "date_seance=" + date_seance + "&heure_seance=" + heure_seance + "&id_film=" + id_film + "&id_salle=" + id_salle;
        console.log(parametre);
        $.ajax({
            url: './lib/php/ajax/ajaxInsertSeance.php',
            type: 'GET',
            data: parametre,
            datatype:'json',
            success: function() {
                location.reload();
            }
        });
    });



    $('.btn-success').click(function(){
        $('#reservation').show();
        let seanceId = $(this).data("id");
        let dateSeance = $('.dateSeance').val();
        $('#seance_res').val(seanceId);
        $('#date_res').val(dateSeance);

    });

    $('#ad').click(function(event) {
        event.preventDefault();
        let resDate = $('#date_res').val();
        let resTicket = $('#nbr_ticket').val();
        let resSeance = $('#seance_res').val();
        let resUser = $('#user_res').val();
        let parametre = "date_res=" + resDate + "&nbr_ticket=" + resTicket + "&id_seance=" + resSeance + "&id_user=" + resUser;
        console.log(parametre);
        $.ajax({
            url: './admin/lib/php/ajax/ajaxInsertRes.php',
            type: 'GET',
            data: parametre,
            datatype:'json',
            success: function() {
                location.reload();
            }
        });
    });


    $('#fermer').click(function(){
        $('#reservation').hide();
    });
    $('#annul').click(function(){
        $('#date_res').val("");
        $('#nbr_ticket').val("");
        $('#seance_res').val("");
        $('#user_res').val("");
        $('#reservation').hide();
    });
});

