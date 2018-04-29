void delimitation() {
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(10, 10, width-25, height-25);
  line(width/2, 10, width/2, height-15);
  strokeJoin(MITER);
} 
void score() {
  text(+ gauche.points, 375, 120); 
  text(+ droite.points, 475, 120);
}