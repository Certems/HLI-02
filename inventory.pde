class inventory{
    ArrayList<item> items = new ArrayList<item>();
    int invSize;
    float iWidth;   //Ideal width -> aspires to be close to this value (rWidth does)
    float rWidth;   //Real width  -> actual width spaces take up
    float spacing;

    int iRow = 0; //Initial row to start display on -> Used to scroll down

    inventory(int inventorySize, float idealWidth){
        invSize = inventorySize;
        iWidth  = idealWidth;
        spacing = iWidth / 5.0;
    }

    void display(PVector pos, PVector dim){
        /*
        pos = top left corner of whole inv display
        dim = inv dimensions

        0________________________   Spacing around each slot
        | X   X   X   X         |
        |                       |   Arranged in a grid
        | X  ...                |
        |                       |   0 is 'pos' coord
        | X                     |
        |                       |
        |_______________________|
        */
        pushStyle();
        rectMode(CORNER);

        //Box
        fill(150,150,150,100);
        stroke(0);
        strokeWeight(2);
        rect(pos.x, pos.y, dim.x, dim.y);

        //Grid & Items
        int cols = floor(dim.x / (iWidth+spacing));
        int rows = ceil(invSize / float(cols));
        rWidth   = (dim.x - (cols+1)*spacing) / cols;       // Adaptive slot size to total box width
        for(int j=iRow; j<rows; j++){
            for(int i=0; i<cols; i++){
                boolean areSlotsLeft  = i +j*cols < invSize;
                boolean areItemsLeft  = i +j*cols < items.size();
                boolean itemsOnScreen = (dim.y > (j+2)*spacing +(j+1)*rWidth -iRow*(rWidth+spacing)) && ((j+2)*spacing +(j+1)*rWidth -iRow*(rWidth+spacing) > 0);
                //Only show for as many slots as available
                if(itemsOnScreen){      //e.g, Not gone beyond declared dim
                    if(areSlotsLeft){   //e.g Not beyond inv size
                        noFill();                                                                               //
                        stroke(0);                                                                              // Drawing slot here
                        strokeWeight(1);                                                                        //
                        rect(pos.x +(i+1)*spacing +i*rWidth, pos.y +(j+1)*spacing +j*rWidth -iRow*(rWidth+spacing), rWidth, rWidth);   //
                        //Only show for items still available
                        if(areItemsLeft){
                            textAlign(CENTER, CENTER);                                                          //
                            textSize(rWidth/3.0);                                                               // Drawing item in slot here
                            fill(255,0,0,200);                                                                  //
                            noStroke();                                                                         //
                            items.get(i +j*cols).display( new PVector(pos.x +rWidth/2.0 +(i+1)*spacing +i*rWidth, pos.y +rWidth/2.0 +(j+1)*spacing +j*rWidth -iRow*(rWidth+spacing)), new PVector(0.8*rWidth, 0.8*rWidth) );
                            text( items.get(i +j*cols).quantity,  pos.x +rWidth/2.0 +(i+1)*spacing +i*rWidth, pos.y +rWidth/2.0 +3.0*rWidth/10.0 +(j+1)*spacing +j*rWidth -iRow*(rWidth+spacing));
                        }
                    }
                }
                else{           //
                    break;      // Preventing time waste here
                }               //
            }
        }

        popStyle();
    }
    void keyPressedManager(){
        //pass
    }
    void keyReleasedManager(){
        //pass
    }
    void mousePressedManager(){
        //pass
    }
    void mouseReleasedManager(){
        //pass
    }
    void addXofItem(item cItem){
        boolean itemNotPresent = true;
        for(int i=0; i<items.size(); i++){
            if(cItem.ID == items.get(i).ID){
                items.get(i).quantity += cItem.quantity;
                itemNotPresent = false;
                break;
            }
        }
        if(itemNotPresent){
            items.add( cItem );
        }
    }
    void removeXofItem(item cItem){
        for(int i=0; i<items.size(); i++){
            if(cItem.ID == items.get(i).ID){
                if(items.get(i).quantity - cItem.quantity <= 0){        // Remove all
                    items.remove(i);}                                   //
                else{                                               // Remove some
                    items.get(i).quantity -= cItem.quantity;}       //
                break;
            }
        }
    }
    void selectItem(){
        /*
        An item in the inventory can be clicked on and selected
        */
    }
}