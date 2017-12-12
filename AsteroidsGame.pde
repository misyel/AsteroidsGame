Spaceship spaceship;
Stars[] stars;
ArrayList<Asteroid> asteroid = new ArrayList<Asteroid>();
ArrayList<Bullet> bullet = new ArrayList<Bullet>();
boolean start = true;
boolean started = false;
float x = 170;
float y = 250;
float w = 200;
float h = 80;
int time;
int wait = 1000;
boolean bullets = false;

public void setup() 
{
  size(500, 500);
  time = millis(); //store current time
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
  if(start == true && started == false){
    starts();
  }
  if(started == true && start == false){
    makeStuff();
    collisionCheck();
  }
} 

public void starts(){ // menu screen
  background(0);
   rect(x,y,w,h);
   fill(255);
   /*
   for (int i=0; i < stars.length; i++){
    stars[i].show();
  }
  */
  text("START",200,310);
   if(mousePressed){ //button
     if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
       start = false;
       started = true;
       //fill(0);
    
  }
 } 
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
   if(bullets == false){
      bullet.add(new Bullet(spaceship));
      bullets = true;
    }
    if(bullets == true){
      if(millis() - time >= wait){
        println("tick");//if it is, do something
        time = millis();//also update the stored time 
      }
      else{
        bullets = false;
      }
    }
  }
}