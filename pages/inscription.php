<?php
?>
<h2 class="titre">Formulaire</h2>
<form action="<?php print $_SERVER['PHP_SELF'];?>" method="get" enctype="multipart/form-data">
    <div>
        <label class="question"  for="nom">Nom :</label>
        <input type="text" name="nom" id="nom">
        <?php
        if(isset($erreur1)){
            print $erreur1;
        }
        ?>
    </div>
    <div>
        <label class="question" for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom">
    </div>
    <div>
        <label class="question" for="email">Email :</label>
        <input type="email" id="email" name="email">
        <?php
        if(isset($erreur2)){
            print $erreur2;
        }
        ?>
    </div>
    <div>
        <label class="question" for="mdp">Mot de Passe :</label>
        <input type="password" id="mdp" name="mdp">
        <div id="emailHelp" class="form-text">Ne partagez votre mot de passe avec personne !</div>
        <?php
        if(isset($erreur3)){
            print $erreur3;
        }
        ?>
    </div>
    <div>
        <label class="question" for="age">Age :</label>
        <input type="number" id="age" name="age" min="12" max="120">
    </div>



    <div>
        <label class="question" for="pdp">Veuillez sélectionner une photo de profil pour votre compte :</label>
        <input type="file" name="pdp">
    </div>
    <input type="submit" name="submit_form" id="submit_inscription" class="btn btn-primary" value="Envoyer"/>
    &nbsp;&nbsp;
    <input type="reset" id="reset" class="btn btn-primary"/>
</form>