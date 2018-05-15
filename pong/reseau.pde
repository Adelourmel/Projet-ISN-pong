String getIp() {
	String adresseIp = " ";
  try {
            InetAddress ipAddr = InetAddress.getLocalHost();
            adresseIp = ipAddr.getHostAddress();
        } catch (UnknownHostException ex) {
            ex.printStackTrace();
        }
        return adresseIp;
}

void sendData() {
  String test = " ";
    if (reseau == 's') {
      test = reseau + " " + droite.y + "\n";
      
    }
    if (reseau == 'c') {
      test = reseau + " " + gauche.y + " "+ balle.y + " " + balle.x + " "+ gauche.points + " " + droite.points + "\n";
    }
    client.write(test);
      
}

void recevoirData() {
  int[] data = {};
  if (client.available() > 0) {
    String in = client.readStringUntil('\n');
      if (in != null) {
        if (in.charAt(0) != reseau) {

          
          in = in.substring(2, in.length() - 1);
          data = int(split(in, ' '));
          if (reseau == 's') {
            println("data : " + data[0] + " " + data[1] + " " + data[2]);
            gauche.y = data[0];
            balle.y = data[1];
            balle.x = data[2];
            gauche.points = data[3];
            droite.points = data[4];
          }
          if (reseau == 'c') {
            droite.y = data[0];
          }
      }
    }
  }
  
  
}
Boolean afficherIp() {
	background(0);
	textSize(32);
	fill(255);
	text("Votre adresse IP est : " + getIp(), width/2, 80);
	textAlign(CENTER);
	rectangle(360, "Suivant", 250);
	if (mouseY>=360 && mouseX>=250 && mouseY<=440 && mouseX<=600) {
    rectangle(360, "Suivant", 150);
  }
 if ((mouseY>=360 && mouseX>=250 && mouseY<=440 && mouseX<=600)&& (mousePressed == true)) { 
    return false;
  }
  return true;
  

}