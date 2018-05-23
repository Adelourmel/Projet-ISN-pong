// Patie pour la gestion de la partie réseau
//Fonction qui gère la partie réseau
void jeuReseau() {

  if (reseau == 'n') {
    reseau = menuReseau();
  }
  if (i && reseau != 'n') {

    Boolean test = true;
    if (reseau == 's') {

      //Executer serveur

      if (test) {

        if (svr) {      
          svr = false;
          //openServeur();
        }

        test = afficherIp();
        adresseIp = "127.0.0.1";
      }
    }
    if (reseau == 'c') {
      if (adresseIp == " ") {
        background(0);
        adresseIp = entrerIp();
      } else {
        test = false;
      }
    }
    if (!test) {
      
        
        gauche = new Joueur(true, clavier);
        droite = new Joueur(false, clavier);
        i = false;
    }
  }
  if (!i) {
    if (clavierSouris) {
      if ('s' == choixClavier()) {
        clavier = true;
        clavierSouris = false;
        client = new Client(this, adresseIp, 5204);
      }
      if ('c' == choixClavier()) {
        clavier = false;
        clavierSouris = false;
        client = new Client(this, adresseIp, 5204);
      }

    } 
    else {
      recevoirData();
      if (connectionTest) {
        fill(255);
        text("En attente de l'adversaire", width/2, 125);
      }
      else {
        if (!compteur()) {
        if (reseau == 's') {
          droite.updateDeplacement();
        }
        if (reseau == 'c') {
          balle.deplacer();
          gauche.updateDeplacement();
          balle.checkJoueur(droite); 
          balle.checkJoueur(gauche);
        }
        if (frameCount % 3 == 0) {
          sendData();
        }

        updateScreen();
      }
      }
        
    }
  }
  
}
// Fonction permettant de récupérer l'adresse IP
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
  
  adresseIp = adresseIp.substring(0, adresseIp.length() - n);
  
  }
  
  return adresseIp;
}
//Fonction permettant d'envoyer les données sur le serveur
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
//Fonction qui gère la reception des données
void recevoirData() {
  int[] data = {};
  if (client.available() > 0) {
    String in = client.readStringUntil('\n');
      if (in != null) {
        if (in.charAt(0) == 'A') {
          connectionTest = false;
        }
        if (in.charAt(0) != reseau && in.charAt(0) != 'A') {

          
          in = in.substring(2, in.length() - 1);
          data = int(split(in, ' '));
          if (reseau == 's') {
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
//Fonction qui affiche l'IP pour le client qui a le serveur
Boolean afficherIp() {
  background(0);
  textSize(32);
  fill(255);
  text("Votre adresse IP est : " + getIp() + "\n\n Pour assurer le bon fonctionnement \ndu jeu vous devez exécuter le fichier serveur.exe", width/2, 80);
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
// Fonction qui demande d'entrer l'IP pour le client qui n'a pas le serveur
String entrerIp() {
  if (svr) {
    ip = "";
    ip = getIp();
    svr = false;
  }
// Permet de gérer les entrées au clavier
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
  fill(255);
  textSize(32);
  text("Veuillez entrer l'adresse ip du serveur", width/2, 200);
  textSize(32);
  rectangle(360, "Confirmer", 250);
  if (mouseY>=360 && mouseX>=250 && mouseY<=440 && mouseX<=600) {
    rectangle(360, "Confirmer", 150);
  }
  if ((mouseY>=360 && mouseX>=250 && mouseY<=440 && mouseX<=600)&& (mousePressed == true)) { 
    return ip;
  }
  return " ";
}