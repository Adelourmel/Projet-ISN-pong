import processing.net.*;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.io.IOException;
import java.lang.ProcessBuilder;
import java.io.*;
Balle balle;
Joueur gauche;
Joueur droite;
Client client;
String adresseIp = " ";
String ip;
Boolean clavier = true;
int choix = 0;
int cptDbtPt = 4;
Boolean svr  = true;
Boolean i = true;
char reseau = 'n';
boolean connectionTest = true;
Boolean clavierSouris = true;
void setup() {
  size(850, 600);
  balle = new Balle();
}
// Fonction principale
void draw() {

  switch (choix) {
  case 0:
    cptDbtPt = 4;
    choix = menu();
    break;
  case 1:
    jeuSolo();
    break;
  case 2:
    jeuDuo();
    break;
  case 3:
    jeuReseau();
    break;

  }
}
// Fonction qui gère les parties joueur contre ordinateur
void jeuSolo() {
  if (i) {

    if ('s' == choixClavier()) {
      clavier = true;
      svr = false;
    }
    if ('c' == choixClavier()) {
      clavier = false;
      svr = false;
    }
    if (!svr) {
      gauche = new Joueur(true, false);
      droite = new Joueur(false, clavier);
      i = false;
    }
  }

  if (!i && !compteur()) {
    balle.checkJoueur(droite); 
    balle.checkJoueur(gauche);
    computer();
    balle.deplacer();
    droite.updateDeplacement();
    updateScreen();
  }
}
void jeuDuo() {

    if (i) {
      if (compteur()) {
      } else {
        gauche = new Joueur(true, false);
        droite = new Joueur(false, false);
        i = false;
      }
    } else {
      droite.updateDeplacement();
      balle.checkJoueur(droite); 
      balle.deplacer();
      gauche.updateDeplacement();
      balle.checkJoueur(gauche);

      updateScreen();
    }
  
}

void computer() {
  if (balle.x<425) {
    if (gauche.y >23) {
      if (gauche.y>balle.y-50) {
        gauche.y=gauche.y-4;
      }
    }
  }
  if (gauche.y<balle.y-50) {
    if (gauche.y<495) {
      gauche.y=gauche.y+4;
    }
  }
}
// Compteur de début de partie
Boolean compteur() {
  if (cptDbtPt > 0) {
    textSize(105);
    fill(250);
    background(0);
    cptDbtPt--;

    text(cptDbtPt, width/2, height/2);
    textAlign(CENTER);
    delay (1000);
    return true;
  }
  cptDbtPt = -1;
  return false;
}
// Fonction permettant de réinitialiser toutes les varibles globales
void init() {
  noStroke();
  adresseIp = " ";
  clavier = true;
  choix = 0;
  cptDbtPt = 4;
  svr  = true;
  i = true;
  reseau = 'n';
  connectionTest = true;
  clavierSouris = true;
}
//Permet d'afficher à l'écran le jeu
void updateScreen() {
  color c = color(0, 0, 0, 120);
  fill(c);
  rect(0, 0, width, height);

  delimitation();
  score();
  balle.afficher();
  gauche.afficher();
  droite.afficher();
}