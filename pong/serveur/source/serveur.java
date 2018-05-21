import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.net.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class serveur extends PApplet {


Server serveur;
int nbPlayer = 0;
int i = 0;
public void setup() {
  serveur = new Server(this, 5204);
}
public void draw() {
  if (nbPlayer == 2 && i < 60) {
    serveur.write("A\n");
    i ++;
  }
  Client client = serveur.available();
  if (client != null) {
  	String message = client.readStringUntil('\n');
  		if (message != null) {
  			serveur.write(message);
  		}
  }
}
public void serverEvent(Server serveur, Client client) {
  nbPlayer ++;
  if (nbPlayer == 2) {
    serveur.write("A\n");
  }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "serveur" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
