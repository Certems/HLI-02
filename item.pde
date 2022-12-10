class item{
    String ID;
    PImage icon;
    int quantity;

    item(int itemNumber){
        quantity = itemNumber;
    }

    void display(PVector pos, PVector dim){
        //pass
    }
    void doAction(){
        /*
        All items have an action that they perform
        Unique items (e.g fishing rods) have a specific effect with certain machinery or in open air
        General items (e.g sticks) will either have no effect or a 'stockpile' effect where they can be placed in large groups
        */
        //pass
    }
}
class crop extends item{
    crop gNextStage;    //Next stage of this crop, that is grown into
    int gTimer   = 0;   //How far through its growth
    int gQuality;       //How good is the crop (tier of ingredient???)

    crop(int quantity){
        super(quantity);
    }

    void display(PVector pos, PVector dim){
        //pass
    }
    void doAction(){
        /*
        All items have an action that they perform
        Unique items (e.g fishing rods) have a specific effect with certain machinery or in open air
        General items (e.g sticks) will either have no effect or a 'stockpile' effect where they can be placed in large groups
        */
        //pass
    }
}


class packet extends item{
    /*
    Packets are sub-containers that can exist in storage
    They group together items in their own inventory
    */
    ArrayList<item> items = new ArrayList<item>();

    packet(int quantity){
        super(quantity);
    }

    @Override
    void display(PVector pos, PVector dim){
        //pass
    }
}


class stick extends item{
    //pass

    stick(int quantity){
        super(quantity);
        ID = "item_stick";
        //Set icon here
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(215, 230, 83);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        /*
        All items have an action that they perform
        Unique items (e.g fishing rods) have a specific effect with certain machinery or in open air
        General items (e.g sticks) will either have no effect or a 'stockpile' effect where they can be placed in large groups
        */
        //pass
    }
}
class yeast extends item{
    //#### EXPAND TO MANY MORE VARIETIES ####

    yeast(int quantity){
        super(quantity);
        ID = "item_yeast";
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(182, 76, 199);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        /*
        All items have an action that they perform
        Unique items (e.g fishing rods) have a specific effect with certain machinery or in open air
        General items (e.g sticks) will either have no effect or a 'stockpile' effect where they can be placed in large groups
        */
        //pass
    }
}

class wheatSeed extends crop{
    //pass

    wheatSeed(int quantity){
        super(quantity);
        ID = "item_wheat";

        gQuality = 0;
        gNextStage = new wheatSprout(quantity);
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(84, 79, 196);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        //pass
    }
}
class wheatSprout extends crop{
    //pass

    wheatSprout(int quantity){
        super(quantity);
        ID = "item_wheat";

        gQuality = 0;
        gNextStage = new wheatCrop(quantity);
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(84, 79, 196);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        //pass
    }
}
class wheatCrop extends crop{
    //pass

    wheatCrop(int quantity){
        super(quantity);
        ID = "item_wheat";

        gQuality = 0;
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(84, 79, 196);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        //pass
    }
}

class vBlueprintWall extends item{
    //pass

    vBlueprintWall(int quantity){
        super(quantity);
        ID = "item_vBlue_wall";
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(184, 48, 122);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        /*
        All items have an action that they perform
        Unique items (e.g fishing rods) have a specific effect with certain machinery or in open air
        General items (e.g sticks) will either have no effect or a 'stockpile' effect where they can be placed in large groups
        */
        //pass
    }
}
class vBlueprintKeg extends item{
    //pass

    vBlueprintKeg(int quantity){
        super(quantity);
        ID = "item_vBlue_keg";
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(59, 184, 105);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        /*
        All items have an action that they perform
        Unique items (e.g fishing rods) have a specific effect with certain machinery or in open air
        General items (e.g sticks) will either have no effect or a 'stockpile' effect where they can be placed in large groups
        */
        //pass
    }
}

class fBlueprintGrass extends item{
    //pass

    fBlueprintGrass(int quantity){
        super(quantity);
        ID = "item_fBlue_grass";
    }

    @Override
    void display(PVector pos, PVector dim){
        pushStyle();

        fill(184, 157, 59);
        noStroke();
        ellipse(pos.x, pos.y, dim.x, dim.y);

        popStyle();
    }
    @Override
    void doAction(){
        /*
        All items have an action that they perform
        Unique items (e.g fishing rods) have a specific effect with certain machinery or in open air
        General items (e.g sticks) will either have no effect or a 'stockpile' effect where they can be placed in large groups
        */
        //pass
    }
}