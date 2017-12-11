Spaceship spaceship;
Stars[] stars;
ArrayList<Asteroid> asteroid = new ArrayList<Asteroid>();
ArrayList<Bullet> bullet = new ArrayList<Bullet>();
public void setup() 
{
  size(500, 500);
  spaceship = new Spaceship();
  stars = new Stars[500];
  for (int i=0; i < stars.length; i++){
    stars[i] = new Stars();
  }
  for (int i=0; i < 10; i++){
    asteroid.add(new Asteroid());
  }
}
public void draw() 
{
  makeStuff();
  collisionCheck();
} 

public void makeStuff(){ //create things for the game
  background(0);
  for (int i=0; i < stars.length; i++){
    stars[i].show();
  }
  for (int i=0; i < asteroid.size(); i++){
    asteroid.get(i).show();
    asteroid.get(i).move();
  }
  for (int i = 0; i < bullet.size(); i++)
  {
    if(bullet.get(i).getX() == 500 || bullet.get(i).getX() == 0){
      bullet.remove(i);
    }
    bullet.get(i).move();
    bullet.get(i).show();
  }
  spaceship.move();
  spaceship.show();
}

public void collisionCheck(){ //check for collisions
 for (int i = 0; i <asteroid.size(); i++)
  {
    for (int x = 0; x < bullet.size(); x++)
    {
      if (dist(bullet.get(x).getX(), bullet.get(x).getY(), asteroid.get(i).getX(), asteroid.get(i).getY()) < 20)
      {
        asteroid.remove(i);
        bullet.remove(x);
        break;
      }
    }
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
  if (key == 'f'){ //bullets
    bullet.add(new Bullet(spaceship));
  }
}