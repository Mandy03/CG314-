//Amanda Hernandez
//Video Homework

//Press "s" to take picture!

import processing.video.*;
Capture video;

//Snow
int amount = 100;

float [] x = new float [amount];
float [] y = new float [amount];
float [] shade = new float [amount];
float [] diameter = new float [amount];

//Image
PImage Christmas;
PImage SnowFlake;

boolean canDraw = false;
int toolList = 0;

// Quote
String quote="Merry Christmas!";

//Music
import processing.sound.*;
SoundFile file;


void setup() {
  size(600,680);
  video = new Capture(this, 640, 480);
  video.start();
  Christmas= loadImage ("Christmas.png");
  SnowFlake= loadImage ("Snowflake.png");
  
   for (int i = 0; i<x.length; i++) {
    x[i] = random (1, width);
    y[i] = random(1, height);
    shade[i] = random (100, 220);
    diameter[i] = random (10, 8);
  }
   //Music
   file = new SoundFile(this,"christmas_ringtone.mp3");
   file.loop();
}



void draw() {
  //Music
  if(millis() > 5000){
  file.stop();
  }
  
  background(0);
  image(video, 0, 0);
  image(Christmas,-200,-200);  
   
  //Greeting
  fill(255);
  textSize(64);
  text(quote, 40, 600);// Merry Christmas!
  
   for (int i = 0; i<x.length; i++) {
    fill(shade[i]);
    ellipse(x[i], y[i], diameter[i], diameter[i]);
    y[i]+= 0.1;
    if (y[i]>height) {
      y[i] = 0;
    }
  }
  }
  

    void toolBoxSel() {
      if (toolList==1) { //erase
        image(SnowFlake, mouseX, mouseY, 100, 100);
      }
    }
  
  void controllers() {
    //Snowfake
    if (mouseX > 5 && mouseX < 100 &&
      mouseY > 335 && mouseY <425) {
      toolList = 1;
      
          print("here");
    }
    
     //Snowflake Icon
 image(SnowFlake, 0, 460, 100, 100);
      
}
// save Image
void keyPressed() {
 if (key== 's') {
    save("image.jpg");
 }
 }


 
 

void captureEvent(Capture video) {
  video.read();
}