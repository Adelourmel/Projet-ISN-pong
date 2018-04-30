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

void sendData(String data) {
  client.write(data);
}

void recevoirData(int[] data) {

}
Boolean afficherIp() {
	background(0);
	textSize(32);
	fill(255);
	text("Votre adresse IP est : " + getIp(), width/2, 80);
	textAlign(CENTER);
	rectangle(160, "Suivant", 250);
	if (mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600) {
    rectangle(160, "Suivant", 150);
  }
	if ((mouseY>=160 && mouseX>=250 && mouseY<=240 && mouseX<=600)&& (mousePressed == true)) { 
    return false;
  }
  return true;
  

}
