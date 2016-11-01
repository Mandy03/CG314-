//Amanda Hernandez
//Midterm
//Processing CG314

float x;
float y;
float px;
float py;
float easing =0.05;

float angle=0.9;
float offset =340;
float scalar= 20;
float speed=0.1;

PImage pencil;
PImage sparkle;
PImage abc;
PImage eraser;
PImage notepad;
PImage water;
PImage love;
PImage Pumpkin;
PImage Burger;

PImage spaceIcon;
PImage crayonIcon;
PImage fancyIcon;
PImage lope;

PImage paperclip1;
PImage paperclip2;

PFont space;
PFont fancy;

boolean canDraw = false;
int toolList = 0;
color[] colarray = {
  color(0), 
  color(111, 136, 165), 
  color(250, 146, 245), 
  color(255, 123, 75), 
  color(226, 70, 29), 
  color(139, 123, 139), 
  color(186, 95, 74), 
  color(146, 39, 255), 
  color(16, 255, 0), 
  color(253, 226, 62)}; 
int colorSelect = 0;

String quote="Letter Set Design";
String quote1="click on new sheet";
String quote2="or click on a letter set to start!";
String quote3="*Tip from Clip* !!!To type press the ABC button! Hold down a key and click to type that letter. But understand that each letter is individually entered";
String quote4="Created by: Amanda Hernandez";

//Music
import processing.sound.*;
SoundFile file;

//Intro Zoom
float myScale=1;

void setup() {
  size(800, 600);
  fill(200, 180, 255);
  smooth();
  rect(0, 0, 800, 600);

  //images
  pencil= loadImage("pencil.png");
  sparkle = loadImage("sparkle.png");
  eraser=loadImage("eraser.png");
  abc= loadImage("abc.png");
  water=loadImage("water.png");
  love=loadImage("love.png");
  Pumpkin=loadImage("Pumpkin.png");
  Burger=loadImage("Burger.png");
  crayonIcon=loadImage("crayonIcon.png");
  spaceIcon=loadImage("spaceIcon.png");
  fancyIcon=loadImage("fancyIcon.png");
  lope= loadImage("Envelope.png");
  paperclip1=loadImage("paperclip1.png");
  paperclip2=loadImage("paperclip2.png");

  //Music
   file = new SoundFile(this,"music_box.mp3");
   file.loop();
}


void draw() {
  if(millis() > 5000){
  file.stop();
  }

  fill(200, 180, 255);
  smooth();
  rect(0, 0, 800, 600);

  //Instructions

  fill(255);
  textSize(64);
  text(quote, 180, 200);// Title of Game
  textSize(20);
  text(quote4, 260, 230);// Name
  textSize(40);
  text(quote1, 230, 300);// Instructions
  text(quote2, 130, 340);// Instructions


  if (myScale > 0) {
    translate(-0, 0);
    scale(myScale);
    myScale= myScale+0.000070;
  }

  list();
  colorPicker();
  controllers();
  toolBoxSel();
}

void newCanvas() {

  canDraw = true;
  strokeWeight(10);
  fill(200, 180, 255);
  rect(100, 30, 700, 570);
  fill(255);
  rect(150, 60, 600, 500);
}

void waterSet() {
  canDraw=true;
  fill(200, 180, 255);
  rect(100, 30, 700, 570);
  image(water, 150, 60, 600, 500);
}

void loveSet() {
  canDraw=true;
  fill(200, 180, 255);
  rect(100, 30, 700, 570);
  image(love, 150, 60, 600, 500);
}

void PumpkinSet() {
  canDraw=true;
  fill(200, 180, 255);
  rect(100, 30, 700, 570);
  image(Pumpkin, 150, 60, 600, 500);
}

void BurgerSet() {
  canDraw=true;
  fill(200, 180, 255);
  rect(100, 30, 700, 570);
  image(Burger, 150, 60, 600, 500);
}
void Envelope() {//Envelope
  canDraw= true;
  fill(200, 180, 255);
  rect(100, 30, 700, 570);
  image(lope, 150, 60, 600, 500);
}


