class inert extends entity{
    //pass

    inert(PVector pos){
        super(pos);

        inv = new inventory(50, 20.0);
    }

    void display(float tileWidth){
        //pass
    }
}


class bird extends inert{
    //pass

    bird(PVector pos){
        super(pos);
    }

    @Override
    void display(float tileWidth){
        pushStyle();

        imageMode(CENTER);
        fill(60,30,30);
        stroke(0);
        strokeWeight(1);

        ellipse(pos.x, pos.y, 0.5*eSize*tileWidth, 0.5*eSize*tileWidth);

        popStyle();
    }
}


class mouse extends inert{
    //Run out from behind barrels and machinery
    //pass

    mouse(PVector pos){
        super(pos);
    }

    @Override
    void display(float tileWidth){
        pushStyle();

        imageMode(CENTER);
        fill(30,60,30);
        stroke(0);
        strokeWeight(1);

        ellipse(pos.x, pos.y, 0.5*eSize*tileWidth, 0.5*eSize*tileWidth);

        popStyle();
    }
}