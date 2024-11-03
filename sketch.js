// p5.js sketch enlace: https://editor.p5js.org/solpalau1/sketches/kq1es488-

// Video: https://youtu.be/7qP8l44Rweg

let userImage; // Variable en la que se almacena la imágen

let color1, color2;
let posX, posY;
let isMouseOver = false;

function preload() {

  userImage = loadImage('ilusion_optica.png'); // Carga la ilusión óptica de referencia
}

function setup() {
  createCanvas(800, 400); // Resolución de 800x400
  color1 = color(0);
  color2 = color(255);
  posX = width / 2;
  posY = height / 2;
}

function draw() {
  background(255);
  
  // Coloca la imágen en la parte izquierda
  if (userImage) {
    image(userImage, 0, 0, width / 2, height);
  }
  
  // Coloca la ilusión óptica en la parte derecha
  for (let i = width / 2; i < width; i += 50) { // Bucle for anidado
    for (let j = 0; j < height; j += 50) {
      fill(color1);
      stroke('#747373');
      strokeWeight(10);
      rect(i, j, 50, 50);
      fill(color2);
      noStroke();
      ellipse(i, j, 20, 20);
    }
  }
  
  if (checkMouseProximity()) { // Condicionales de if - else
    fill(map(mouseX, width / 2, width, 0, 255), 0, 0); 
    ellipse(posX, posY, 30, 30);
  }
}

function mouseClicked() {
  color1 = color(255);
  color2 = color(0);
}

function keyPressed() {
  if (keyCode === 32) { // 32 es el keyCode de la barra espaciadora
    setup(); // Reinicia el programa
  }
}

function mouseMoved() {
  let distance = dist(mouseX, mouseY, posX, posY);
  if (distance < 15) {
    isMouseOver = true; // Eventos de mouse y teclado para modificación de variables
  } else {
    isMouseOver = false;
  }
}

function checkMouseProximity() { // Función personalizada que retorna un valor boolean
  let distance = dist(mouseX, mouseY, posX, posY);
  return distance < 15;
}
