// declare variables
PImage girl;
PImage cat;
color red = #FF0000;
color pink = #FF7EAB;
color purple = #D074FF;
color blue = #3B9EFF;
color greenBlue = #55FFFE;
color green = #00C12B;
color yellow = #FBFF36;
color orange = #FFA631;
color black = #000000;
float sliderY;
float thickness;
float circleSize;
float imageSize;
color selectedColor;
boolean girlOn;
boolean catOn;

void setup(){
  size(1000, 800);
  background(255);
  strokeWeight(2);
  girl = loadImage("girlchild.png");
  cat = loadImage("cat.png");
  sliderY = 450;
  thickness = 2;
  circleSize = 10;
  imageSize = 160;
  girlOn = false;
  catOn = false;
}

void draw(){
  // tool bar
  fill(100);
  rect(0, 0, 200, 800);
  
  // Stamp tool 
  girlOnOff();
  tactile (5, 20, 95, 130);
  fill(255);
  rect(5, 20, 95, 130);
  image(girl, -28, 20, 160, 130);
  catOnOff();
  tactile (103, 20, 93, 130);
  fill(255);
  rect(103, 20, 93, 130);
  image(cat, 89, 40, 130, 100);
  stroke(0);
  strokeWeight(2);
  
  // color block  
  //1
  colorButton(red, 20, 165, 160, 20);
  //2
  colorButton(pink, 20, 190, 160, 20);
  //3
  colorButton(purple, 20, 215, 160, 20);
  //4
  colorButton(blue, 20, 240, 160, 20);
  //5
  colorButton(greenBlue, 20, 265, 160, 20);
  //6
  colorButton(green, 20, 290, 160, 20);
  //7
  colorButton(yellow, 20, 315, 160, 20);
  //8
  colorButton(orange, 20, 340, 160, 20);
  //9
  colorButton(black, 20, 365, 160, 20);
  
  // color selector
  stroke(0);
  fill(selectedColor);
  circle(100, 565, 80);
  
  // slider
  tactile (90, 395, 20, 125);
  fill(255);
  line(100, 405, 100, 510);
  circle(100, sliderY, 20);
  fill(0);
  circle(100, sliderY, 10);
  noStroke();
  circleSize = map(sliderY, 405, 510, -1, 80);
  imageSize = map(sliderY, 405, 510, 100, 300);
  circle(100, 565, circleSize);
  stroke(0);
  
  // new button
  colorButton(black, 20, 625, 160, 35);
  textSize(25);
  fill(255);
  text("New", 77, 650);
  stroke(0);
  
  // save button
  colorButton(black, 20, 675, 160, 35);
  textSize(25);
  fill(255);
  text("Save", 77, 700);
  stroke(0);
  
  // load button
  colorButton(black, 20, 725, 160, 35);
  textSize(25);
  fill(255);
  text("Load", 77, 750);
  stroke(0);
}

void mouseDragged(){
  if(mouseY > 0 && mouseY < 800 && mouseX > 200 && mouseX < 1000){
    if (girlOn == false && catOn == false){
      // squiggly line
      strokeWeight(thickness);
      stroke(selectedColor);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else if(girlOn == true){
      // image pattern
      image(girl, mouseX, mouseY, imageSize, imageSize*130/160);
    }
    else if(catOn == true){
      // image pattern
      image(cat, mouseX, mouseY, imageSize, imageSize*130/160);
    }
  }
  stroke(0);
  strokeWeight(2);
  controlSlider();
}

void mouseReleased(){
  controlSlider();
  // change color
  if(mouseX > 20 && mouseX < 180 && mouseY > 165 && mouseY < 185){
    selectedColor = red;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 190 && mouseY < 210){
    selectedColor = pink;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 215 && mouseY < 235){
    selectedColor = purple;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 240 && mouseY < 260){
    selectedColor = blue;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 265 && mouseY < 285){
    selectedColor = greenBlue;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 290 && mouseY < 310){
    selectedColor = green;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 315 && mouseY < 335){
    selectedColor = yellow;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 340 && mouseY < 360){
    selectedColor = orange;
  }
  if(mouseX > 20 && mouseX < 180 && mouseY > 365 && mouseY < 385){
    selectedColor = black;
  }
  
  // girl button
  if(mouseX > 5 && mouseX < 100 && mouseY > 20 && mouseY < 150){
    girlOn = !girlOn;
    catOn = false;
  }
  
  //cat button
  if(mouseX > 103 && mouseX < 196 && mouseY > 20 && mouseY < 150){
    catOn = !catOn;
    girlOn = false;
  }
  
  // new button
  if(mouseX > 20 && mouseX < 180 && mouseY > 625 && mouseY < 660){
    fill(255);
    noStroke();
    rect(200, 0, 800, 800);
    selectedColor = black;
    strokeWeight(2);
  }  
  fill(0);
  stroke(0);
  //save
  if(mouseX > 20 && mouseX < 180 && mouseY > 675 && mouseY < 710){
    selectOutput("Choose a name for your image", "saveImage");
  } 
  //load
  if(mouseX > 20 && mouseX < 180 && mouseY > 725 && mouseY < 760){
    selectInput("Pick an image", "openImage");
  }  
  
}

void controlSlider(){
  if(mouseY > 405 && mouseY < 510 && mouseX > 95 && mouseX < 105){
    sliderY = mouseY;
  }
  thickness = map(sliderY, 405, 510, 1, 8);
}


void tactile (int x, int y, int w, int h) {
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    stroke(255);
  }
  else{
    stroke(0);
  }  
}

void girlOnOff(){
  if(girlOn == true){
    stroke(green);
    strokeWeight(5);
  }
  else{
    stroke(0);
    strokeWeight(2);
  }
}

void catOnOff(){
  if(catOn == true){
    stroke(green);
    strokeWeight(5);
  }
  else{
    stroke(0);
    strokeWeight(2);
  }
}

void colorButton(color choose, int x, int y, int w, int h){
  tactile(x, y, w, h);
  fill(choose);
  rect(x, y, w, h);
}

void saveImage(File f){
  if(f!=null){
    PImage canvas;
    canvas = get(200, 0, width-200, height);
    canvas.save(f.getAbsolutePath());
    
  }
}
void openImage(File f){
  if(f!=null){
    PImage pic;
    pic = loadImage(f.getPath());
    image(pic, 200, 0, width-200, height);
    
  }
}

  
