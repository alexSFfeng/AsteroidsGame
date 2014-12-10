SpaceShip soga = new SpaceShip();
Star [] field;
ArrayList <Asteroid> space;
ArrayList <Laser> lux;
boolean keyA [] = new boolean [6];
double points = 1;
int ammo = 15;
boolean gameover = false;
public void setup() 
{
  size(1000,1000);
  field = new Star[230];
  space = new ArrayList <Asteroid>();
  lux = new ArrayList <Laser>();
  for (int i =0; i < field.length; i++)
  {
    field[i] = new Star();
  }
  for (int i =0; i < 18; i++)
  {
    space.add(new Asteroid());

  }
}
public void draw() 
{
 if(gameover == true)
 {
  background(0);
  fill(220,10,10,190);
  textSize(55);
  text("GAMEOVER",500,500);
  text("Score: " + (int)(points), 500,450);
  text("Press R to restart", 500,400);
  textSize(320);
  text("Orz",500,780);
  textAlign(CENTER);
  if(key == 'r') //restart
    {
      soga = new SpaceShip(); 
      space = new ArrayList <Asteroid>();
      lux = new ArrayList <Laser>();
      for (int i =0; i < 18; i++)
      {
      space.add(new Asteroid());
      }
    ammo = 15;
    points = 1;
    gameover = false;
    
    }
 }
else
{
 fill(0,0,0,120);
 rect(0,0,1000,1000);  
 for(int i = 0; i< field.length; i++) //stars background
 {
  field[i].show();

 } 
  for(int i = 0; i < space.size(); i++)//asteroids
 {
  space.get(i).show();
  space.get(i).move();
  double collision = dist(soga.getX(),soga.getY(),space.get(i).getX(),space.get(i).getY()); //if contact with ship, asteroids disappear
   if (collision < 35)
   {
    space.remove(i);
    gameover = true;
    break;
   } 
  if(lux.size() > 0)
  {
   for(int j = 0; j< lux.size(); j++) // if asteroids contact with bullet, asteroids and bullet disappear
   {
   double collision2 = dist(lux.get(j).getX(),lux.get(j).getY(),space.get(i).getX(),space.get(i).getY());
  
   if (collision2 < 35)
    {
    space.remove(i);
    lux.remove(j);
    space.add(new Asteroid());
    ammo = ammo + 2;
    break;
    } 
   }
  }  
 } 
for(int i =0; i < lux.size(); i++)
 {
  lux.get(i).show();
  lux.get(i).move();
  if(lux.get(i).getX() > 990 || lux.get(i).getY() > 990 || lux.get(i).getX() < 10 || lux.get(i).getY() <10 )
  {
    lux.remove(i);
  }
 }
  if(points == 5 || points == 100)
  {
    for(int i =0; i < space.size(); i ++)
    {
    space.get(i).setDirectionX(space.get(i).getDirectionX() * 2);
    space.get(i).setDirectionY(space.get(i).getDirectionY() * 2);  
    }
    space.add(new Asteroid());
    ammo = 15;
  }
 soga.show();
 soga.move();
 oMove();
 points = points + 0.03;
 textSize(45);
 fill(80,20,208,160);
 textAlign(LEFT);
 text("Score :" + (int)(points),40,950);
 text("Ammo Left: " + (int)(ammo),650,950);
}
}
public void keyPressed() //movement control
{
  if(key == 'a'){keyA[0] = true;}
  if(key == 'd'){keyA[1] = true;}
  if(key == 'w'){keyA[2] = true;}
  if(key == 's'){keyA[3] = true;}
  if(key == 'h'){keyA[4] = true;}
  if(key == ' ' && ammo > 0){keyA[5] = true;}

}
 public void keyReleased() // movement restrictions
 {
  if(key == 'a'){keyA[0] = false;}
  if(key == 'd'){keyA[1] = false;}
  if(key == 'w')
  {
    keyA[2] = false;
    stroke(194,78,243,180);
    soga.setColor(194,78,243,180);
  }
  if(key == 's')
  {
    keyA[3] = false;
    stroke(194,78,243,180);
    soga.setColor(194,78,243,180);
  }
  if(key == 'h'){keyA[4] = false;}
  if(key == ' '){keyA[5] =false;}
 }
 public void oMove()
 {
  if(keyA[0] == true){soga.rotate(-7);}
  if(keyA[1] == true){soga.rotate(7);}
  if(keyA[2] == true)
  {
    soga.accelerate(.15);
    stroke(125,249,255);
    soga.setColor(125,249,255,150);
  }
  if(keyA[3] == true)
  {
    soga.accelerate(-.15);
    stroke(249,125,10);
    soga.setColor(249,125,10,150);
  }
  if(keyA[4] == true)  // hyperspace
  {
     soga.setX((int)(Math.random()*500)+250);
     soga.setY((int)(Math.random()*500)+250);
     soga.setDirectionX(0);
     soga.setDirectionY(0);
     for(int i = 0; i< field.length; i++)
     {
      field[i].setS();
     }
     for(int i = 0; i < space.size(); i++)
     {
      space.get(i).setX((int)(Math.random()*1000) + 1);
      space.get(i).setY((int)(Math.random()*1000) +1);
      space.get(i).setDirectionY(((int)(Math.random()*2)+1));
      space.get(i).setDirectionX(((int)(Math.random()*2)+1));
      if(Math.random()<0.5)
      {
        space.get(i).setDirectionY(((int)(Math.random()*2)+1) * -1);
      }
      if(Math.random()<0.5)
      {
        space.get(i).setDirectionX(((int)(Math.random()*2)+1) * -1);
      }
     }
     for(int i = 0; i < lux.size(); i ++)
     {
      lux.remove(i);
      ammo = ammo + 1;
     }
   }
   if(keyA[5] == true && ammo != 0) // ammo
   {
     lux.add(new Laser(soga));
     ammo = ammo - 1;
   }
 }
