String getIp() {
  String adresseIp = " ";
  Boolean ipTest = true;
  int n = 0;
  try {
    InetAddress ipAddr = InetAddress.getLocalHost();
    adresseIp = ipAddr.getHostAddress();
  } 
  catch (UnknownHostException ex) {
    ex.printStackTrace();
  }
  if (reseau == 'c') {
    while (ipTest) {
    if (adresseIp == "") {
      ipTest = false;
    }
    if (adresseIp.charAt(adresseIp.length() - n - 1) != '.' && n < adresseIp.length()) {
      n++;
    } else {
      ipTest = false;
    }
  }
  println(n);
  println(adresseIp);
  adresseIp = adresseIp.substring(0, adresseIp.length() - n);
  println(adresseIp);
  }
  
  return adresseIp;
}

void sendData() {
  String message = " ";
  if (reseau == 's') {
    message = reseau + " " + droite.y + "\n";
  }
  if (reseau == 'c') {
    message = reseau + " " + gauche.y + " "+ balle.y + " " + balle.x + " "+ gauche.points + " " + droite.points + "\n";
  }
  client.write(message);
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
String entrerIp() {
  if (svr) {
    ip = "";
    ip = getIp();
    svr = false;
  }

  if (keyPressed == true) { 
    
    if (clavier) {
      Boolean ipTest = true;
      if (key == '\b' && ip.length() == 0) {
        ip = "";
        ipTest = false;
      }   
      if (key == '\b' && ipTest) {
        ip = ip.substring(0, ip.length()-1);
      }
      if (key != '\b' && ipTest) {
        ip = ip + key;
      }

      clavier = false;
    }
  }
  if (keyPressed == false) {
    clavier = true;
  }
  fill(255);
  text(ip, width/2, height/2); 
  rectangle(360, "Confirmer", 250);
  if (mouseY>=360 && mouseX>=250 && mouseY<=440 && mouseX<=600) {
    rectangle(360, "Confirmer", 150);
  }
  if ((mouseY>=360 && mouseX>=250 && mouseY<=440 && mouseX<=600)&& (mousePressed == true)) { 
    return ip;
  }
  return " ";
}