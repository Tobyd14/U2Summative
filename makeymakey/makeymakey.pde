import g4p_controls.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
ControlIO control;
Configuration Config;
ControlDevice gpad;
float LStickX = 0;
float LStickY = 0;
boolean r3 = false;
int Scene = 0;
float x= 0;
float y= 560;
float Xs [] = new float [5];
float Ys [] = new float [5];
ninja c;
StartingScene s;
PImage Background;
PImage Backgrounds2;
PImage Backgrounds3;
PImage Backgrounds4;
PImage Backgrounds5;
PImage Backgrounds6;
PImage Backgrounds7;
PImage Backgrounds8;
PImage Knife;
PFont f;
// audio player
import ddf.minim.*;
Minim minim;
AudioPlayer player;
void setup() { 
  control = ControlIO.getInstance(this);
  gpad = control.getMatchedDevice("NinjaComtrolls");
  if (gpad == null) {
    println("no control");
    System.exit(-1);
  }
  minim = new Minim(this);
  player = minim.loadFile("music.mp3");
  player.play();
  //minim = new Minim(this);
  //player = minim.loadFile("deathsound.mp3");
 // player.play();
  c=new ninja();
  s=new StartingScene();
  size(800, 800);
  Background = loadImage("background.jpg");
  Background.resize(800, 800);
  Backgrounds2 = loadImage("backgrounds2.jpg");
  Backgrounds2.resize(800, 800);
  Backgrounds3 = loadImage("backgrounds3.jpg");
  Backgrounds3.resize(800, 800);
  Backgrounds4 = loadImage("backgrounds4.jpg");
  Backgrounds4.resize(800, 800);
  Backgrounds5 = loadImage("backgrounds5.jpg");
  Backgrounds5.resize(800, 800);
  Backgrounds6 = loadImage("backgrounds6.jpg");
  Backgrounds6.resize(800, 800);
  Backgrounds7 = loadImage("backgrounds5.jpg");
  Backgrounds7.resize(800, 800);
  Backgrounds8 = loadImage("backgrounds5.jpg");
  Backgrounds8.resize(800, 800);

  if (millis() > 500) {
    for (int i=0; i<5; i++) {
      Xs[i] = random(0, width);
      Ys[i] = random(0, height);
      Knife = loadImage("knife.png");
      Knife.resize(100, 100);
    }
  }
}

void draw() {
  
  if (Scene == 8) {
    background(0);
  }
  if (Scene == 2) {
    background(Backgrounds2);
  }
  if (Scene == 3) {
    background(Backgrounds3);
  }
  if (Scene == 4) {
    background(Backgrounds4);
  }
  if (Scene == 5) {
    background(Backgrounds5);
  }
  if (Scene == 6) {
    background(Backgrounds6);
  }
  if (Scene == 7) {
    background(Backgrounds7);
  }
  if (Scene == 8) {
    background(0, 0, 0);
  }
  noStroke();
  if (Scene == 1) {
    background(Background); }
    if (Scene == 1|| Scene == 2||Scene == 3|| Scene == 4|| Scene == 5|| Scene == 6|| Scene == 7|| Scene == 8) {
      for (int i=0; i<5; i++) {
        image ( Knife, Xs[i], Ys[i]);
        Xs[i] = Xs[i] +- 3;
        if (Xs[i] < 0) {
          Xs[i] = width;
        }
        if (c.x < Xs[i] + Knife.width && 
          c.x + c.Img.width-85 > Xs[i] &&
          c.y < Ys[i] + Knife.height && 
          c.y + c.Img.height-10 > Ys[i])
        {
          Scene= 8;
        }
      }
    }
    GamePad();
    c.render();
    c.move();
    s.render();
  
}
void keyPressed()
{
  if (key == CODED)
    if (keyCode == RIGHT) {
      c.x+=12;
    }
  //down
  if (key == CODED)
    if (keyCode == LEFT ) {
      c.x-=12;
    }
  //up
  if (key == CODED)
    if (keyCode == UP) {
      c.y-=12;
    }
  //down
  if (key == CODED)
    if (keyCode == DOWN) {
      c.y+=12;
    }
  if (Scene == 0)
    if (key == CODED)
      if (keyCode == RIGHT) {
        Scene+=1;
      }
  if (Scene == 8)
    if (key == CODED)
      if (keyCode == RIGHT) {
        Scene = 0;
      }
}
void GamePad()
{
  LStickX = gpad.getSlider("LStick_X").getValue();
  LStickY = gpad.getSlider("LStick_Y").getValue();
  c.x+=12*LStickX;
  c.y+=12*LStickY;
  r3 = gpad.getButton("r3").pressed();

  if (r3 == true)
  {
    Scene+=1;
  }
}
