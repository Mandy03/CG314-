class player1 {
  //coordinates stated once more
  float x;
  float y;
  int diameter; //length
  float speed = .5; //movement speed
  
  player1(float tempX, float tempY, int tempDiameter) {
    //stated again for no issues
    x = tempX;
    y = tempY;
   diameter= tempDiameter;
  }


  void slide(){
    //player movement
    if (y > mouseX - BcH/2 && y < mouseX + BcH/2) {
      yDirection = -yDirection;
    }
}
    
    
  void display() { 
   //player
   image(Black,mouseX,mouseY,BcW,BcH);;
  }
 }