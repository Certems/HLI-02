class tile{
    PVector pos;    //Position in terms of WHERE in ARRAY -> NOT pixel pos

    //#############################################################
    //## TRY SO VOLUME CAN BE "null" AND JUST SKIPS VOLUME STEPS ##
    //#############################################################
    volume cVolume = new volume();
    floor cFloor = new floor();
    ceiling cCeiling = new ceiling();

    tile(PVector arrayPosition){
        pos = arrayPosition;
    }

    void display(PVector screenPos, float tileWidth){
        cFloor.display(screenPos, tileWidth);
        cVolume.display(screenPos, tileWidth);
        cCeiling.display(screenPos, tileWidth);
    }
}