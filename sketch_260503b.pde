float cloudX = 0;

void setup() {
  size(800, 500);
}

void draw() {
  background(235, 225, 205); 
  
  drawSkyPattern();
  drawLondonStreet();
}

void drawSkyPattern() {
  // soft watercolor-style pattern
  noStroke();
  fill(210, 230, 220, 80);
  for (int x = 0; x < width; x += 80) {
    ellipse(x + cloudX, 80, 120, 60);
  }
  
  fill(245, 190, 190, 80);
  for (int x = 40; x < width; x += 120) {
    ellipse(x, 130, 90, 45);
  }
}

void drawLondonStreet() {
  // buildings
  for (int x = 0; x < width; x += 130) {
    
    // red-brown palette
    if (x % 260 == 0) {
      fill(150, 70, 60);   
    } else {
      fill(120, 80, 60);   
    }
    
    rect(x, 120, 120, 250);
    
    // roof
    fill(70, 60, 55);
    triangle(x, 120, x + 60, 70, x + 120, 120);
    
    // windows
    fill(245, 235, 200);
    noStroke();
    for (int y = 150; y < 330; y += 60) {
      rect(x + 25, y, 25, 35);
      rect(x + 70, y, 25, 35);
    }
    
    // brick pattern
    stroke(100, 60, 50, 120);
    strokeWeight(1);
    
    for (int y = 130; y < 360; y += 15) {
      line(x, y, x + 120, y);
    }
    
    for (int y = 130; y < 360; y += 30) {
      for (int i = 0; i < 5; i++) {
        float offset = (y / 30 % 2 == 0) ? 0 : 12;
        line(x + i * 24 + offset, y, x + i * 24 + offset, y + 15);
      }
    }
  }
  
  // street
  fill(120, 115, 105);
  rect(0, 370, width, 130);
  
  // brick pattern on street
  stroke(90, 85, 80);
  for (int y = 390; y < height; y += 25) {
    line(0, y, width, y);
  }
  for (int x = 0; x < width; x += 60) {
    line(x, 370, x - 30, height);
  }

}
