SpaceShip soga = new SpaceShip();
Star [] field;
Asteroid [] space;
public void setup() 
{
  size(600,1000);
  field = new Star[200];
  space = new Asteroid[8];
  for (int i =0; i < field.length; i++)
  {
    field[i] = new Star();
  }
  for (int i =0; i < space.length; i++)
  {
    space[i] = new Asteroid();
  }
}
public void draw() 
{
 fill(0,0,0,120);
 rect(0,0,600,1000);  
 for(int i = 0; i< field.length; i++)
 {
  field[i].show();

 } 
  for(int i = 0; i< space.length; i++)
 {
  space[i].show();
  space[i].move();
 } 
 soga.show();
 soga.move();

}
public void keyPressed()
{
  if(key == 'a')
  {
    soga.rotate(-7);
  }
  if(key == 'd')
  {
    soga.rotate(7);
  }
  if(key == 'w')
  {
    soga.accelerate(.15);
  }
  if(key == 's')
  {
    soga.accelerate(-.15);
  }
  if(key == ' ')
  {
    soga.setX((int)(Math.random()*300)+150);
    soga.setY((int)(Math.random()*500)+250);
    soga.setDirectionX(0);
    soga.setDirectionY(0);
     for(int i = 0; i< field.length; i++)
     {
      field[i].setS();
     }
     for(int i = 0; i < space.length; i++)
     {
      space[i].setX((int)(Math.random()*600) + 1);
      space[i].setY((int)(Math.random()*1000) +1);
     }
  }
}
class Star
{
  private int starX,starY,starSize;
  public Star()
  {
   starX = (int)(Math.random()*600);
   starY = (int)(Math.random()*1000);
   starSize = (int)(Math.random()*5) + 2;
  }
  public void show()
  {
    fill(255);
    ellipse(starX,starY,starSize,starSize);
  }
  public void setS()
  {
   starX = (int)(Math.random()*600);
   starY = (int)(Math.random()*1000);
   starSize = (int)(Math.random()*5) + 2;
  }
}
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      myCenterX = 300;
      myCenterY = 500;
      myDirectionX = 0;
      myDirectionY = 0;
      myColor = color (194,78,243,180);
      corners = 7;
      myPointDirection = 0;
      xCorners  =  new int [corners];
      yCorners  =  new int [corners];
      xCorners[0] = 30;    yCorners[0] = 0;
      xCorners[1] = 8;     yCorners[1] = -12;
      xCorners[2] = -18;   yCorners[2] = -18;
      xCorners[3] = 0;     yCorners[3] = 0;
      xCorners[4] = -18;   yCorners[4] = 18;
      xCorners[5] = 8;     yCorners[5] = 12;
      xCorners[6] = 30;    yCorners[6] = 0;
    }
      public void setX(int x){myCenterX = x;}
      public int getX(){return (int)myCenterX;}
      public void setY(int y){myCenterY = y;}
      public int getY(){return (int)myCenterY;}
      public void setDirectionX(double x){myDirectionX =x;}   
      public double getDirectionX(){return myDirectionX;}  
      public void setDirectionY(double y){myDirectionY = y;}
      public double getDirectionY(){return myDirectionY;}   
      public void setPointDirection(int degrees){myPointDirection = degrees;}   
      public double getPointDirection(){return myPointDirection;}
}
class Asteroid extends Floater
{
   public Asteroid()
   {
    corners = 8;
    xCorners = new int [corners];
    yCorners = new int [corners];
    myColor = color(128,115,115,150);
    myCenterX = Math.random()*600 + 1;
    myCenterY = Math.random()*1000 +1;
    myPointDirection = Math.random()*360;
    xCorners[0] = 22; yCorners[0] = 0;
    xCorners[1] = 8; yCorners[1] = 26;
    xCorners[2] = -15; yCorners[2] = 20;
    xCorners[3] = -22; yCorners[3] = -5;
    xCorners[4] = -8; yCorners[4] = -20;
    xCorners[5] = 9; yCorners[5] = -10;
    xCorners[6] = 18; yCorners[6] = -5;
    xCorners[7] = 22; yCorners[7] = 0; 
    myDirectionY = (int)(Math.random()*4)-2; myDirectionX = (int)(Math.random()*4)-2;
   }
   public void setX(int x){myCenterX=x;}
   public int getX(){return (int)myCenterX;}
   public void setY(int y){myCenterY = y;}
   public int getY(){return (int)myCenterY;}
   public void setDirectionX(double x){myDirectionX = x;}
   public double getDirectionX(){return myDirectionX;}
   public void setDirectionY(double y){myDirectionY = y;}
   public double getDirectionY(){return myDirectionY;}  
   public void setPointDirection(int degrees){myPointDirection = degrees;}
   public double getPointDirection(){return myPointDirection;}
   public void move()
   {
        //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myPointDirection = myPointDirection + 1;
    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    } 
   }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

