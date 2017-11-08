class Stars //note that this class does NOT extend Floater
{
  private double myX, myY;
  public Stars(){
    myX = 250;
    myX = 250;
  }
  public void show(){
    fill(255,100,100);
    ellipse((float)myX,(float)myY,5,5);
  }
  public void move(){
    myX = myX + (Math.random()*501);
    myY = myY + (Math.random()*501);
}
}