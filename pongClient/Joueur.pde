class Joueur {
  int x;
  int y;
  int largeur = 20;
  int longueur = 80;
  int bouger = 0;
  int points = 0;
  Joueur(Boolean place){
    if (place){
      x = 10;
    }
    else {
      x = width - (largeur+10);
    }
    y = height/2 - longueur;
  }
  
  void afficher(){
  rect(x, y, largeur, longueur);    
  }
  
  
  
  
  //Fonctions déplacement du joueur 
  void updateDeplacement(){
    
    y = mouseY;
    if ((y >= (height - (longueur + 10)))){
      y = (height - (longueur + 10));
    }
    if (y <= 10){
      y = 10;
    }
  }
  void deplacer(int deplacement){
    bouger = deplacement;
  }
}
