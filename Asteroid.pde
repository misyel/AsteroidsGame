class Asteroid extends Floater{
  private int rotSpd;
  Asteroid(){
    corners = 8;
    int [] xS = {-40,-16,25,30,20,5,-20,-50};
    int [] yS = {-20,-40,-30,-10,-5,30,30,0};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = (int)(Math.random()*5)+1;
    myDirectionY = (int)(Math.random()*5)+1;
    myPointDirection = 0;
    rotSpd = (int)(Math.random()*5)+1;
    
  }
  public void move(){
    rotate(rotSpd);
    super.move();
  }
  public void setX(int x){
      myCenterX = x;
    }
    public int getX(){
      return (int)myCenterX;
    }
    public void setY(int y){
      myCenterY =y;
    }
    public int getY(){
      return (int)myCenterY;
    }
    public void setDirectionX(double x){
      myDirectionX = x;
    }
    public double getDirectionX(){
      return myDirectionX;
    }
    public void setDirectionY(double y){
      myDirectionY = y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection = degrees;
    }
    public double getPointDirection(){
      return myPointDirection;
    }
}