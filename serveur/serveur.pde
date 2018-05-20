import processing.net.*;
Server serveur;
int nbPlayer = 0;
void setup() {
  serveur = new Server(this, 5204);
}
void draw() {
  
  Client client = serveur.available();
  if (client != null) {
  	String message = client.readStringUntil('\n');
  		if (message != null) {
  			serveur.write(message);
  		}
  }
}
void serverEvent(Server serveur, Client client) {
  nbPlayer ++;
  if (nbPlayer == 2) {
    serveur.write("A");
  }

}