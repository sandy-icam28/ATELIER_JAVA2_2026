<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les constructeurs</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les constructeurs</h1>
<form action="#" method="post">
    <p>Saisir un titre de livre : <input type="text" name="titre">
    <p>Saisir un auteur : <input type="text" name="auteur">
    <p><input type="submit" value="Créer les livres">
</form>

<%-- Une classe Livre avec deux constructeurs : par défaut et avec paramètres --%>
<%!
    class Livre {
        String titre;
        String auteur;

        // Constructeur par défaut
        public Livre() {
            this.titre = "Titre inconnu";
            this.auteur = "Auteur inconnu";
        }

        // Constructeur avec paramètres
        public Livre(String titre, String auteur) {
            this.titre = titre;
            this.auteur = auteur;
        }
    }
%>

<%!
class Etudiant {
    String nom;
    double note;

    // Exercice 3 : constructeur par défaut avec this()
    public Etudiant() {
        this("Anonyme", 10);
    }

    // Exercice 2 : constructeur avec nom seulement
    public Etudiant(String nom) {
        this(nom, 10);
    }

    // Exercice 2 : constructeur complet
    public Etudiant(String nom, double note) {
        this.nom = nom;
        this.note = note;
    }

    // Exercice 4 : constructeur de copie
    public Etudiant(Etudiant e) {
        this.nom = e.nom;
        this.note = e.note;
    }
}

class Produit {
    double prix;

    public Produit(double prix) {
        if (prix < 0) {
            this.prix = 0;
        } else {
            this.prix = prix;
        }
    }
}
%>

<%-- Récupération des valeurs du formulaire --%>
<% String titre = request.getParameter("titre"); %>
<% String auteur = request.getParameter("auteur"); %>

<% if (titre != null && auteur != null) { %>

    <%-- Création de deux livres : un via le constructeur par défaut, l'autre avec les valeurs saisies --%>
    <% Livre livreVide = new Livre(); %>
    <% Livre livrePlein = new Livre(titre, auteur); %>

    <p>Livre créé via le constructeur par défaut :</p>
    <p>Titre : <%= livreVide.titre %> - Auteur : <%= livreVide.auteur %></p>

    <p>Livre créé via le constructeur avec paramètres :</p>
    <p>Titre : <%= livrePlein.titre %> - Auteur : <%= livrePlein.auteur %></p>

<h2>Exercice 1, 2 et 3 : Etudiant</h2>

<%
Etudiant e1 = new Etudiant();
Etudiant e2 = new Etudiant("Paul");
Etudiant e3 = new Etudiant("Marie", 15);
%>

<p>Etudiant 1 : <%= e1.nom %> - Note : <%= e1.note %></p>
<p>Etudiant 2 : <%= e2.nom %> - Note : <%= e2.note %></p>
<p>Etudiant 3 : <%= e3.nom %> - Note : <%= e3.note %></p>

<h2>Exercice 1 : Le constructeur par défaut</h2>
<p>Créer une classe <code>Etudiant</code> avec un constructeur par défaut qui initialise :</br>
- l'attribut <code>nom</code> à "Anonyme"</br>
- l'attribut <code>note</code> à 10.</br>
Instancier un étudiant avec ce constructeur et afficher ses informations.</p>

<h2>Exercice 2 : La surcharge de constructeurs</h2>
<p>Ajouter à la classe <code>Etudiant</code> deux autres constructeurs :</br>
- un constructeur prenant uniquement le <code>nom</code> en paramètre (la note vaut 10 par défaut),</br>
- un constructeur prenant le <code>nom</code> et la <code>note</code> en paramètres.</br>
Créer 3 étudiants avec les 3 constructeurs et afficher leurs informations.</p>

<h2>Exercice 3 : Chaîner les constructeurs avec this()</h2>
<p>Dans la classe <code>Etudiant</code>, modifier le constructeur sans paramètre pour qu'il appelle le constructeur à deux paramètres avec <code>this("Anonyme", 10)</code>.</br>
Cela évite la duplication du code d'initialisation.</p>

<h2>Exercice 4 : Le constructeur de copie</h2>
<%
Etudiant copie = new Etudiant(e3);
%>
<p>Original : <%= e3.nom %> - <%= e3.note %></p>
<p>Copie : <%= copie.nom %> - <%= copie.note %></p>

<h2>Exercice 5 : Valider les paramètres dans le constructeur</h2>
<h2>Exercice 5 : Produit</h2>

<%
Produit p = new Produit(-50);
%>

<p>Prix demandé : -50 €</p>
<p>Prix réel : <%= p.prix %> €</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
