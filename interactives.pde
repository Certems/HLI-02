class interactive extends entity{
    //pass

    interactive(PVector pos){
        super(pos);

        inv = new inventory(50, 20.0);
    }

    void display(float tileWidth){
        //pass
    }
}


class birdMan extends interactive{
    //pass

    birdMan(PVector pos){
        super(pos);
    }

    @Override
    void display(float tileWidth){
        pushStyle();

        imageMode(CENTER);
        fill(120,120,180);
        stroke(0);
        strokeWeight(1);

        ellipse(pos.x, pos.y, eSize*tileWidth, eSize*tileWidth);

        popStyle();
    }
}


class lizardMan extends interactive{
    //pass

    lizardMan(PVector pos){
        super(pos);
    }

    @Override
    void display(float tileWidth){
        pushStyle();

        imageMode(CENTER);
        fill(120,180,120);
        stroke(0);
        strokeWeight(1);

        ellipse(pos.x, pos.y, eSize*tileWidth, eSize*tileWidth);

        popStyle();
    }
}