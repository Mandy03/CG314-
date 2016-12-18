class Enemies {
  
float r = random(600);
float y = 0;
float BcH=80;

Enemies(float tempX, float tempY, int tempDiameter) {
    //stated again for no issues
    x = tempX;
    y = tempY;
   diameter= tempDiameter;
  }

void fall() {
 background(0); //For smooth player display 
 y = y + 7;
 fill(0,10,200,180);
 image(White, r, y);
 }
}