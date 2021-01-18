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
	         	<a href="<%=request.getContextPath() %>#">Enchères</a>
			 	<a href="<%=request.getContextPath() %>/VendreUnArticle">Vendre un article</a>
	       	 	<a href="${pageContext.request.contextPath}/Profil?id=${sessionScope.sessionUtilisateur.noUtilisateur}">Mon profil</a>
			 	<a href="<%=request.getContextPath() %>/Connexion">Déconnexion</a> 
	         </div>
        </div>
        <p>Bonjour ${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</p>
        <p>Crédit disponible : ${sessionScope.sessionUtilisateur.credit }</p>
	    <h4 style="text-align: center">Nouvelle vente</h4>
    	<form id="contact-form" role="form" action="VendreUnArticle" method="post">
			<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<label for="article">Article : </label>
					<input type="text" id="article" name="article" class="form-control"/>
	       		</div>
	       	</div>
	       	<br>
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-sm-6">
	       			<label for="article">Catégorie : </label>
		        	<select name="idCat" id="idCat" value="1" class="form-select" aria-label="Default select example">
				        <option value="0">Toutes</option>
				       	<c:forEach var="cat" items="${listeCategories}">
					        <c:set var="idCat" value="${cat.idCategorie }"/>
							<option value ="<c:out value="${cat.idCategorie}" />">${cat.libelle}</option>
						</c:forEach>
			        </select>
             	</div>
             </div>
             <br>
             <div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
	       			<label for="article">Description : </label>
	       		</div>
	       		<div class="row" style="justify-content: center;">
	       			<div class="col-md-6">
	       				<textarea  cols="50" rows="2">
	       				</textarea>
			  		</div>  
	   		    </div>
        	</div>
        	<br>
            <div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
	       			<label for="article">Photo de l'article : </label>
					<a href="<%=request.getContextPath() %>"><input type="submit" value="Telecharger" style="margin-left: 20px" class="btn btn-outline-primary btn-lg" style="margin-top: 20px; margin-right: 35%"/></a>
	       		</div>
	       	</div>
	       	<br>
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<label for="miseAPrix">Prix initial : </label>
					<input class="form-control" type="number" id="miseAPrix" name="miseAPrix" required/>
	       		</div>
	       	</div>
	       	<br>	
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<label for="dateDebutEnchere">Début de l'enchère</label>
					<input class="form-control" type="date" id="dateDebutEnchere" name="dateDebutEnchere" required/>	
	       		</div>
	       	</div>	
	       	 <br>
	     	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<label for="dateFinEnchere">Fin de l'enchère</label>
					<input class="form-control" type="date" id="dateFinEnchere" name="dateFinEnchere" required/>	
	       		</div>
	       	</div>	
	       	<br>
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<fieldset>
					<legend>Retrait : </legend>
					<label for="rue">Rue</label>
					<input class="form-control" type="text" id="text" name="rue" value="<c:out value="${sessionScope.sessionUtilisateur.rue}"/>" />
					<br/>
					<label for="codePostal">Code Postal</label>
					<input class="form-control" type="text" id="codePostal" name="codePostal" value="<c:out value="${sessionScope.sessionUtilisateur.codePostal }"/>"/>
					<br/>
					<label for="ville">Ville</label>
					<input class="form-control" type="text" id="ville" name="ville" value="<c:out value="${sessionScope.sessionUtilisateur.ville }"/>"/>
					<br/>
					</fieldset>		
	       		</div>
	       	</div>	
	     	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<input type="submit" value="Enregistrer" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;"/>
					<a href="Annuler"><input type="button" value="Annuler" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;margin-left: 15px"/></a>	
	       		</div>
	       	</div>	
    	</form>
    	
    	<footer>
			<div class="barblanc"><img id="logo-eni" src="./images/logo-eni.png" alt="photo ici"></div>
			<div class="barbleu"><p class="nous">Réalisé par Sebastien et Lorris</p></div>
		</footer>
		
    </div>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
 
</body>
</html>

