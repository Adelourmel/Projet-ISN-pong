import processing.net.*;

Server serveur;
 
void setup(){
  size(200, 200);
  serveur = new Server(this, 5204);
}
void draw(){
  Client client = serveur.available();
    if (client != null)
    {
      String input = client.readStringUntil('\n');
      if (input != null)
      {
        serveur.write(input);
        println(input);
      }
    }
  

}