//Tp final Martina Sosa 92541/2 y María Sol Palau 91626/2
import processing.sound.*;
PImage[] images;
PImage imagen1, imagen2, imagen3, imagen4, imagen5, imagen6, imagen7, imagen8, imagen9, imagen10, imagen11, imagen12, imagen13, imagen14, imagen15, imagen16, imagen17, imagen18, imagen19, imagen20, imagen21, imagen22, imagen23, imagen24;
SoundFile file;
int currentState = 0;
int path = 0; // 0 for main path, 1 for left path, 2 for right path
String[] textosBotonIzquierdo = {
  ":3", "Secuestrar a Stéfano", "Option B", "Option C", "Option D", "Option E", "Option F", "Option G", "Option H", "Option I", "Option J", "Option K"
};
String[] textosBotonDerecho = {
  ":3", "Pedir ayuda", "Option M", "Option N", "Option O", "Option P", "Option Q", "Option R", "Option S", "Option T", "Option U", "Option V"
};


void setup () {
  size(640, 480);
  images = new PImage[22];
  file = new SoundFile(this, "data/ambiente.mp3");
  file.amp(0.5);
  file.play();
  
  images = new PImage[22];
  for (int i = 1; i < 22; i++) {
    images[i] = loadImage("data/imagen" + i + ".jpg");
  }
}



void buttonLeft(String texto) {  
  push();
  fill(#9BA3FF);
  ellipse(160,360,200,100);
  pop();
  textSize(30);
  text(texto,90,370);
}

void buttonRight(String texto) {
  push();
  fill(#9BA3FF);
  ellipse(480,360,200,100);
  pop();
  text(texto,420,370);
}

void draw () {
  background(255);
  image(images[getImageIndex()], 0, 0, width, height);
  
  // Draw buttons
  fill(#9BA3FF);
  ellipse(160, 360, 200, 100); // Left button
  ellipse(480, 360, 200, 100); // Right button
  
  fill(0);
  textSize(30);
  textAlign(CENTER, CENTER);
  text(getLeftButtonText(), 160, 360);
  text(getRightButtonText(), 480, 360);
}

void mousePressed() {
  if (mouseX > 60 && mouseX < 260 && mouseY > 310 && mouseY < 410) {
    // Left button clicked
    if (currentState == 1) {
      path = 1; // Left path
    }
    currentState = getNextState();
  } else if (mouseX > 380 && mouseX < 580 && mouseY > 310 && mouseY < 410) {
    // Right button clicked
    if (currentState == 1) {
      path = 2; // Right path
    }
    currentState = getNextState();
  }
}



int getImageIndex() {
  if (path == 0) {
    int[] path0 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    return path0[currentState];
  } else if (path == 1) {
    int[] path1 = {1, 2, 6, 13, 14};
    return path1[currentState];
  } else if (path == 2) {
    int[] path2 = {1, 2, 15, 16, 17, 18, 19, 20, 21};
    return path2[currentState];
  }
  return 0;
}

int getNextState() {
  if (path == 0) {
    return min(11, currentState + 1);
  } else if (path == 1) {
    return min(4, currentState + 1);
  } else if (path == 2) {
    return min(8, currentState + 1);
  }
  return currentState;
}

String getLeftButtonText() {
  if (path == 0) {
    return textosBotonIzquierdo[currentState];
  } else if (path == 1) {
    return textosBotonIzquierdo[currentState];
  } else if (path == 2) {
    return textosBotonIzquierdo[currentState];
  }
  return "Left";
}

String getRightButtonText() {
  if (path == 0) {
    return textosBotonDerecho[currentState];
  } else if (path == 1) {
    return textosBotonDerecho[currentState];
  } else if (path == 2) {
    return textosBotonDerecho[currentState];
  }
  return "Right";
}
