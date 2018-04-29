class Joueur {
  int x;
  int y;
  int largeur = 20;
  int longueur = 80;
  int bouger = 0;
  int points = 0;
  Boolean souris = false;
  Boolean sourisTest = true;
  Joueur(Boolean place, Boolean psouris){
    if (place){
      x = 20;
    }
    else {
      x = width - (largeur+25);
    }
    y = height/2 - longueur;
    souris = psouris;
  }
  
  void afficher(){
      rect(x, y, largeur, longueur);

  }
  
  
  //Fonctions déplacement du joueur 
  void updateDeplacement(){
    if ((y + bouger) >= (height - (longueur + 10)) || (y + bouger) <= (10)){
      bouger = 0;
    }
    if (!souris){
      y += bouger;
    }
    if (souris) {
      
       y = mouseY;
       if (y + longueur > height - 10) {
         y = height - 10 - longueur;
      }
       if (y < 10) {
         y = 10;
       }
    }
  }
  void deplacer(int deplacement){
    
    bouger = deplacement;
  }
}