import processing.net.*;
Balle balle;
Joueur gauche;
Joueur droite;
Client client;
int choix = 0;
int cptDbtPt = 4;
Boolean i = true;
void setup(){
  size(850, 600);
  balle = new Balle();
  
  
}
void draw(){
  if (choix != 0) {
       if (cptDbtPt >= 0) {
      textSize(105);
      fill(250);
      delay (1000);
      background(0);
      cptDbtPt--;
      
      text(cptDbtPt, width/2, height/2);
      textAlign(CENTER);
      println("TEST");
    }
    else {
      switch (choix) {
   
       case 1:
       
       println("Yop");
       break;
      case 2:
      jeuDuo();
        break;
      case 3:
         break;
      case 4:
        break;
      }
    
    }
}
    
  else {
    cptDbtPt = 4;
    choix = menu();
  }

}
void jeuDuo(){
  if (i) {
    gauche = new Joueur(true, false);
    droite = new Joueur(false, false);
    i = false;
  }
  balle.deplacer();
  gauche.updateDeplacement();
  droite.updateDeplacement();
  balle.checkJoueur(droite); 
  balle.checkJoueur(gauche);
  updateScreen();

  
}
void jeuReseau(){
  if (i) {
    String adresseIp = "127.0.0.1";
    client = new Client(this, adresseIp, 5204);
    gauche = new Joueur(true, true);
    droite = new Joueur(false, false);
    i = false;
  }
    balle.deplacer();
    gauche.updateDeplacement();
    //sendData(data);
}
void updateScreen(){
  background(0);
  delimitation();
  score();
  balle.afficher();
  gauche.afficher();
  droite.afficher();
}
void sendData(String data) {
  client.write(data);
}