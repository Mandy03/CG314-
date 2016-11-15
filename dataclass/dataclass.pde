//Amanda Hernandez
//Homework Data
//Desserts

int[] Popularity;

void setup () {
  size(480, 220);
  Table stats = loadTable("Desserts.csv", "header");
  Popularity = new int [stats.getRowCount()-2];
  for (int i=0; i<stats.getRowCount()-2; i++) {
  Popularity[i] = stats.getInt(i, 4);
  }
}


void draw() {
  background(255);
  stroke(255, 0, 0);
  noFill();
  beginShape();
  for (int i = 0; i <  Popularity.length; i++) {
    float x = map(i, 0,  Popularity.length-1, 20, 460);
    float y = map( Popularity[i], 0, 60, 100, 20);
    stroke(200);
    line(x, 0, x, height);
    stroke(59, 216, 131);
    vertex(x,y);
  }
  endShape();
  
}