class ninja {
  float x;
  float y;
  PImage Img;
  ninja() {
    noStroke();
    Img = loadImage("ninja.png");
    Img.resize(200, 200);

    x=100;
    y=560;
  }
  void render() {
    image(Img, x, y);
  }
  void move() {
    if (x > width) 
    {
      x=0;
     Scene+=1;
     
    }
  }
}
