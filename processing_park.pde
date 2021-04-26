//UNCOMMENT TO CHOOSE WHICH ONE YOU WANT TO RUN
//ONLY RUN ONE AT A TIME

public void settings() {
  size(1000, 1000);
}

//Star grid
StarGridController starGridController = new StarGridController();
void setup(){
    starGridController.setupStarGrid();
}
void draw(){
    starGridController.drawStarGrid();
}

//Stars
/*
StarsController starsController = new StarsController();

void setup(){
    pixelDensity(1);
    background(0);
    //frameRate(10);
    //smooth();
    starsController.setupStarsController();
}
void draw(){
    starsController.drawStarsController();
}
*/