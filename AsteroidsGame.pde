Spaceship spaceship;
public void setup() 
{
  size(500, 500);
  spaceship = new Spaceship();
}
public void draw() 
{
  background(255);
  spaceship.move();
  spaceship.show();
} 

public void KeyPressed() {
  if (key=='w') { //up
    spaceship.accelerate(0.5);
  }
  if (key=='a') { //left
    spaceship.turn(-20);
  }
  if (key=='s') { //down
    spaceship.accelerate(0.5);
  }
  if (key=='d') { //right
    spaceship.turn(20);
  }
  if (key=='r') { //hyperspace
  }
}