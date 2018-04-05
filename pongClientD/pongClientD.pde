import processing.net.*;
Balle balle;
Joueur gauche;
Joueur droite;
Client client;
void setup(){
  size(850, 600);
  balle = new Balle();
  gauche = new Joueur(true);
  droite = new Joueur(false);
  client = new Client(this, "127.0.0.1", 5204);
}
void draw(){
  background(0);
  balle.deplacer();
  droite.updateDeplacement();
  setData();
  balle.checkJoueur(droite); 
  balle.checkJoueur(gauche);
  balle.afficher();
  gauche.afficher();
  droite.afficher();
  getData();
}
void getData(){
  if (client.available() > 0);
  {
    String input = client.readStringUntil('\n');
    if(input.charAt(0) == '1')
    {
      analyseData();
    }
    
  }
}
void setData(){
  String output = droite.x + "," + droite.y + "," + balle.x + "," + balle.y + "/n";
  client.write(output);
}
void analyseData(){

}
