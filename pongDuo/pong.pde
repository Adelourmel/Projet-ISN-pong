Balle balle;
Joueur gauche;
Joueur droite;
void setup(){
  size(850, 600);
  balle = new Balle();
  gauche = new Joueur(true);
  droite = new Joueur(false);
}
void draw(){
  background(0);
  balle.deplacer();
  gauche.updateDeplacement();
  droite.updateDeplacement();
  balle.checkJoueur(droite); 
  balle.checkJoueur(gauche);
  balle.afficher();
  gauche.afficher();
  droite.afficher();
}
void keyReleased(){
  if(key == 'a'){
    gauche.deplacer(0);
  }
  if (key == 'q'){
    gauche.deplacer(0);
  }
  if(key == 'p'){
    droite.deplacer(0);
  }
  if (key == 'm'){
    droite.deplacer(0);
  }
}
void keyPressed(){
  if(key == 'a'){
    gauche.deplacer(-6);
  }
  if (key == 'q'){
    gauche.deplacer(6);
  }
  if(key == 'p'){
    droite.deplacer(-6);
  }
  if (key == 'm'){
    droite.deplacer(6);
  }
}
