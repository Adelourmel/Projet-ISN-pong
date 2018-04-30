import processing.net.*;
Server serveur;
void setup() {
  serveur = new Server(this, 5204);
}
void draw() {
  
  Client client = serveur.available();
  if (client != null) {
    serveur.write(client.readStringUntil('\n'));
  }
}