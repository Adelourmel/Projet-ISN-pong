int menu() {
  background(0);
  fill(255);
  textSize(100);
  text("PONG", width/2, 110);
  textSize(20);
  text("Les lettres 'A', 'Q' sont les lettres utiles au joueur 1.\nLes lettres 'P', 'M' sont les lettres utiles au joueur 2.\nLa lettre 'E' permet de revenir au menu", width/2, 200);

  textSize(32);
  rectangle(300, "Jouer contre joueur", 250);
  rectangle(400, "Jouer contre machine", 250);
  rectangle(500, "Jouer en réseau", 250);

  textSize(32);
  if (mouseY>=300 && mouseX>=250 && mouseY<=380 && mouseX<=600) {
    rectangle(300, "Jouer contre joueur", 150);
  } 
  if (mouseY>=400 && mouseX>=250 && mouseY<=480 && mouseX<=600) {
    rectangle(400, "Jouer contre machine", 150);
  }
  if (mouseY>=500 && mouseX>=250 && mouseY<=580 && mouseX<=600) {
    rectangle(500, "Jouer en réseau", 150);
  }

  if ((mouseY>=300 && mouseX>=250 && mouseY<=380 && mouseX<=600)&& (mousePressed == true)) { 
    return 2;
  }
  if ((mouseY>=400 && mouseX>=250 && mouseY<=480 && mouseX<=600)&& (mousePressed == true)) { 
    return 1;
  }
  if ((mouseY>=500 && mouseX>=250 && mouseY<=580 && mouseX<=600)&& (mousePressed == true)) { 
    return 3;
  }

  return 0;
}

void rectangle(int y, String text, int C) {
  fill(C);
  rect(250, y, 350, 80);
  fill(0);
  text(text, 425, y+40);
  textAlign(CENTER);
}
char menuReseau() {
  background(0);
  rectangle(60, "Je suis le serveur", 250);
  rectangle(160, "Je suis le client", 250);
  if (mouseY>=60 && mouseX>=250 && mouseY<=140 && mouseX<=600) {
    rectangle(60, "Je suis le serveur", 150);
  }
  if (mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600) {
    rectangle(160, "Je suis le client", 150);
  }
  if ((mouseY>=60 && mouseX>=250 && mouseY<=140 && mouseX<=600)&& (mousePressed == true)) { 
    return 's';
  }
  if ((mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600)&& (mousePressed == true)) { 
    return 'c';
  }
  return 'n';
}
char choixClavier() {
  background(0);
  rectangle(160, "Jouer avec le clavier", 250);
  rectangle(260, "Jouer avec la souris", 250);
  if (mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600) {
    rectangle(160, "Jouer avec le clavier", 150);
  } 
  if (mouseY>=260 && mouseX>=250 && mouseY<=340 && mouseX<=600) {
    rectangle(260, "Jouer avec la souris", 150);
  }
  if ((mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600)&& (mousePressed == true)) { 
    return 'c';
  }
  if ((mouseY>=260 && mouseX>=250 && mouseY<=340 && mouseX<=600)&& (mousePressed == true)) { 
    return 's';
  }
  return 'n';
}