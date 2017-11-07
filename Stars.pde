class Stars //note that this class does NOT extend Floater
{
  private double myX, myY;
  public Stars(){
    myX = Math.random()*501;
    myX = Math.random()*501;
  }
  public void show(){
    fill(255);
    ellipse((float)myX,(float)myY,5,5);
  }
}