class Balle {
  int x = width/2;
  int y = height/2;
  int ballSize = 20;
  int deplacementX = -6;
  int deplacementY = 0;
  void afficher(){
    fill(255);
    ellipse(x, y, ballSize, ballSize);
  }
  void checkJoueur(Joueur player){
    if(player.x >= x - ballSize + deplacementX - 5 && player.x < x + deplacementX + 5 && player.y < y && (player.y + player.longueur) > y){
      deplacementX *= -1;
      deplacementY = int(random(-5, 5));
      
    }
  
  }
  void deplacer(){
    
    if (y + deplacementY > - 22+height  || y + deplacementY < 11+ballSize/2){
      deplacementY *= -1;
      
    }
    if (x + deplacementX > -16+(width - ballSize/2)){
      gauche.points += 1;
      //println("Gauche : " + gauche.points + " Droite : " + droite.points);
      x = width/2;
      y = height/2;
      
    }
    if (x + deplacementX <  11+ballSize/2){
      droite.points += 1;
     // println("Gauche : " + gauche.points + " Droite : " + droite.points);
      x = width/2;
      y = height/2;
    }
    x += deplacementX;
    y += deplacementY;
    
  }
    
    
  
}