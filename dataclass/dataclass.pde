//Amanda Hernandez
//Final 
//2016 Carbon FootPrints 
//Processing CG314

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int[] Electricty;
String[]neighborhood;
float y = 570;
float x = 25;
float a1 = 600;
int a;
PImage bolt;
PImage plug;

boolean canDraw = false;
int toolList = 0;

String quote3="Yellow bar = Electricity/ Green bar = money";

//Music
import processing.sound.*;
SoundFile file;


void setup () {
  size(960, 600);
  Table stats = loadTable("2016.csv", "header");
  Electricty = new int [stats.getColumnCount()];
  neighborhood = new String [stats.getColumnCount()];
  println(stats.getColumnCount());
  for (int i=6; i<stats.getColumnCount(); i+=2) {
    Electricty[i] = stats.getInt(3, i);
    println(Electricty[i]);
  }
    for (int a =5; a<stats.getColumnCount(); a+=2) {
    Electricty[a] = stats.getInt(4, a);
    println(Electricty[a]);
  }
  
  //images
  plug= loadImage("plug.png");
  
  // music
   file = new SoundFile(this,"Electric.mp3");
   file.loop();
}


 


void draw() {
    if(millis() > 5000){
  file.stop();
  }
  
  background(74, 134, 129);
  stroke(255, 0, 0);
  noFill();
  beginShape();
  for (int i = 0; i <  Electricty.length; i+=2) {
    float x = map(i, 0, Electricty.length-6, 20, width);
    float y = map( Electricty[i], 0, 17000, 200, 20);
    float a1 = map( Electricty[a], 0, 17000, 200, 20);
    stroke(200);
    strokeWeight(3);
    line(x, 50, x, height-50);
    stroke(213, 242, 54);
    vertex(x, y);
  }
  endShape();
  
  //Title
  fill(255);
  textSize(20);
  text("Electrical Carbon Footprints 2016", 350, 29);


  //y axis months  
  stroke(255);   
  fill(245);
  textSize(15);
  text("Jan", 90, y);
  text("Feb", 150, y);
  text("March", 220, y);
  text("April", 300, y);
  text("May", 380, y);
  text("June", 460, y);
  text("July", 540, y);
  text("August", 600, y );
  text("Sept", 690,y);
  text("Oct", 760, y );
  text("Nov", 840, y   );
  text("Dec", 910, y  );

  
 //Buttons
  fill(252, 61, 112);
  rect( x, 160, 100,50);
  fill(41, 125, 255);
  rect( x, 260, 100,50);  
  fill(79, 209, 135);
  rect( x, 360, 100,50);
  fill(245, 161, 35);
  rect( x, 460, 100,50);
  image(plug, x, 40, 50, 50); 
  
  
  //x axis building labels
  stroke(255);   
  fill(255);
  textSize(15);
  text("Building A", x+5, 190);
  text("Building B", x+5, 290);
  text("Building C", x+5, 390 );
  text("Building D", x+5, 490);
 
 //commands
  controllers();
  toolBoxSel();
}
  
  
  void toolBoxSel() {
  if (mousePressed) {
     if (toolList == 0) {//bolt tip
       fill(123, 165, 165);
       noStroke();
       rect(x, 100, 100, 50);
       fill(250, 245, 96);
       textSize(10);
       text(quote3, x, 100, 100, 60);// Helpful tip
     }  
     else if (toolList==1){
     }
   }
  }
 
  
  void controllers() {

  if (mousePressed) {
      //Hint Bolt
     if (mouseX > 5 && mouseX < 100 &&
      mouseY > 35 && mouseY <125) {
      toolList = 0;
      
     }
     //Building A
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 135 && mouseY <225) {
      toolList=1;
    
    }
     //Building B
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 235 && mouseY <325) {
      toolList = 2;
      
    }
        //Building C
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 335 && mouseY <425) {
      toolList = 3;
      
    }
    //Building D
    else if (mouseX > 5 && mouseX < 100 &&
      mouseY > 435 && mouseY <525) {
      toolList = 4;
     
      }
  }  
}