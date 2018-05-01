import processing.net.*;
import java.net.InetAddress;
import java.net.UnknownHostException;
Balle balle;
Joueur gauche;
Joueur droite;
Client client;
int choix = 0;
int cptDbtPt = 4;
Boolean i = true;
char reseau = 'n';
void setup(){
  size(850, 600);
  balle = new Balle();
  
  
}
void draw(){
  if (choix != 0) {
     switch (choix) {
        case 1:
          
          break;
        case 2:
          jeuDuo();
          break;
        case 3:
          jeuReseau();
          break;
        case 4:
          break;
      }
    }
    
  else {
    cptDbtPt = 4;
    choix = menu();
  }
}
void jeuDuo(){
  if (i) {
    if (compteur()) {}
    else {
      gauche = new Joueur(true, false);
      droite = new Joueur(false, false);
      i = false;
    }
    
  }
  else {
    droite.updateDeplacement();
    balle.checkJoueur(droite); 
    balle.deplacer();
    gauche.updateDeplacement();
    balle.checkJoueur(gauche);
    
    updateScreen();
  }
  

  
}
void jeuReseau(){
  
  if (reseau == 'n') {
    reseau = menuReseau();
  }
  if (i && reseau != 'n') {
    String adresseIp = " ";
    if (reseau == 's') {
      
      //Executer serveur
      Boolean test = true;
      if (test) {
        test = afficherIp();
        adresseIp = "127.0.0.1";
      }
    }
    else {
       adresseIp = "127.0.0.1";
    }
     
    client = new Client(this, adresseIp, 5204);
    gauche = new Joueur(true, true);
    droite = new Joueur(false, false);
    i = false;
  }
  if (!i) {
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
      if (frameCount % 2 == 0) {
        sendData();
      }
      
      updateScreen();
    }
  }
void updateScreen(){
  background(0);
  delimitation();
  score();
  balle.afficher();
  gauche.afficher();
  droite.afficher();
}
Boolean compteur(){
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