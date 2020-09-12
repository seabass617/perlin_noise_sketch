int cols, rows;
int scl = 20;
int w = 4000;
int h = 3000;


float[][] terrain;
float flying = 0;

void setup() {
  size (2400, 1800, P3D);
  frameRate(30);
  
  
  cols = w / scl;
  rows = h/ scl;
  
  terrain = new float[cols][rows];
  
}

void draw() {
  
  flying -= 0.03;
  
  float yoff = flying;
   for (int y = 0; y < rows; y++) {
     float xoff = 0;
    for (int x = 0; x < cols; x++) {
       terrain[x][y] = map(noise(xoff,yoff),0,1,-1000,1000);
       xoff += 0.01;
    }
    yoff += 0.01;
   }
   
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2,height/2);
  rotateX(PI/3);
  
  translate(-w/2,-h/2);
  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
       vertex(x*scl, y*scl, terrain[x][y]);
       vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  
  
}

  
