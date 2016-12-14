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

import processing.video.*;
Movie myMovie;


int growth=60;         // initial size ofbolts
int increment=1;      // larger increment /faster pulsating-speed

int[] Electricty;
int [] Electricity2;
int [] Electricity3;
int [] Electricity4;
String[]neighborhood;
float y = 570;
float x = 25;
PImage bolt;
PImage plug;


boolean canDraw = false;
int toolList = 0;

//Rules tip
String quote3="Yellow bar = Electricity/ Bolt= High Energy Wasted";

//Total
String quote4="*Total Waste of Energy*  Building A= 201,550, Building B= 157,954, Building C= 173,622, BuildingD= 103,793";


void setup () {
  size(960, 600); 
  stroke(100);
  smooth();
  

  
  //Table count
  Table stats = loadTable("2016.csv", "header");
  Electricty = new int [stats.getColumnCount()];
  Electricity2 = new int [stats.getColumnCount()];
  Electricity3=new int [stats.getColumnCount()];
  Electricity4=new int [stats.getColumnCount()];
  neighborhood = new String [stats.getColumnCount()];
  println(stats.getColumnCount());
  for (int i=6; i<stats.getColumnCount(); i+=1) {
    Electricty[i] = stats.getInt(2, i);
    Electricity2[i] = stats.getInt(3, i);
    Electricity3[i] = stats.getInt(4, i);
    Electricity4[i] = stats.getInt(5, i);
    println(Electricty[i]);
    println(Electricity2[i]);
    println(Electricity3[i]);
    println(Electricity4[i]);
  }
   
  //images
  plug= loadImage("plug.png");
  bolt= loadImage("bolt.png"); 
  
 //LVMH Video
  myMovie = new Movie(this, "LVMH.mov");
  myMovie.loop();
}


void draw() { 
  background(74, 134, 129);
  stroke(255, 0, 0);
  noFill();
  beginShape();
  
  //Find Rows/ Data
  for (int i = 0; i <  Electricty.length; i+=2) {
    float x = map(i, 0, Electricty.length-2, 53, width);
    float y = map( Electricty[i], 0, 17010, 282, 187);  
    float y2 = map( Electricity2[i], 0, 16710, 661, 402);
    float y3 = map( Electricity3[i], 0, 17000, 676, 291);
    float y4 = map( Electricity4[i], 0, 17000, 800, 300);
    stroke(200);
    strokeWeight(3);
    line(x, 50, x, height-50);
    stroke(213, 242, 54);
    vertex(x, y);
  }
  endShape();
  
     // Building A
   beginShape();
  for (int i = 0; i <  Electricty.length; i+=2) {
    float x = map(i, 0, Electricty.length-6, 20, width);
    float y = map( Electricity4[i], 0, 17000, 184, 67);
    strokeWeight(3);
    stroke(213, 242, 54);
    vertex(x, y);
  }
  endShape();
  //Building C
  beginShape();
  for (int i = 0; i <  Electricty.length; i+=2) {
    float x = map(i, 0, Electricty.length-6, 20, width);
    float y = map( Electricity2[i], 0, 17100, 388, 335);
    strokeWeight(3);
    stroke(213, 242, 54);
    vertex(x, y);
  }
  endShape();
   // Building D
   beginShape();
  for (int i = 0; i <  Electricty.length; i+=2) {
    float x = map(i, 0, Electricty.length-6, 20, width);
    float y = map( Electricity3[i], 0, 17000, 483, 403);
    
    strokeWeight(3);
    stroke(213, 242, 54);
    vertex(x, y);
    
  }
  endShape();
  

  
  //Title
  fill(255);
  textSize(20);
  text("Electrical Carbon Footprints 2016", 350, 29);


  //Y Axis months  
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

  
 //X Axis Buttons
  fill(252, 61, 112);
  rect( x, 160, 100,50);
  fill(41, 125, 255);
  rect( x, 260, 100,50);  
  fill(79, 209, 135);
  rect( x, 360, 100,50);
  fill(245, 161, 35);
  rect( x, 460, 100,50);
  image(plug, x, 40, 50, 50); 
  
  
  //X Axis building labels
  stroke(255);   
  fill(255);
  textSize(15);
  text("Building A", x+5, 190);
  text("Building B", x+5, 290);
  text("Building C", x+5, 390 );
  text("Building D", x+5, 490);
 
 //Commands
  controllers();
  toolBoxSel();
}
  
  // Button Assignments
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
   // Building A 
  image(myMovie, mouseX, mouseY);
     }
     else if (toolList==4){
       fill(123, 165, 165);
       rect( x, 460, 600,50);
       fill(255);
       text(quote4,x+3,465,600,50);
}
  }
  }

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

  //Command control
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
       print("here");
    
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
  fill(255); 
 
  //Building A coordinates
     image(bolt,210, 110, growth, growth);
     text("15506", 200, 100); 
     image(bolt,280, 90, growth, growth);
     text("17434", 270, 80); 
     image(bolt,720, 100, growth, growth);
     text("16550", 730, 90); 
     image(bolt,860, 100, growth, growth);
     text("19268", 850, 90); 
     
     //Building B coordinates
     image(bolt,210, 180, growth, growth);
     text("12363", 200, 170); 
     image(bolt,390, 160, growth, growth);
     text("12136", 380, 160); 
     image(bolt,630, 150, growth, growth);
     text("14287", 620, 140); 
     image(bolt,870, 150, growth, growth);
     text("14648", 870, 140); 
    
     //Building C coordinates
     image(bolt,210, 320, growth, growth);
     text("13694", 200, 310); 
     image(bolt,720, 320, growth, growth);
     text("14722", 710, 310); 
     //Building D coordinates
     image(bolt,210, 390, growth, growth);
     text("8508", 200, 380); 
     image(bolt,280, 380, growth, growth);
     text("8834", 270, 370); 
   
     // Growth Animation Bolts
     growth=growth+increment;
  if(growth>60) {increment=increment*-1;}  //max ellipse size
  if(growth<40) {increment=+1;}            //min ellipse size
  
}