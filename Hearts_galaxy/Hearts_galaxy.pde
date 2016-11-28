PImage K;
PShape Ball;
PShape Box;
PImage P;
float x, y, z;
float rotation = PI/48;


void setup() {
 size(800, 600, P3D); 
 
 //Ball
  sphereDetail(40);
  noStroke();
  K=loadImage("HelloK.jpeg");
  Ball = createShape(SPHERE, 100);
  Ball.setTexture(K); 
  
  //Box
  noStroke();
  P=loadImage("Present.jpg");
  Box = createShape(BOX,100,100,100);
  Box.setTexture(P);
  
}

void draw() {
background(0);  
translate(width/2, height/2, 0);
lights();
rotateY(rotation/2);
noStroke();
smooth();
strokeWeight(2);

//Heart
  fill(237,72,72);
  beginShape(POLYGON);
  fill(237,72,72);
  vertex(50,15);
  bezierVertex(50,-5,90,5,50,40);
  fill(237,72,72);
  vertex(50,15);
  bezierVertex(50,-5,10,5,50,40);
  endShape();

//Ball
  translate(5+width, 2, 0);
  rotateX(rotation);
  Ball.rotateY(radians(1));
  shape(Ball, 0, 0);
  


//Box
translate(width/2+4, height/2, 0);
lights(); 
Box.rotateY(radians(1));
shape(Box,0,0);

  rotation+=radians(0.5);
}