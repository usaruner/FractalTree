private double fractionLength = 0.8; 
private int smallestBranch = 10; 
private double branchAngle1 ;  
private double branchAngle2 ;  
public void setup() 
{   
  size(640,480);    
    
} 
public void draw() 
{   
  fractionLength = 1 - (mouseY *.0018)- .18 ;
  background(0);
  branchAngle1 =  (mouseX * .002) ;
  branchAngle2 = 1 - (mouseX * .002) ;
  pushMatrix();
  stroke(0,255,0);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);
  popMatrix();//will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{    
double ang1 =   angle + branchAngle1;
double ang2 =   angle - branchAngle2;
branchLength *= fractionLength;
int endX1 = (int)(branchLength*Math.cos(ang1) + x);
int endY1 = (int)(branchLength*Math.sin(ang1) + y);
int endX2 = (int)(branchLength*Math.cos(ang2) + x);
int endY2 = (int)(branchLength*Math.sin(ang2) + y);
line(x,y,endX2,endY2);
line(x,y,endX1,endY1);
if (branchLength > smallestBranch){
drawBranches(endX1,endY1,branchLength,ang1);
drawBranches(endX2,endY2,branchLength,ang2);
}
} 
