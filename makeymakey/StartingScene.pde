class StartingScene {


  StartingScene() {
    Background = loadImage("background.jpg");
    Background.resize(800, 800);
    f = createFont("Arial", 30, true);
    c=new ninja();
  }
  void render() {
    if (Scene == 0) {
      background(0);
      textFont(f, 60);                  
      fill(255, 0, 0);                          
      text("Ninja Rush", 400, 400);
      textFont(f, 25);
      fill(255, 0, 0);
      text("Use Joystick To Move. Avoid Knifes To Pass Through Levels", 100, 200);
       textFont(f, 30);
      fill(255, 0, 0);
      text("Press Right Key To Begin First Level", 300, 100);
     
    }
    if (Scene == 8){
    textFont(f,60);
    fill(255, 0, 0);
    text("You Lose", 400, 400);}
  }
  
}
