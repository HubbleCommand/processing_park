//https://marketplace.visualstudio.com/items?itemName=Tobiah.language-pde
//CTRL + SHFT + B to run
class Vector{
  float x;
  float y;

  Vector(float x, float y){
    this.x = x;
    this.y = y;
  }
}

class Position{
  int x;
  int y;

  Position(int x, int y){
    this.x = x;
    this.y = y;
  }

  /*Vector getPosition(){

  }*/
}

class Motion{
  Vector startingPosition;
  Vector velocity;

  Vector getPosition(int time){
    return this.velocity;
  }
}

class Orbit{
  //Vector startingPosition;
  float startingAngle;
  Vector velocity;

  float semiMajorAxis;
  float semiMinorAxis;



  /*Vector getPosition(int time){
    float m 
  }*/
}

class Star{
  Vector position;  //in m
  Vector speed; //in m/s
  float size;
  color col;
  float density;

  Motion motion;

  
  Star(Vector position, Vector speed, float size, color col){
    this.position = position;
    this.speed = speed;
    this.size = size;
    this.col = col;
  }

  Vector getPosition(int time){
    //float newx = this.position.x + (this.speed.x * time);
    //float newy = this.position.y + (this.speed.y * time);

    float newx = this.position.x + (this.speed.x);
    float newy = this.position.y + (this.speed.y);

    if(newx > width){
      newx -= width;
    }

    if(newy > height){
      newy -= height;
    }

    return new Vector(newx, newy);
  }
  
  void drawStar(int time){
    /*int newx = Math.round(this.position.x + (time / 1000));
    int newy = Math.round(this.position.y + (time / 1000));

    if(newx > width){
      newx -= width;
    }*/

    //this.position.x = newx;
    //currentStar.position.y = newy;
    this.position = this.getPosition(time);

    color tmp = this.col - Math.round(random(-10, 10));
    fill(tmp);
    //fill(this.col - color(random(-1, 1), random(-1, 1), random(-1, 1)));
    //circle(this.position.x, this.position.y, this.size);
    circle(this.position.x, this.position.y, this.size - (random(-1, 1)));

    //circle(this.motion.)
  }
}

class StarsController{
  ArrayList<Star> listOfStars = new ArrayList<Star>();

  void setupStarsController() {
      
      
      //Setup star locations
      int randomAmount = Math.round(random(0, 100));
      for(int i = 0; i < randomAmount; i++){
          int x = Math.round(width * random(0.01, 0.99));
          int y = Math.round(height * random(0.01, 0.99));
          int r = (int) (random(100, 256));
          int g = (int) (random(100, 256));
          int b = (int) (random(200, 256));
          color c = color(r,g,b);
          
          Star newStar = new Star(new Vector(x, y), new Vector(random(-0.99, 0.99), random(-0.99, 0.99)), random(1, 10), c);
          listOfStars.add(newStar);
      }
  }

  void drawStarsController() {
    clear();
    //DIFFERENCE FROM P5.JS: calling loadPixels() & updatePixels() without EXPLICITELY settings pixels with pixel[index] will just repaste previous pixels
    /*float noiseScale=0.02;  //Use float so that noise() below immediately takes noise values (i.e. instead of doubles)
    for(int y = starGap; y < height - (starGap - 1); y+=starGap){
      for(int x = starGap; x < width - (starGap - 1); x+=starGap){
          double noiseVal = noise(x*noiseScale - (x * 10), y*noiseScale - (y * 10)) * random(100, 256);
          int r = (int) (noiseVal * random(100, 256) / 256);
          int g = (int) (noiseVal * random(100, 256) / 256);
          int b = (int) (noiseVal * random(200, 256) / 256);
          
          color c = color(r,g,b);
          //color c2 = color(204-x, 153-y, 0);
          //set(x, y, c);
          fill(c);
          circle(x, y, random(1, 10));
          new Star(x, y, random(1, 10), c).draw();
      }
    }*/
    for(int i = 0; i < listOfStars.size() - 1; i++){
      Star currentStar = listOfStars.get(i);
      currentStar.drawStar((millis() / 1000));
    }
  }
}
