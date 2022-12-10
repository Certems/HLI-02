class subMenu{
    PVector pos;
    PVector dim;
    PVector sType;  //Type of sub menu; X=which sub type, Y=which specificly

    PVector bufferPos   = new PVector(0,0);   //Used when moving the window / resizing window
    PVector pDiff       = new PVector(0,0);   //
    PVector oDim        = new PVector(0,0);   //Old dim

    boolean resizing = false;
    boolean moving   = false;

    inventory inv;
    entity ent;
    itemContainer til;
    //...

    buildWheel cBldWhl;
    //...

    /*
    SubTypes;
    0 = Inventory       ->0=entity, 1=tile
    1 = Build wheel     ->irrelevent
    2 = Event poster    ->0,1,2,3,4,... = specific posters
    ...
    */

    subMenu(PVector position, PVector dimension, PVector subMenuType){
        pos = position;
        dim = dimension;
        sType = subMenuType;
    }

    void display(){
        if(sType.x == 0){
            displayInv();
        }
        if(sType.x == 1){
            displayBuildWheel();
        }
        if(sType.x == 2){
            displayPoster();
        }
    }
    void calc(){
        calcResizeWindow();
        calcMoveWindow();
    }
    void keyPressedManager(){
        if(sType.x == 0){
            inv.keyPressedManager();
        }
        if(sType.x == 1){
            cBldWhl.keyPressedManager();;
        }
        if(sType.x == 2){
            //Has no keys associated
        }
    }
    void keyReleasedManager(){
        if(sType.x == 0){
            inv.keyReleasedManager();
        }
        if(sType.x == 1){
            cBldWhl.keyReleasedManager();;
        }
        if(sType.x == 2){
            //Has no keys associated
        }
    }
    void mousePressedManager(){
        //General
        resizeWindow();
        moveWindow();

        //Specific
        if(sType.x == 0){
            inv.mousePressedManager();
        }
        if(sType.x == 1){
            cBldWhl.mousePressedManager();;
        }
        if(sType.x == 2){
            //Has no keys associated
        }
    }
    void mouseReleasedManager(){
        //General for sub-menus
        resizing = false;
        moving   = false;

        //Specific to certain sub-menus
        if(sType.x == 0){
            inv.mouseReleasedManager();
        }
        if(sType.x == 1){
            cBldWhl.mouseReleasedManager();;
        }
        if(sType.x == 2){
            //Has no keys associated
        }
    }
    void displayInv(){
        inv.display(pos, dim);
    }
    void displayBuildWheel(){
        cBldWhl.display(pos);
    }
    void displayPoster(){
        //pass
    }

    void resizeWindow(){
        /*
        Resizes window from top right corner by clicking and moving mouse
        Triggers once on click
        */
        float cDist = vecDist( new PVector(mouseX, mouseY), new PVector(pos.x +dim.x, pos.y) ); //Corner distance to mouse
        float detectRad = 50.0;
        boolean mouseInCorner = cDist < detectRad;
        if(mouseInCorner){
            resizing = true;
            bufferPos = new PVector(mouseX, mouseY);
            pDiff     = new PVector(pos.x -mouseX, pos.y -mouseY);
            oDim      = new PVector(dim.x, dim.y);
        }
    }
    void moveWindow(){
        /*
        Moves a window by clicking at its top and moving the mouse
        Triggers once on click
        */
        float tDist = mouseY - pos.y; //Corner distance to mouse
        float detectRad = 50.0;
        boolean mouseInTop = (0 < tDist) && (tDist < detectRad);
        if(mouseInTop && !resizing){
            moving = true;
            bufferPos = new PVector(mouseX, mouseY);
            pDiff     = new PVector(pos.x -mouseX, pos.y -mouseY);
        }
    }
    void calcResizeWindow(){
        if(resizing){
            float dimMin = width/15.0;
            PVector dimDiff = new PVector(mouseX -bufferPos.x, mouseY -bufferPos.y);
            dim.x = oDim.x +dimDiff.x;
            dim.y = oDim.y +dimDiff.y;

            //Min dimension for window
            if(dim.x < dimMin){
                dim.x = dimMin;}
            if(dim.y < dimMin){
                dim.y = dimMin;}
        }
    }
    void calcMoveWindow(){
        if(moving){
            PVector mMoveDiff = new PVector(mouseX -bufferPos.x, mouseY -bufferPos.y);
            pos.x = bufferPos.x +pDiff.x +mMoveDiff.x;
            pos.y = bufferPos.y +pDiff.y +mMoveDiff.y;
        }
    }
}