class Balle {
  int x = width/2;
  int y = height/2;
  int ballSize = 20;
  int deplacementX = -5;
  int deplacementY = 4;
  void afficher(){
    fill(255);
    ellipse(x, y, ballSize, ballSize);
  }
  void checkJoueur(Joueur player){
    if(player.x >= x - ballSize + deplacementX && player.x < x + deplacementX + 10 && player.y < y && (player.y + player.longueur) > y){
      deplacementX *= -1;
      
    }
  
  }
  void deplacer(){
    
    if (y + deplacementY > - 15+height  || y + deplacementY < ballSize/2){
      deplacementY *= -1;
      
    }
    if (x + deplacementX > (width - ballSize/2)){
      gauche.points += 1;
      //println("Gauche : " + gauche.points + " Droite : " + droite.points);
      x = width/2;
      y = height/2;
      
    }
    if (x + deplacementX < 0 + ballSize/2){
      droite.points += 1;
     // println("Gauche : " + gauche.points + " Droite : " + droite.points);
      x = width/2;
      y = height/2;
    }
    x += deplacementX;
    y += deplacementY;
    
  }
    
    
  
}