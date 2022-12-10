class player extends entity{
    //pass

    player(PVector pos){
        super(pos);

        inv = new inventory(50, 20.0);
    }

    @Override
    void display(float tileWidth){
        pushStyle();

        imageMode(CENTER);
        fill(255);
        stroke(0);
        strokeWeight(1);

        ellipse(pos.x, pos.y, eSize*tileWidth, eSize*tileWidth);

        popStyle();
    }
}