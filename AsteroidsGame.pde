Spaceship spaceship;
Stars[] stars;
public void setup() 
{
  size(500, 500);
  spaceship = new Spaceship();
  stars = new Stars[500];
  for (int i=0; i < stars.length; i++){
    stars[i] = new Stars();
  }
}
public void draw() 
{
  background(255);
  spaceship.move();
  spaceship.show();
  for (int i=0; i < stars.length; i++){
    stars[i].show();
    stars[i].move();
  }
  
} 

public void keyPressed() {
  if (key=='w') { //up
    spaceship.accelerate(0.5);
  }
  if (key=='a') { //left
    spaceship.turn(-20);
  }
  if (key=='s') { //down
    spaceship.accelerate(-0.5);
  }
  if (key=='d') { //right
    spaceship.turn(20);
  }
  if (key=='r') { //hyperspace
    spaceship.setDirectionX(0);
    spaceship.setDirectionY(0);
    spaceship.setX((int)(Math.random()*300)+100);
    spaceship.setY((int)(Math.random()*300)+100);
  }
}