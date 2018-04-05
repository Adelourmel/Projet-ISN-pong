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
