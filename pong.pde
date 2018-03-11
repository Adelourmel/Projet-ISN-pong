int x; //coordonnée de la balle en X
int y; //coordonnée de la balle en y
int a; //coordonnée du plateau 1 en X
int b; //placement du plateau 1 en Y  
int c; //coordonnée du plateau 2 en X
int d; //placement du plateau 2 en y
int deplacementx; //deplacement de la balle
int deplacementy; //deplacement de la balle
int deplacementa; //deplacement du plateau1   
int deplacementd; //deplacement du plateau2
void setup()
{
  x=325;
  deplacementx=6;
  y=400;
  deplacementy=-3;
  a=10;
  b=285;
  deplacementa=5;
  c=765;
  d=285;
  deplacementd=5;
 
  background(0);
  size (800,650);
}
void draw()
{
  nettoyer();
  bougerballe();
  dessiner();
  rebondir();
  //bougerplateau1();
  //bougerplateau2();
 
}

void nettoyer()
{
  background(0);
}

  void dessiner()
{  smooth();
  fill(255);
  rect(a,b,25,85);
  fill(255);
  rect(c,d,25,85);
  ellipse(x,y,20,20);
  line(400,0,400,650);
  stroke(250);
}

void bougerballe()
{
  x=x+deplacementx;
  y=y+deplacementy;
}

/*void bougerplateau1() {
 while(keyPressed && key== 'z'){
  b= b-deplacementa;
  }*/

void keyPressed()
{
 if(key=='z')
   {b=b-deplacementa;}
 if(key=='s')
   {b=b+deplacementa;}
 if(key=='2')
   {d=d+deplacementd;}
 else if(key=='5')
   {d=d-deplacementd;}
}

void rebondir()
{
 
  //si la balle touche le bord du bas alors on change le sens Y
  if (y > 650-10 && deplacementy > 0)
   {
   deplacementy = -deplacementy; // rendre négative la valeur8
   }
  //si la balle touche le bord du haut alors on change le sens Y
  if(y < 10 && deplacementy < 10)
  {
    deplacementy=abs(deplacementy);
  }
 
  //si la balle touche le plateau 1 alors elle rebondit
  if(x < a+35 && y > b && y < b+85)
  {
   deplacementx = -deplacementx;
  }
  //si la balle touche le plateau 2 alors elle rebondit
  if(x < d+35 && y > d && y < d+85)
  {
   deplacementx = -deplacementx;
  }
  if (x < 10 && x>800)
  {
   noLoop();
   println("GAME OVER");   
  }
  }