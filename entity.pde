class entity{
    inventory inv;

    PVector pos;
    PVector vel;    //**Use vel to move, collisions reverse vel dir

    int eSize;  //Set in specific classes

    /*
    #######################
    Store instructions for what to do when spawned as some other
    "Instruction Class"
    #######################
    */

    entity(PVector position){
        pos = position;
    }

    void display(float tileWidth){
        //pass
    }
}