class Spaceship extends Floater
{   
  Spaceship(){
    corners = 4;
    int [] xS = {-8,16,-8,-2};
    int [] yS = {-8,0,8,0};
    xCorners = xS;
    yCorners = yS;
    myColor = 0;
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 3;
    myDirectionY = 3;
    myPointDirection = 270;
    
  }
    public void setX(int x){
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