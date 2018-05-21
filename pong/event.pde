void keyReleased(){
  if (cptDbtPt  == -1) {
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
}
void keyPressed(){
  if (cptDbtPt == -1) {
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
}