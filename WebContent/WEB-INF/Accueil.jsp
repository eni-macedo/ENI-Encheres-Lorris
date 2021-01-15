<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/style.css">

   				 <title>ENI-Encheres Accueil</title>
  </head>

  
  <body> 	
    <div class="container" style="margin-top: 20px">
        <div class="row">
             <div class="col-sm-8"> 
                <a href="<%=request.getContextPath() %>/" style="text-decoration: none; color: blue; font-size: 40px; font-weight: bold;">ENI-Enchères</a>
                <img src="images/logo-eni-encheres.png" alt="photo ici">
            </div> 
            <div class="col-sm-4" style="margin-top: 20px; margin-bottom: 20px"> 
                <a href="<%=request.getContextPath() %>/Ajout">Créer un compte -</a>
				<a href="<%=request.getContextPath() %>/Connexion">Se connecter</a> 
            </div>
        </div>
    </div>         
    <div class="col-sm-12">
        <h2 style="text-align: center;">Liste des enchères</h2>          
    </div>
    <div class="container">
        <div class="row">
          <h4 id="filtre">Filtres :</h4>  
          <div class="col-6">
              <div id="input" class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">?</span>
                <input type="text" class="form-control" placeholder="Le nom de l'article contient" aria-label="Username" aria-describedby="basic-addon1">
              </div>
           	  <br>
              <div class="container">
                  <div class="row">
                      <div class="col-sm-6">
                        <h4>Catégorie:</h4>
                      </div>
                      <div class="col-sm-6">
                        <select class="form-select" aria-label="Default select example">
                            <option value="1">Toutes</option>
                            <option value="2">Informatique</option>
                            <option value="3">Ameublement</option>
                            <option value="4">Vêtement</option>
                            <option value="5">Sport et loisirs</option>
                          </select>
                      </div>
                  </div>
              </div>
          </div>
          <div class="col-sm-6">
            <button id="rechercher" type="button" class="btn btn-outline-primary btn-lg" style="margin-left: 120px; margin-top: 20px;">Rechercher</button>
          </div>
        </div>
      </div>
      <br>  
      <div class="container">
          <div class="row">
              <div class="col-sm-6">
                  <div id="box" class="d-flex p-2 bd-highlight" style="background-color: lightgray"><img src="#">Photo article</div>     
              </div>
              <div class="col-sm-6"> 
                  <div id="box" class="d-flex p-2 bd-highlight" style="background-color: lightgray"><img src="#">Photo article</div> 
              </div>
          </div>
      </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
  </body>
</html>
