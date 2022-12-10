class volume{
    String vType;  //Volume type
    
    volume(){
        //pass
    }

    void display(PVector pos, float tileWidth){
        //pass
    }
    void updateGrowth(int timePassed){
        //pass
    }
}


class solid extends volume{
    /*
    Solids are decoration based and cannot be interacted with, and counterintuitively
    are sometimes NOT collideable
    */
    //pass

    solid(){
        vType = "solid";
    }

    void display(PVector pos, float tileWidth){
        //pass
    }
}
class itemContainer extends volume{
    /*
    Containers have an inventory that can be accessed by interacting with the tile.
    */
    inventory inv;

    itemContainer(){
        inv = new inventory(20, 10.0);
        vType = "itemContainer";
    }

    void display(PVector pos, float tileWidth){
        //pass
    }
}
class fluidContainer extends volume{
    /*
    Containers have an inventory that can be accessed by interacting with the tile.
    */

    fluidContainer(){
        vType = "fluidContainer";
    }

    void display(PVector pos, float tileWidth){
        //pass
    }
}
class grower extends volume{
    //#######################
    //#######################
    //PUT IN PLANT INSTEAD
    int cTime = 0;                          //How far through current stage
    int cGrowStage = 0;                     //Current stage this is on
    ArrayList<Integer> growStageDuration;   //How long each stage takes
    //#######################
    //#######################

    //Hold plant here

    grower(){
        vType = "grower";
    }

    void display(){
        //pass
    }
    @Override
    void updateGrowth(int timePassed){
        /*
        Grows tile in chunks of time e.g every 10 frames
        */
        cTime += timePassed;
        if(growStageDuration.get(cGrowStage) <= cTime){
            if(cGrowStage+1 < growStageDuration.size()){
                cGrowStage++;}
            cTime = 0;
        }
    }
}


class wall extends solid{
    //pass

    wall(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(200,100,100);
        noStroke();
        rect(pos.x, pos.y, 0.5*tileWidth, 0.5*tileWidth);

        popStyle();
    }
}
class tree extends solid{
    //pass

    tree(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(190,140,40);
        noStroke();
        rect(pos.x, pos.y, 0.5*tileWidth, 0.5*tileWidth);

        popStyle();
    }
}


class chest extends itemContainer{
    //pass

    chest(){
        inv = new inventory(50, 5.0);
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(100,200,100);
        noStroke();
        rect(pos.x, pos.y, 0.5*tileWidth, 0.5*tileWidth);

        popStyle();
    }
}


class river extends fluidContainer{
    //pass

    river(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(80,80,250);
        noStroke();
        rect(pos.x, pos.y, 0.9*tileWidth, 0.9*tileWidth);

        popStyle();
    }
}
class keg extends fluidContainer{
    //pass

    keg(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(100,100,200);
        noStroke();
        rect(pos.x, pos.y, 0.5*tileWidth, 0.5*tileWidth);

        popStyle();
    }
}


class farmland extends grower{
    //pass

    farmland(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(252, 186, 3);
        noStroke();
        rect(pos.x, pos.y, 0.9*tileWidth, 0.9*tileWidth);

        popStyle();
    }
}
class hydroponics extends grower{
    //pass

    hydroponics(){
        //pass
    }

    @Override
    void display(PVector pos, float tileWidth){
        pushStyle();
        
        rectMode(CENTER);
        fill(90, 3, 252);
        noStroke();
        rect(pos.x, pos.y, 0.6*tileWidth, 0.6*tileWidth);

        popStyle();
    }
}