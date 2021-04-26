class StarGridController{
    int starGap = 10;
    float noiseScale = 0.02;

    void setupStarGrid(){
        pixelDensity(1);
        background(0);
        //frameRate(10);
    }
    
    void drawStarGrid(){
        for(int y = starGap; y < height - (starGap - 1); y+=starGap){
            for(int x = starGap; x < width - (starGap - 1); x+=starGap){
                double noiseVal = noise(x*noiseScale - (x * 10), y*noiseScale - (y * 10)) * random(100, 256);
                int r = (int) (noiseVal * random(100, 256) / 256);
                int g = (int) (noiseVal * random(100, 256) / 256);
                int b = (int) (noiseVal * random(200, 256) / 256);
                color c = color(r,g,b);

                set(x, y, c);
            }
        }
    }
}