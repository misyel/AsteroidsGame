class start {
  PImage img;
  PImage img2;
  float x = 350;
  float y = 400;
  float w = 180;
  float h = 80;
  start() {
    img=loadImage("Asteroids.png");
    img2=loadImage("Start.png");
  }
  public void show() {
    background(0);
    image(img, 0, 50, 900, 180);
    rect(x, y, w, h);
    image(img2, x, y, w, h);
    fill(255);
  }
  public void check(){
    if (mousePressed) { //button
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
      start2 = false;
      started = true;
      fill(0);
    }
  }
  }
}