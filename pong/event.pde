void keyReleased(){
  if(key == 'a'){
    gauche.deplacer(0);
  }
  if (key == 'q'){
    gauche.deplacer(0);
  }
  if(key == 'p'){
    droite.deplacer(0);
  }
  if (key == 'm'){
    droite.deplacer(0);
  }
}
void keyPressed(){
  if(key == 'a'){
    gauche.deplacer(-6);
  }
  if (key == 'q'){
    gauche.deplacer(6);
  }
  if(key == 'p'){
    droite.deplacer(-6);
  }
  if (key == 'm'){
    droite.deplacer(6);
  }
}
void clientEvent(Client client){
  String in = client.readStringUntil('\n');
  int[] val = {};
  if (in != null) {
    in = in.substring(0, in.length() - 1);
    val = int(split(in, ' '));
  
    
  }
}