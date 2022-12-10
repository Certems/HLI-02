class floor{
    //pass

    floor(){
        //pass
    }

    void display(PVector pos, float tileWidth){
        //pass
    }
}


class grass extends floor{
    //pass

    grass(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(160,210,60);
        noStroke();
        rect(pos.x, pos.y, tileWidth, tileWidth);

        popStyle();
    }
}


class stone extends floor{
    //pass

    stone(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(80,80,80);
        noStroke();
        rect(pos.x, pos.y, tileWidth, tileWidth);

        popStyle();
    }
}