class Star
{
  private int starX,starY,starSize;
  public Star()
  {
   starX = (int)(Math.random()*1000);
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
   starX = (int)(Math.random()*1000);
   starY = (int)(Math.random()*1000);
   starSize = (int)(Math.random()*5) + 2;
  }
}
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      myCenterX = 500;
      myCenterY = 500;
      myDirectionX = 0;
      myDirectionY = 0;
      myColor = color (194,78,243,180);
      corners = 7;
      myPointDirection = 0;
      xCorners  =  new int [corners];
      yCorners  =  new int [corners];
      xCorners[0] = 20;    yCorners[0] = 0;
      xCorners[1] = 8;     yCorners[1] = -12;
      xCorners[2] = -10;   yCorners[2] = -18;
      xCorners[3] = 0;     yCorners[3] = 0;
      xCorners[4] = -10;   yCorners[4] = 18;
      xCorners[5] = 8;     yCorners[5] = 12;
      xCorners[6] = 20;    yCorners[6] = 0;
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
      public void setColor(int r , int  g , int b, int o){myColor = color (r,g,b,o);}
      public int getmyColor(){return myColor;}
}
class Asteroid extends Floater
{
  int yVariable;
   public Asteroid()
   {
    corners = 8;
    yVariable = 500;
    xCorners = new int [corners];
    yCorners = new int [corners];
    myColor = color(128,115,115,150);
    myCenterX = Math.random()*1000 + 1;
    myCenterY = 500 + yVariable;
    if(Math.random()<0.5)
    {
      yVariable = -yVariable;
    }
    myPointDirection = Math.random()*360;
    xCorners[0] = 22; yCorners[0] = 0;
    xCorners[1] = 8; yCorners[1] = 26;
    xCorners[2] = -15; yCorners[2] = 20;
    xCorners[3] = -22; yCorners[3] = -5;
    xCorners[4] = -8; yCorners[4] = -20;
    xCorners[5] = 9; yCorners[5] = -10;
    xCorners[6] = 18; yCorners[6] = -5;
    xCorners[7] = 22; yCorners[7] = 0; 
    myDirectionY = ((int)(Math.random()*2)+1); myDirectionX = ((int)(Math.random()*2)+1);
    if(Math.random()<0.5)
    {
      myDirectionX = -myDirectionX;
    }     
    if(Math.random()<0.5)
    {
      myDirectionY = -myDirectionY;
    }
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
class Laser extends Floater
{
  
  public Laser(SpaceShip ship)
  {
     myCenterX = ship.getX();
     myCenterY = ship.getY();
     myPointDirection = ship.getPointDirection();
     double dRadians = myPointDirection*(Math.PI/180);
     myDirectionX = 5* Math.cos(dRadians) + ship.getDirectionX();
     myDirectionY = 5* Math.sin(dRadians) + ship.getDirectionY();
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

  public void show()
  {
    fill(230,10,20,180);
    ellipse((int)myCenterX,(int)myCenterY,20,20);
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

