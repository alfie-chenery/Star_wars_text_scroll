import processing.sound.*;
SoundFile file;
String txt;
PImage logo;
PFont font;

float alpha1 = 255;
float alpha2 = 255;
float z = 0;
float y = 0;

void setup(){
  fullScreen(P3D);
  String[] lines = loadStrings("message.txt");
  txt = join(lines, "\n");
  logo = loadImage("starwars.png");
  y = height/2;
  
  font = createFont("News Gothic MT",36,false);

  
  file = new SoundFile(this, "music.wav");
  file.play();
}

void draw(){
  float textwidth = width*0.6;
  if (frameCount <= 447){
    background(0);
    fill(50, 175, 250, alpha1);
    textSize(width/24);
    textAlign(LEFT, CENTER);
    text("A long time ago in a galaxy far,\nfar away....", 0.15*width, 0, width, height);
    if (frameCount > 312){
      alpha1 -= 2;
    }

    
  } else if ((frameCount > 447) && (frameCount <= 950)){
    translate(width/2,height/2,z);
    background(0);
    if (frameCount > 695){
      tint(255,alpha2);
      alpha2 -= 1;
    }
    image(logo,-logo.width/2,-logo.height/2);
    z -= 10;

  } else{
    background(0);
    translate(width/2,height/2);
    
    //gradient fade at top of screen


    fill(255, 232, 31);
    textFont(font,width/24);
    //textSize(width/24);
    textAlign(CENTER);
    rotateX(PI/4);

    text(txt, -textwidth/2, y, textwidth, height*999);
    
    y --;
  }
}
