<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les objets</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les objets</h1>
<form action="#" method="post">
    <p>Saisir un nom : <input type="text" name="nom">
    <p>Saisir un âge : <input type="text" name="age">
    <p><input type="submit" value="Créer la personne">
</form>

<%-- Déclaration d'une classe Personne avec deux attributs --%>
<%!
    class Personne {
        String nom;
        int age;
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% String nom = request.getParameter("nom"); %>
<% String age = request.getParameter("age"); %>

<% if (nom != null && age != null && !nom.isEmpty() && !age.isEmpty()) { %>

    <%-- Instanciation d'un objet Personne et affectation des attributs --%>
    <% Personne p = new Personne(); %>
    <% p.nom = nom; %>
    <% p.age = Integer.parseInt(age); %>

    <p>Objet Personne créé !</p>
    <p>Nom : <%= p.nom %></p>
    <p>Age : <%= p.age %> ans</p>

<h2>Exercice 1 : La classe Voiture</h2>

<%!
class Voiture {
    String marque;
    String modele;
    int annee;
}
%>

<%
Voiture v = new Voiture();
v.marque = "Peugeot";
v.modele = "208";
v.annee = 2022;
%>

<h3>Voiture</h3>
<p>Marque : <%= v.marque %></p>
<p>Modèle : <%= v.modele %></p>
<p>Année : <%= v.annee %></p>


<h2>Exercice 2 : Ajouter une méthode à la classe Personne</h2>

<%!
class Personne {
    String nom;
    int age;

    public String seDecrire() {
        return "Je m'appelle " + nom + " et j'ai " + age + " ans";
    }
}
%>
<p><%= p.seDecrire() %></p>

<h2>Exercice 3 : La classe Rectangle</h2>

<%!
class Rectangle {
    double longueur;
    double largeur;

    public double calculerSurface() {
        return longueur * largeur;
    }
}
%>
<%
Rectangle r = new Rectangle();
r.longueur = 5;
r.largeur = 3;
%>

<h3>Rectangle</h3>
<p>Surface : <%= r.calculerSurface() %></p>

<h2>Exercice 4 : Le compte bancaire</h2>

<%!
class CompteBancaire {
    double solde;

    public void deposer(double montant) {
        solde += montant;
    }

    public void retirer(double montant) {
        solde -= montant;
    }
}
%>
<%
CompteBancaire compte = new CompteBancaire();

compte.deposer(100);
compte.retirer(30);
%>

<h3>Compte bancaire</h3>
<p>Solde final : <%= compte.solde %> €</p>

<h2>Exercice 5 : L'encapsulation</h2>

<%!
class Personne {
    private String nom;
    private int age;

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String seDecrire() {
        return "Je m'appelle " + nom + " et j'ai " + age + " ans";
    }
}
%>
<%
Personne p = new Personne();

p.setNom(nom);
p.setAge(Integer.parseInt(age));
%>
<p>Nom : <%= p.getNom() %></p>
<p>Age : <%= p.getAge() %> ans</p>

<p><%= p.seDecrire() %></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
