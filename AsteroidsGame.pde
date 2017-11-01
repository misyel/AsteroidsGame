Spaceship spaceship;
double direction;
public void setup() 
{
  size(500, 500);
  spaceship = new Spaceship();
  direction = 0;
}
public void draw() 
{
  spaceship.show();
  spaceship.move();
}

public void KeyPressed() {
  if (key=='w') { //up
    spaceship.accelerate(5);
  }
  if (key=='a') { //left
     direction = spaceship.getX() - spaceship.getDirectionX();
      spaceship.move();
  }
  if (key=='s') { //down
    direction = spaceship.getPointDirection() - 1;
  }
  if (key=='d') { //right
    direction = spaceship.getPointDirection() + 1;
  }
  if (key=='r') { //hyperspace
  }
}