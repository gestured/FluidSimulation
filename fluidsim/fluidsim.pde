final int N = 128;
final int iter = 16;
final int Scale = 5;
float t = 0;
Fluid fluid;
void settings(){
  size(N*Scale,N*Scale);
}
void setup(){
  fluid = new Fluid(0.2 , 0 , 0.0000001);
}

void mouseDragged(){
    fluid.addDensity(mouseX/Scale , mouseY/Scale  ,255);
    int amtX = mouseX  - pmouseX;
    int amty = mouseY - pmouseY;
    fluid.addVelocity(mouseX/Scale , mouseY/Scale  ,amtX , amty);
}

void draw(){
  background(0);
  int cx = int(0.5*width/Scale) ;
  int cy = int(0.5*height/Scale) ;
  
  
  for(int i = -1 ; i<=1 ; i++){
    for(int j = -1 ; j<=1 ; j++){
      fluid.addDensity(cx+i , cy+j , random(50,150));
    }
  }
  
  for(int i = 0 ; i < 2 ; i++){
    float angle = noise(t) * TWO_PI*2;
    PVector v = PVector.fromAngle(angle);
    v.mult(0.2);
    t+=0.1;
    fluid.addVelocity(cx , cy , v.x , v.y);
  }
  fluid.step();
  fluid.renderD();
  //fluid.renderV();
   //fluid.fadeD();
}
