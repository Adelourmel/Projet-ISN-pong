 //<>// //<>//  //<>//
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
Boolean clavierSouris = true;
void setup() {
  size(850, 600);
  balle = new Balle();
}
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
void jeuReseau() {

  if (reseau == 'n') {
    reseau = menuReseau();
  }
  if (i && reseau != 'n') {

    Boolean test = true;
    if (reseau == 's') {

      //Executer serveur

      if (test) {

        if (svr) {
          print(svr);          
          svr = false;
          //openServeur();
        }

        test = afficherIp();
        adresseIp = "127.0.0.1";
      }
    }
    if (reseau == 'c') {
      if (adresseIp == " ") {
        background(0);
        adresseIp = entrerIp();
        println(adresseIp);
      } else {
        test = false;
      }
      
    }
    if (!test) {
      
        client = new Client(this, adresseIp, 5204);
        gauche = new Joueur(true, clavier);
        droite = new Joueur(false, clavier);
        i = false;
    }
  }
  if (!i) {
    if (clavierSouris) {
      if ('s' == choixClavier()) {
        clavier = true;
        clavierSouris = false;
      }
      if ('c' == choixClavier()) {
        clavier = false;
        clavierSouris = false;
      }

    } 
    else {
      recevoirData();
      if (reseau == 's') {
        droite.updateDeplacement();
      }
      if (reseau == 'c') {
        balle.deplacer();
        gauche.updateDeplacement();
        balle.checkJoueur(droite); 
        balle.checkJoueur(gauche);
      }
      if (frameCount % 4 == 0) {
        sendData();
      }

      updateScreen();
    }
  }
}
void updateScreen() {
  background(0);
  delimitation();
  score();
  balle.afficher();
  gauche.afficher();
  droite.afficher();
}
Boolean compteur() {
  if (cptDbtPt >= 0) {
    textSize(105);
    fill(250);
    delay (1000);
    background(0);
    cptDbtPt--;

    text(cptDbtPt, width/2, height/2);
    textAlign(CENTER);
    return true;
  }
  return false;
}
void openServeur () {   
  String[] cmd = {"start \"test\"serveur.exe"};



  Process p;
  try { 
    int error;
    p = launch(cmd);
    p.waitFor();
    error = p.exitValue();
  } 
  catch (InterruptedException e) {
    e.printStackTrace();
  }
}
String replaceWhitespace(String str) {
  if (str.contains(" ")) {
    str = str.replace(" ", "%20");
  }
  return str;
}
void init() {
  adresseIp = " ";
  clavier = true;
  choix = 0;
  cptDbtPt = 4;
  svr  = true;
  i = true;
  reseau = 'n';
  clavierSouris = true;
}
void computer() {
  if (balle.x<425 &&  balle.deplacementX<0) {
    if(gauche.y>balle.y-50){
    gauche.y=gauche.y-4;
    }
    if(gauche.y<balle.y-50){
    gauche.y=gauche.y+4;
    }
  }
}