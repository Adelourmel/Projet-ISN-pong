import processing.net.*;
Server serveur;
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