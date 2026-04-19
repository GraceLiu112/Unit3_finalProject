// declare variables
PImage girl;
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

void setup(){
  size(1000, 800);
  background(255);
  strokeWeight(2);
  girl = loadImage("girlchild.png");
  sliderY = 450;
}

void draw(){
  
  fill(100);
  rect(0, 0, 200, 800);
  fill(255);
  rect(20, 20, 160, 130);
  image(girl, 20, 20, 160, 130);
  
  //color block
  fill(red);
  rect(20, 165, 160, 20);
  fill(pink);
  rect(20, 190, 160, 20);
  fill(purple);
  rect(20, 215, 160, 20);
  fill(blue);
  rect(20, 240, 160, 20);
  fill(greenBlue);
  rect(20, 265, 160, 20);
  fill(green);
  rect(20, 290, 160, 20);
  fill(yellow);
  rect(20, 315, 160, 20);
  fill(orange);
  rect(20, 340, 160, 20);
  fill(black);
  rect(20, 365, 160, 20);
  
  // slider
  fill(255);
  stroke(255);
  line(100, 405, 100, 510);
  circle(100, sliderY, 20);
  stroke(0);
  fill(0);
  circle(100, sliderY, 10);
  

}
void mouseDragged(){
  controlSlider();
}

void mouseReleased(){
  controlSlider();
}

void controlSlider(){
  if(mouseY > 405 && mouseY < 510 && mouseX > 95 && mouseX < 105){
    sliderY = mouseY;
  }
}
