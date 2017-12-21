Spaceship spaceship;
Stars[] stars;
ArrayList<Asteroid> asteroid = new ArrayList<Asteroid>();
ArrayList<sAsteroid> smallAsteroid = new ArrayList<sAsteroid>();
ArrayList<Bullet> bullet = new ArrayList<Bullet>();
boolean start2 = true;
boolean started = false;
//timer stuff
int time;
int wait = 300;
boolean bullets = false;
start startScreen;

public void setup() 
{
  size(900, 900);
  time = millis(); //store current time
  spaceship = new Spaceship();
  stars = new Stars[500];
  for (int i=0; i < stars.length; i++) {
    stars[i] = new Stars();
  }
  for (int i=0; i < 10; i++) {
    asteroid.add(new Asteroid());
  }
  startScreen = new start();
}
public void draw() 
{
  if (start2 == true && started == false) {
    starts();
  }
  if (started == true && start2 == false) {
    makeStuff();
    collisionCheck();
  }
} 

public void starts() { // menu screen
  startScreen.show();
  startScreen.check();
  for (int i=0; i < stars.length; i++) {
    stars[i].show();
  }
  //text("START",200,310);
}

public void makeStuff() { //create things for the game
  background(0);
  for (int i=0; i < stars.length; i++) {
    stars[i].show();
  }
  for (int i=0; i < asteroid.size(); i++) {
    //noFill();
    asteroid.get(i).show();
    asteroid.get(i).move();
  }
  for (int i =0; i<smallAsteroid.size(); i++) {
    smallAsteroid.get(i).show();
    smallAsteroid.get(i).move();
  }
  for (int i = 0; i < bullet.size(); i++)
  {
    bullet.get(i).move();
    bullet.get(i).show();
  }
  spaceship.move();
  spaceship.show();
}

public void collisionCheck() { //check for collisions
  for (int i = 0; i <asteroid.size(); i++)
  {
    for (int x = 0; x < bullet.size(); x++)
    {
      if (dist(bullet.get(x).getX(), bullet.get(x).getY(), asteroid.get(i).getX(), asteroid.get(i).getY()) < 20)
      {
        asteroid.remove(i);
        bullet.remove(x);
        smallCollision();
        break;
      }
    }
  }
}

public void smallCollision() {
  for (int o=0; o<4; o++) {
    smallAsteroid.add(new sAsteroid());
    for (int p = 0; p < bullet.size(); p++) {
      if ((get(smallAsteroid.get(o).getX(), smallAsteroid.get(o).getY())) == (get(bullet.get(p).getX(), bullet.get(p).getY())))
      {
        smallAsteroid.remove(o);
        //System.out.println("destroying small asteroid");
        bullet.remove(p);
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
    spaceship.setX((int)(Math.random()*800)+100);
    spaceship.setY((int)(Math.random()*800)+100);
  }
  if (key == 'f') { //bullets
    if (bullets == false) {
      bullet.add(new Bullet(spaceship));
      bullets = true;
    }
    if (bullets == true) {
      if (millis() - time >= wait) {
        bullets = false;//if it is, do something
        time = millis();//also update the stored time
      }
    }
  }
}