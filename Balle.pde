class Balle {
  int x = width/2;
  int y = height/2;
  int ballSize = 20;
  int deplacementX = -2;
  int deplacementY = 4;
  void afficher(){
    fill(255);
    ellipse(x, y, ballSize, ballSize);
  }
  void deplacer(){
    x += deplacementX;
    y += deplacementY;
    if (y > (height + ballSize) || y<0){
      deplacementY *= -1;
    }
    if (x > (width + ballSize) || x < 0){
      deplacementX *= -1;
    }
    
  }
  
}