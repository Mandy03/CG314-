//Johnathan Morerro
//Final Project
//Chess

//Loading Minim sound program
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Loading Video program
import processing.video.*;

//movie label
Movie myMovie;

//Music label
Minim minim; 
AudioPlayer Music; 

//Images
PImage Black;
PImage White;

//Player height and width
float BcH = 80;
float BcW= 80;

//coordinates
float x;
float y;

//player coordinates
float diameter = 20;
float radius = diameter/2;
float xDirection = 5;
float yDirection = 5;

///Class Labels
//Player 
player1 BC;
Enemies WC;


void setup(){
  size(900,650);
  background(0);
  smooth();
  
  //Load Images
  Black= loadImage("BlackC.png");
  White= loadImage("WhiteC.png");

  //Player Abbreviations
  BC= new player1(BcW,BcH,50);
  //Enemy Abbreviations
  WC= new Enemies (BcW,BcH,50);
  
  //Song Auto play
  minim = new Minim(this);
  Music = minim.loadFile("Intense.mp3", 2048);
  Music.play();
  Music.loop();
}

void draw(){
 
 //tells it what to do

 WC.fall(); 
 BC.slide();
 BC.display();

}