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
/*void clientEvent(Client client){

  String in = client.readStringUntil('\n');
  if (in != null) {
    if (in.charAt(0) != reseau) {

      int[] val = {};
      in = in.substring(2, in.length() - 1);
      val = int(split(in, ' '));
      recevoirData(val);
    }
    
    
  }
}*/