void toolBoxSel() {


  if (canDraw) {
    fill(colarray[colorSelect]);
    if (mousePressed) {
      if (toolList == 0) { //Draw

        float targetX = mouseX;
        x +=(targetX-x) * easing;
        float targetY = mouseY;
        y +=(targetY- y) * easing;
        float weight = dist(x, y, px, py);
        strokeWeight(weight);
        line(x, y, px, py);
        py=y;
        px=x;
        stroke(1, (random(100, 255)), random(100, 255));
      }
      if (toolList == 1) { //erase
        fill(255);
        ellipse(mouseX, mouseY, 30, 30);
        noStroke();
      }
      if (toolList == 2) { //sparkle
        image (sparkle, mouseX, mouseY, 50, 50);
      }
      if (toolList == 3) { //ABC
        textSize (50);
        text(key, pmouseX, pmouseY, 12);         
        fill(0);
      }
      if (toolList == 4) {//fancy feather
        image(fancyIcon, mouseX, mouseY, 50, 50);
      }
      if (toolList == 5) {//paperClip Tip
        fill(98, 125, 216);
        rect(650, 370, 125, 145);
        fill(250, 245, 96);
        textSize(10);
        text(quote3, 660, 370, 100, 200);// Helpful tip
      }
      if (toolList == 6 ) {//Space
        image(spaceIcon, mouseX, mouseY, 50, 50);
      }
    }
  }
}

void controllers() {

  if (mousePressed) {

    //New Canvas
    if (mouseX > 740 && mouseX < width &&
      mouseY > 15 && mouseY <height) {
      newCanvas();
    } 
    //Draw
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 35 && mouseY <125) {

      toolList = 0;
    }
    //erase
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 135 && mouseY <225) {
      toolList = 1;
    }
    //sparkle
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 235 && mouseY <325) {
      toolList = 2;
    }
    //ABC
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 335 && mouseY <425) {
      toolList = 3;
    }
    //waterset
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 435 && mouseY <525) {
      waterSet();
    }
    //loveset
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 450 && mouseY <530) {
      loveSet();
    }
    //Pumpkinset
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 480 && mouseY <540) {
      PumpkinSet();
    }
    //Burgerset
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 490 && mouseY <550) {
      BurgerSet();
    }
    //Fancy feather
    else if (mouseX > width-400 && mouseX < width &&
      mouseY > height-20 && mouseY <height) {

      toolList=4;
      //print("here");
    }
    //PaperClip Tip
    else if (mouseX > width-100 && mouseX < width &&
      mouseY > height-30 && mouseY <height) {
      toolList=5;
    }
    //Envelope
    else if (mouseX > width-600 && mouseX < width &&
      mouseY > height-20 && mouseY <height) {   
      Envelope();
      // print("here");
    }
    //space
    else if (mouseX > width-300 && mouseX < width &&
      mouseY > height-20 && mouseY <height) {   
      toolList=6;
    }
  }
}

void colorPicker() {
  int sxPos = 200;
  int col;

  for (int i = 0; i<10; i++) {
    col = color(colarray[i]);
    fill(col);
    ellipse(sxPos, 15, 30, 30);
    if (mousePressed) {
      if (mouseX >sxPos && mouseX <sxPos+30 && mouseY<30) {
        colorSelect = i;
        println(colorSelect);
      }
    }
    sxPos+=40;
  }
}

void list() {

  //Stamps bar
  fill(0);
  rect(0, 50, 100, 900);

  //stamp buttons
  fill(64, 190, 227);
  int startY = 30;
  for (int i = 0; i <4; i++) {
    rect(0, startY, 100, 100);
    startY+=100;
  }
  int startY2 = 85;
  fill(200);
  for (int i = 0; i <4; i++) {
    if (toolList == i) fill(#14C4C9);
    ellipse(50, startY2, 90, 90);
    fill(200, 180, 255);
    startY2+=100;
  }

  //Stamp Icons
  fill(colarray[colorSelect]);
  image (pencil, 30, 50, 70, 70);
  image (sparkle, -5, 320, 110, -80);
  image(abc, 15, 345, 70, 70);
  image(eraser, 20, 150, 70, 70);
  image(water, 0, 430, 100, 100);
  image(love, 0, 460, 100, 100);
  image(Pumpkin, 0, 490, 100, 100);
  image(Burger, -5, 520, 110, 100);

  //top center window
  fill(200, 180, 255);
  rect(0, 0, 1600, 30);

  //New Canvas button
  fill(64, 190, 227);
  ellipse(740, 15, 100, 30);
  fill(255);
  textSize(14);
  text("New Sheet", 705, 20);

  //Envelope button
  fill(64, 190, 227);
  rect(260, 540, 100, 100);
  image(lope, 273, 540, 70, 60);

  //space Icon
  fill(64, 190, 227);
  rect(540, 540, 100, 100);
  image(spaceIcon, 560, 550, 50, 40);


  //space Icon
  fill(64, 190, 227);
  rect(400, 540, 100, 100);
  image(fancyIcon, 430, 550, 50, 50);

  //Animated paper clip
  fill(200, 180, 255);
  float y1= offset +sin(angle)*scalar;
  rect(700, y1+200, 100, 100);
  image(paperclip1, 700, y1+200, 100, 100);

  angle+=speed;
}