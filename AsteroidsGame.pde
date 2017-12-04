Spaceship spaceship;
Stars[] stars;
ArrayList<Asteroid> asteroid = new ArrayList<Asteroid>();
public void setup() 
{
  size(500, 500);
  spaceship = new Spaceship();
  stars = new Stars[500];
  for (int i=0; i < stars.length; i++){
    stars[i] = new Stars();
  }
  for (int i=0; i < 20; i++){
    asteroid.add(i,new Asteroid());
  }
}
public void draw() 
{
  background(0);
  for (int i=0; i < stars.length; i++){
    stars[i].show();
  }
  for (int i=0; i < 20; i++){
    asteroid.get(i).show();
    asteroid.get(i).move();
  }
  spaceship.move();
  spaceship.show();
  
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