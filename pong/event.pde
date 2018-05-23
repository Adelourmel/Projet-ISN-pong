//Gestion des touches de contrôle lors d'un jeu
void keyReleased() {
  if (cptDbtPt  == -1) {
    if (key == 'a'|| key =='A') {
      gauche.deplacer(0);
    }
    if (key == 'q'|| key =='Q') {
      gauche.deplacer(0);
    }
    if (key == 'p'|| key =='P') {
      droite.deplacer(0);
    }
    if (key == 'm'|| key =='M') {
      droite.deplacer(0);
    }
  }
}
void keyPressed() {
      if (key == 'e'|| key =='E') {
      init();
    }
  if (cptDbtPt == -1) {
    if (key == 'a' || key =='A') {
      gauche.deplacer(-6);
    }
    if (key == 'q'|| key =='Q') {
      gauche.deplacer(6);
    }
    if (key == 'p'|| key =='P') {
      droite.deplacer(-6);
    }
    if (key == 'm'|| key =='M') {
      droite.deplacer(6);
    }

  }
}