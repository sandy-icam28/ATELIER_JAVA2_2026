<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Le polymorphisme</title>
</head>
<body bgcolor=white>
<h1>Exercices sur le polymorphisme</h1>
<form action="#" method="post">
    <p>Saisir le nom d'un chien : <input type="text" name="chien">
    <p>Saisir le nom d'un chat : <input type="text" name="chat">
    <p><input type="submit" value="Faire crier les animaux">
</form>

<%-- Une classe mère Animal et deux classes filles qui redéfinissent la méthode crier() --%>

<%-- Récupération des valeurs du formulaire --%>
<% String chien = request.getParameter("chien"); %>
<% String chat = request.getParameter("chat"); %>

<% if (chien != null && chat != null && !chien.isEmpty() && !chat.isEmpty()) { %>

    <%-- Tableau d'Animal contenant en réalité un Chien et un Chat --%>
    <% Animal[] animaux = { new Chien(chien), new Chat(chat) }; %>

    <p>Démonstration du polymorphisme :</br>
    Le tableau est déclaré <code>Animal[]</code>, mais c'est bien la méthode <code>crier()</code> de la sous-classe (Chien ou Chat) qui est appelée à l'exécution.</p>

    <% for (Animal a : animaux) { %>
        <p><%= a.nom %> dit : <%= a.crier() %></p>
    <% } %>

<h2>Exercice 1 : Redéfinir toString()</h2>

<%!
interface Affichable {
    public String afficher();
}

class Animal {
    String nom;

    public Animal(String nom) {
        this.nom = nom;
    }

    public String crier() {
        return "...";
    }

    public String toString() {
        return "Animal nommé " + nom;
    }
}

class Chien extends Animal implements Affichable {

    public Chien(String nom) {
        super(nom);
    }

    public String crier() {
        return "Wouf wouf !";
    }

    public String afficher() {
        return "Je suis le chien " + nom;
    }

    public String toString() {
        return "Chien nommé " + nom;
    }
}

class Chat extends Animal implements Affichable {

    public Chat(String nom) {
        super(nom);
    }

    public String crier() {
        return "Miaou !";
    }

    public String afficher() {
        return "Je suis le chat " + nom;
    }

    public String toString() {
        return "Chat nommé " + nom;
    }
}

abstract class Forme {
    public abstract double aire();
}

class Cercle extends Forme {
    double rayon;

    public Cercle(double rayon) {
        this.rayon = rayon;
    }

    public double aire() {
        return Math.PI * rayon * rayon;
    }
}

class Carre extends Forme {
    double cote;

    public Carre(double cote) {
        this.cote = cote;
    }

    public double aire() {
        return cote * cote;
    }
}
%>

<% for (Animal a : animaux) { %>
    <p><%= a.toString() %></p>
<% } %>

<h2>Exercice 2 : La classe abstraite Forme</h2>

<%
Forme[] formes = {
    new Cercle(3),
    new Carre(4)
};

for(Forme f : formes){
%>
    <p>Aire : <%= f.aire() %></p>
<%
}
%>

<h2>Exercice 3 : L'interface Affichable</h2>

<%
Affichable[] affichables = {
    new Chien(chien),
    new Chat(chat)
};

for(Affichable a : affichables){
%>
    <p><%= a.afficher() %></p>
<%
}
%>

<h2>Exercice 4 : Ajouter un Oiseau</h2>
<p>Créer une nouvelle sous-classe <code>Oiseau</code> qui hérite de <code>Animal</code> et redéfinit <code>crier()</code> par "Cui cui !".</br>
L'ajouter dans le tableau d'animaux ci-dessus, <strong>sans modifier la boucle d'affichage</strong>.</br>
Constater que le code de la boucle continue de fonctionner : c'est tout l'intérêt du polymorphisme.</p>

<h2>Exercice 5 : L'opérateur instanceof</h2>
<p>Dans la boucle qui parcourt les animaux, utiliser <code>instanceof</code> pour afficher un message spécifique :</br>
- "C'est un chien" si l'animal est un <code>Chien</code>,</br>
- "C'est un chat" si l'animal est un <code>Chat</code>,</br>
- "Autre animal" dans tous les autres cas.</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
