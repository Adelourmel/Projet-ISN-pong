int menu() {
  background(0);
  rectangle(60, "Training", 250);
  rectangle(160, "Player VS Player", 250);
  rectangle(260, "Player VS Computer", 250);
  rectangle(360, "Setting", 250);
  if (mouseY>=260 && mouseX>=250 && mouseY<=340 && mouseX<=600) {
    rectangle(260, "Player VS Computer", 150);
  }
  if (mouseY>=60 && mouseX>=250 && mouseY<=140 && mouseX<=600) {
    rectangle(60, "Training", 150);
  }  
  if (mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600) {
    rectangle(160, "Player VS Player", 150);
  }
  if (mouseY>=360 && mouseX>=250 && mouseY<=440 && mouseX<=600) {
    rectangle(360, "Setting", 150);
  }
  
  
  if ((mouseY>=660 && mouseX>=250 && mouseY<=140 && mouseX<=600)&& (mousePressed == true)) { 
    return 1;

  }
  if ((mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600)&& (mousePressed == true)) { 
    return 2;
  }
  if ((mouseY>=260 && mouseX>=250 && mouseY<=340 && mouseX<=600)&& (mousePressed == true)) { 
    return 3;
  }
  if ((mouseY>=260 && mouseX>=250 && mouseY<=340 && mouseX<=600)&& (mousePressed == true)) { 
    return 4;
  }
  
  return 0;
}
void rectangle(int y, String text, int C) {
  fill(C);
  rect(250, y, 350, 80);
  textSize(32);
  fill(0);
  text(text, 425, y+40);
  textAlign(CENTER);
}