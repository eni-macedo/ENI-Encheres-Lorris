<%@page import="java.util.List"%>
<%@page import="fr.eni.enchere.bo.Article"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
			 	<a href="Connexion">Déconnexion</a> 
	         </div>
        </div>
        <c:choose>
		<c:when test="${not empty articleAffichage.idArticle }">
			<h1>Détail vente en cours</h1>
		
		</c:when>
		<c:otherwise>
			<h1>Nouvelle vente</h1>
		</c:otherwise>	
			
	</c:choose>
	
	<!-- n'affiche rien, inclusion JAVA pour utiliser une fonction JAVA par la suite -->
	<%
	
			
		Article articleAffichage = new Article();
	articleAffichage = (Article) request.getAttribute("articleAffichage");

%>
        <p>Bonjour ${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</p>
        <p>Crédit disponible : ${sessionScope.sessionUtilisateur.credit }</p>
	    <h4 style="text-align: center">Nouvelle vente</h4>
    	<form id="contact-form" role="form" action="VendreUnArticle" method="post">
			<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<label for="article">Article : </label>
					<input type="text" id="article" name="article" class="form-control" value="<c:out value="${articleAffichage.nomArticle }"/>"/>
	       		</div>
	       	</div>
	       	<br>
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-sm-6">
	       			<label for="categorie">Catégorie : </label>
		        	<select id ="categorie" name="categorie" required>
					<!-- boucle sur la liste catégorie ds la BDD pour affichage des libellés -->
					<option value="<c:out value="${articleAffichage.idCategorie }"/>">--choisir une catégorie--</option>
		
					<c:forEach var="cat" items="${listeCategories}">
		
		
					<option value ="<c:out value="${cat.idCategorie}" />">${cat.libelle} </option>
		
					</c:forEach>
		
					</select>
				        
             	</div>
             </div>
             <br>
             <div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
	       			<label for="description">Description : </label>
	       			<input type="text-area" id="description" name="description" class="form-control" value="<c:out value="${articleAffichage.descriptionArticle }"/>"/>
	       		</div>
	       		
        	</div>
        	<br>
            <div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
	       			<label for="photo">Photo de l'article : </label>
					<a href="upload photo en attente"><input type="submit" value="Telecharger" style="margin-left: 20px" class="btn btn-outline-primary btn-lg" style="margin-top: 20px; margin-right: 35%"/></a>
	       		</div>
	       	</div>
	       	<br>
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
	       			<!-- JSTL qui affiche soit le prix de l'objet à modifier soit celui d'un article non modifiable -->
		       		<label for="miseAPrix">Prix initial : </label>
						<c:if test="${not empty articleAffichage.miseAPrix}">
						<input type="number" id="miseAPrix" name="miseAPrix" class="form-control" value="<%=Math.round(articleAffichage.getMiseAPrix())%>" required/>
						<br/>
						</c:if>
						
						<c:if test="${empty articleAffichage.miseAPrix}">
						<input type="number" id="miseAPrix" name="miseAPrix" class="form-control" value="<c:out value="${articleAffichage.miseAPrix }"/>" required/>
						<br/>
						</c:if>
					
	       		</div>
	       	</div>
	       	<br>	
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<label for="dateDebutEnchere">Début de l'enchère</label>
					<input type="date" id="dateDebutEnchere" name="dateDebutEnchere" class="form-control" value="<c:out value="${articleAffichage.dateDebutEnchere }"/>"  required/>	
	       		</div>
	       	</div>	
	       	 <br>
	     	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<label for="dateFinEnchere">Fin de l'enchère</label>
					<input type="date" id="dateFinEnchere" name="dateFinEnchere" class="form-control" value="<c:out value="${articleAffichage.dateFinEnchere }"/>" required/>	
	       		</div>
	       	</div>	
	       	<br>
	       	<!--  affiche dans l'encoart RETRAIT l'adresse de article enregistré si idArticle existe -->
			<!--  -->
	       	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		    <fieldset>
			<legend>Retrait</legend>
			<c:if test="${not empty articleAffichage.idArticle}">
				<label for="rue">Rue</label>
				<input type="text" id="text" name="rue" class="form-control" value="<c:out value="${articleAffichage.retrait.rue}"/>" />
				<br/>
				<label for="codePostal">Code Postal</label>
				<input type="text" id="codePostal" name="codePostal" class="form-control" value="<c:out value="${articleAffichage.retrait.codePostal }"/>"/>
				<br/>
				<label for="ville">Ville</label>
				<input type="text" id="ville" name="ville" class="form-control" value="<c:out value="${articleAffichage.retrait.ville }"/>"/>
				<br/>
			</c:if>
			<!-- affiche adresse userSession si idArticle vide car nouvelle saisie article -->	
			<c:if test="${ empty articleAffichage.idArticle }">
			<label for="rue">Rue</label>
			<input type="text" id="text" name="rue" class="form-control" value="<c:out value="${sessionScope.sessionUtilisateur.rue}"/>" />
			<br/>
			<label for="codePostal">Code Postal</label>
			<input type="text" id="codePostal" name="codePostal" class="form-control" value="<c:out value="${sessionScope.sessionUtilisateur.codePostal }"/>"/>
			<br/>
			<label for="ville">Ville</label>
			<input type="text" id="ville" name="ville" class="form-control" value="<c:out value="${sessionScope.sessionUtilisateur.ville }"/>"/>
			<br/>
			</c:if>
			</fieldset>	
	       		</div>
	       	</div>
			<!-- date du jour pas affichée juste pour utiliser la valeur pour comparaison avec date d'enchère et affichage-->
			<jsp:useBean id="now" class="java.util.Date"/>
			<fmt:formatDate pattern ="yyyy-MM-dd" value = "${now }" var="now"/>
			
			<!-- SI id article passé en paramètre n'est pas nul on modifie les boutons du bas SINON affichage JSP nouvellVente normal -->
			<c:if test="${ not empty articleAffichage.idArticle}">
			
					<c:choose>	
				<%-- si vente pas commencée on peut modifier les infos DONC ajout d'un  bouton mofifier qui activera un update de ARTICLE --%>
						<c:when test ="${articleAffichage.dateDebutEnchere gt now  }">
						<input type="submit" value="Enregistrer"/>
						<a href="AccueilSession"><input type="button" value="Retour"/></a>
						<a href="DeleteArticle"><input type="button" value="Annuler la vente"/></a>
						
						</c:when>
						
				<%-- si enchere deja débutée pas de modif possible, seulement bouton retour acuueilSession.JSP --%>
						<c:when test="${articleAffichage.dateDebutEnchere lt now }">
							<a href="Annuler"><input type="button" value="Retour"/></a>
						</c:when>
				
				<%-- si vente terminée,le lien en accueiSession renvoie directement sur la page affichant qui a remporté l'enchère --%>
						
					</c:choose>	
			</c:if>
			<!-- affichage normal de la jsp pour validation nouvel article -->
			<c:if test="${empty articleAffichage.idArticle }">	       		
	     	<div class="row" style="justify-content:center;">
	       		<div class="col-md-6" >
		       		<input type="submit" value="Enregistrer" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;"/>
					<a href="Annuler"><input type="button" value="Annuler" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;margin-left: 15px"/></a>	
	       		</div>
	       	</div>
	       	</c:if>	
    	</form>
    	
    	<footer>
			<div class="barblanc"><img id="logo-eni" src="./images/logo-eni.png" alt="photo ici"></div>
			<div class="barbleu"><p class="nous">Réalisé par Sebastien et Lorris</p></div>
		</footer>
		
    </div>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
 
</body>
</html>

