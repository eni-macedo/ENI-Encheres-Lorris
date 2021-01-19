<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Pour récupérer le fichier css  -->
	<style><%@include file="../../styleCss/style.css"%></style> 
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styleCss/style.css" /> --%> 

    					<title>ENI-Enchères Session</title>
  </head>
  <body> 
    <div class="container">
        <div class="row">
             <div class="col-sm-6">
                <a href="<%=request.getContextPath() %>/AccueilSession"><img id="logo-encheres" src="./images/logo-eni-encheres.png" alt="photo ici"></a>
           	 </div> 
	     	 <div class="col-sm-6" style="margin-top: 20px; margin-bottom: 20px"> 
            	<a href="Encheres">Enchères</a>
            	<a href="${pageContext.request.contextPath}/Profil?id=${sessionScope.sessionUtilisateur.noUtilisateur}">Mon profil</a>
               	<a href="VendreUnArticle">Vendre un article</a>
               	<a href="Connexion">Se déconnecter</a>
	         </div>
        </div>
        <p>Bonjour ${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</p>
       	<p>Crédit disponible : ${sessionScope.sessionUtilisateur.credit }</p>
		<h2 style="text-align: center;">Liste des enchères</h2>
		<form action="triSession" method ="post">
        <div class="row">
          <h4 id="filtre">Filtres :</h4>  
          <div class="col-6">
              <div id="input" class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">?</span>
                <input type="text" id="filtre" name = "filtre" class="form-control" placeholder="Le nom de l'article contient" aria-label="Username" aria-describedby="basic-addon1">
              </div>
        	  <br>
              <div class="row">
                 <div class="col-sm-6">
                   <h4>Catégorie:</h4>
                 </div>
                 <div class="col-sm-6">
                    <select name="idCat" id="idCat" value="1" class="form-select" aria-label="Default select example">
                       <option value="0">Toutes</option>
                       <c:forEach var="cat" items="${listeCategories}">
                       <c:set var="idCat" value="${cat.idCategorie }"/>
				  	   <option value ="<c:out value="${cat.idCategorie}" />">${cat.libelle}</option>
					   </c:forEach>
                    </select>
                 </div>
              </div>
   		  </div>
          <div class="col-sm-6">
	          <button id="rechercher" type="submit" value="Rechercher" name="rechercher" class="btn btn-outline-primary btn-lg" style="margin-left: 120px; margin-top: 20px;">Rechercher</button>
          </div>
        </div>
	    <div class="container">  
	    	<div class="row">
				<div class="col-sm-3" style="margin-top: 20px;margin-left: 25px">
					<label for="achats">Achats</label>
					<input type="radio" id="achats" value="encheres" name="liste" checked>
					<br>
					<label for="enchereOuverte">Encheres ouvertes</label> 
					<input type="radio" style="margin-left: 30px" id="enchereOuverte"  name="achatEnchere" value="ouverte" checked>
					<br>
					<label for="enchereEnCours">Encheres en cours</label>                        
					<input type="radio" style="margin-left: 30px" id="enchereEnCours" name="achatEnchere" value="enchereEnCours">
					<br>
					<label for="enchereRemporte">Encheres remportées</label>
					<input type="radio" style="margin-left: 30px" id="enchereOuverte" name="achatEnchere" value="remportees">
				</div>
				<br>
				<div class="col-sm-4" style="margin-top: 20px;margin-left: 20px">
					<label for="ventes">Ventes</label>
					<input type="radio" id="ventes" value="ventes" name="liste" >
					<br>
					<label for="venteEnCours">Ventes en cours</label>
					<input type="radio" style="margin-left: 30px" id="ventesEnCours" name="achatEnchere" value="ventesEnCours">
					<br>
					<label for="ventesNonDebutees">Ventes non débutées</label>
					<input type="radio" style="margin-left: 30px" id="ventesNonDebutees" name="achatEnchere" value="nonDebutees">
					<br>
					<label for="ventesTerminées">Ventes terminées</label>
					<input type="radio" style="margin-left: 30px"id="ventesTerminees" name="achatEnchere" value="terminees">
				</div>
			</div>
		</div>
	</form>
    <br>
    	
    	<p style="text-align: center;"> Il y a ${listeArticles.size()} objets en vente</p>
    
        <div class="col-md-6">
          	<c:set var="i" value="${1}"/>
			<c:forEach var="art" items="${listeArticles}"  >
		 <!-- JSTL qui permet dans le même affichage d'afficher plusieurs versions différentes des boutons et fonctionnalités -->   
		<%--quand bouton achats selectionné renvoie sur feuille enchere.jsp  --%>
			<c:if test="${valeurBouton eq 'encheres' }">
				<a href="ActionArticle?id=${art.idArticle}"><h2>${art.nomArticle}</h2> </a>
			</c:if>
		<%--quand bouton ventes selectionne renvoie sur feuille nouvelleVenteJsp --%>
			<c:if test="${valeurBouton eq 'ventes' }">
				<a href="Consultation?id=${art.idArticle}"><h2>${art.nomArticle}</h2> </a>
			</c:if>
		<%--<a href="ActionArticle?id=${art.idArticle}"><h2>${art.nomArticle}</h2> </a> --%>
			<p>Prix : ${art.prixVente} points</p>
			<p>Fin de l'enchère : ${art.dateFinEnchere}</p>
			<p>idUser Article : ${art.idUser }</p> 
		
			<c:set var="idUser" value="${art.idUser}"/>
		<!-- boucle qui permet de récupere le pseudo du vendeur de l'objet -->
			<c:forEach var="id" items="${listeIdPseudo}">
					<c:if test="${art.idUser == id.noUtilisateur}">
						<c:set var="pseudo" value="${id.pseudo }"/>
					</c:if>
			</c:forEach>
		<p> Vendeur : <a href="ProfilUser?id=${art.idUser}">${pseudo}</a></p>
		<br/>
		<c:set var="i" value="${i +1 }"/>
		</c:forEach>
        </div>
    	
		<footer>
			<div class="barblanc"><img id="logo-eni" src="./images/logo-eni.png" alt="photo ici"></div>
			<div class="barbleu"><p class="nous">Réalisé par Sebastien et Lorris</p></div>
		</footer>
		
	</div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

  </body>
</html>
