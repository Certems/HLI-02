class map{
    ArrayList<String> mapQuality = new ArrayList<String>();

    ArrayList<ArrayList<tile>> tiles;
    ArrayList<interactive> eInteractives    = new ArrayList<interactive>();    //
    ArrayList<inert> eInerts                = new ArrayList<inert>();          //Entity stores
    ArrayList<boss> eBosses                 = new ArrayList<boss>();           //

    ArrayList<subMenu> subMenus = new ArrayList<subMenu>();

    player cPlayer = new player(new PVector(0,0));      //**Must be copied over when moving player to different maps

    PVector focusPos = new PVector(0,0);    //The position of the camera focus

    float tileWidth = 10.0;

    //####
    // Game state booleans here
    //####
    boolean showBase = true;    //Show base aspects, e.g tiles,floors,entities,etc  #### SPLIT UP IF TOO GENERAL ####
    boolean showTrade = false;  //Show trading outpost menu

    map(ArrayList<String> mapEnviroQuality){
        mapQuality = mapEnviroQuality;
        generateMap();

        birdMan newBirdMan = new birdMan( new PVector(width/2.0, height/2.0) );
        eInteractives.add(newBirdMan);

        createInvSubMenu( new PVector(width/2.0, height/2.0), new PVector(width/5.0, height/5.0), eInteractives.get(eInteractives.size()-1), null );
        //createBuildWheelSubMenu();
    }

    void displayManager(){
        if(showBase){
            displayBackground();
            displayTiles();
            displayEntities();
            displaySubMenus();
            //####
            //## NEEDS FIXING, SHOULD BE background->floor->entities->volume->ceiling
            //## HAVE AS A SEPARATE FUNCTION TO OBEY THAT ORDER
            //####
        }
        if(showTrade){
            //pass
        }
    }
    void calcManager(){
        if(showBase){
            calcSubMenus();
        }
        if(showTrade){
            //pass
        }
    }
    void displayBackground(){
        background(60,60,60);
    }
    void displayTiles(){
        /*
        Displays all floors, then displays all tile volumes
        */
        for(int j=0; j<tiles.size(); j++){
            for(int i=0; i<tiles.get(j).size(); i++){
                PVector screenPos = new PVector(-focusPos.x +width/2.0 +tiles.get(j).get(i).pos.x*tileWidth, -focusPos.y +height/2.0 +tiles.get(j).get(i).pos.y*tileWidth);
                float border = tileWidth/2.0;
                boolean withinX = (0-border < screenPos.x) && (screenPos.x < width+border);
                boolean withinY = (0-border < screenPos.y) && (screenPos.y < height+border);
                if(withinX && withinY){
                    tiles.get(j).get(i).display(screenPos, tileWidth);}
            }
        }
    }
    void displayEntities(){
        displayInerts();
        displayInteractives();
        displayBosses();
        displayPlayer();
    }
    void displayInerts(){
        for(int i=0; i<eInerts.size(); i++){
            eInerts.get(i).display(tileWidth);
        }
    }
    void displayInteractives(){
        for(int i=0; i<eInteractives.size(); i++){
            eInteractives.get(i).display(tileWidth);
        }
    }
    void displayBosses(){
        for(int i=0; i<eBosses.size(); i++){
            eBosses.get(i).display(tileWidth);
        }
    }
    void displaySubMenus(){
        /*
        Shows all sub menus, with the LAST being on the top of the pile
        */
        for(int i=0; i<subMenus.size(); i++){
            subMenus.get(i).display();
        }
    }
    void displayPlayer(){
        cPlayer.display(tileWidth);
    }



    void calcSubMenus(){
        for(int i=0; i<subMenus.size(); i++){
            subMenus.get(i).calc();
        }
    }
    void calcTileGrowth(){
        int tickRate = 10;
        if(frameCount % tickRate == 0){
            for(int j=0; j<tiles.size(); j++){
                for(int i=0; i<tiles.get(j).size(); i++){
                    tiles.get(j).get(i).cVolume.updateGrowth(tickRate);
                }
            }
        }
    }


    void keyPressedManager(){
        for(int i=0; i<subMenus.size(); i++){
            subMenus.get(i).keyPressedManager();
        }

        if(key == '2'){
            tileWidth += 2.0;}
        if(key == '1'){
            tileWidth -= 2.0;}

        if(key == 'w'){
            focusPos.y -= 10.0;}
        if(key == 's'){
            focusPos.y += 10.0;}
        if(key == 'a'){
            focusPos.x -= 10.0;}
        if(key == 'd'){
            focusPos.x += 10.0;}

        if(key == '4'){
            cPlayer.inv.addXofItem(new stick(1));}
        if(key == '3'){
            cPlayer.inv.removeXofItem(new stick(2));}
    }
    void keyReleasedManager(){
        for(int i=0; i<subMenus.size(); i++){
            subMenus.get(i).keyReleasedManager();
        }
    }
    void mousePressedManager(){
        for(int i=0; i<subMenus.size(); i++){
            subMenus.get(i).mousePressedManager();
        }
    }
    void mouseReleasedManager(){
        for(int i=0; i<subMenus.size(); i++){
            subMenus.get(i).mouseReleasedManager();
        }
    }


    void createInvSubMenu(PVector pos, PVector dim, entity being, itemContainer cTile){
        subMenu newSubMenu = new subMenu(new PVector(width/2.0, height/2.0), new PVector(width/5.0, height/5.0), new PVector(0,0));
        if(being == null){  //IS a tile
            newSubMenu.sType.y++;
            newSubMenu.inv = cTile.inv;
            newSubMenu.til = cTile;  
        }
        if(cTile == null){  //IS an entity
            newSubMenu.inv = being.inv;
            newSubMenu.ent = being;
        }
        subMenus.add(newSubMenu);
    }
    void createBuildWheelSubMenu(){
        PVector dim = new PVector(height/3.0, height/3.0);
        subMenu newSubMenu = new subMenu(new PVector(width/2.0, height/2.0), dim, new PVector(1,-1));
        newSubMenu.cBldWhl = new buildWheel(dim.x);
        subMenus.add(newSubMenu);
    }
    void moveSubMenuToFront(int i){
        if( (0 <= i) && (i < subMenus.size()) ){
            subMenu movedSubMenu = subMenus.get(i);
            subMenus.remove(i);
            subMenus.add(movedSubMenu);
        }
    }


    ArrayList<ArrayList<tile>> generateTileArray(PVector dim){
        /*
        Generates a list of tiles with empty volumes (ready to be changed and editted)
        */
        ArrayList<ArrayList<tile>> tileSet = new ArrayList<ArrayList<tile>>();
        for(int j=0; j<dim.y; j++){
            tileSet.add( new ArrayList<tile>() );
            for(int i=0; i<dim.x; i++){
                tile newTile = new tile( new PVector(i,j) );
                tileSet.get(j).add(newTile);
            }
        }
        return tileSet;
    }
    void generateMap(){
        /*
        Generates a map based off its current qualities
        */
        for(int z=0; z<mapQuality.size(); z++){
            String mQuality = mapQuality.get(z);
            if(z==0){   //Size
                //Make generic tiles
                if(mQuality == "small"){
                    tiles = generateTileArray( new PVector(10,10) );}
                if(mQuality == "medium"){
                    tiles = generateTileArray( new PVector(20,20) );}
                if(mQuality == "large"){
                    tiles = generateTileArray( new PVector(30,30) );}
                //Move camera focus to centre of map
                focusPos = new PVector(tiles.get(0).size()*tileWidth/2.0, tiles.size()*tileWidth/2.0);
            }
            if(z==1){   //General
                if(mQuality == "exterior"){
                    //Make all tiles have grass floor
                    for(int j=0; j<tiles.size(); j++){
                        for(int i=0; i<tiles.get(j).size(); i++){
                            tiles.get(j).get(i).cFloor = new grass();
                        }
                    }
                }
                if(mQuality == "interior"){
                    //Make all tiles have grass floor
                    for(int j=0; j<tiles.size(); j++){
                        for(int i=0; i<tiles.get(j).size(); i++){
                            tiles.get(j).get(i).cFloor = new stone();
                        }
                    }
                }
            }
            if(z==2){   //Temperature
                //Not much to do here, just a variable to be used by plants, customers, etc
            }
            if(z==3){   //Folliage style
            float fProb = 0.0;
                if(mapQuality.get(z+1) == "sparse"){
                    fProb = 0.01;}
                if(mapQuality.get(z+1) == "dense"){
                    fProb = 0.03;}
                //Source plants in
                for(int j=0; j<tiles.size(); j++){
                    for(int i=0; i<tiles.get(j).size(); i++){
                        float rVal = random(0.0, 1.0);
                        if(rVal < fProb){
                            tiles.get(j).get(i).cVolume = new tree();
                        }
                    }
                }
                //Grow plants out
                //pass
            }
            if(z==5){   //Structure style
                float sProb = 0.0;
                if(mapQuality.get(z+1) == "sparse"){
                    sProb = 0.01;}
                if(mapQuality.get(z+1) == "dense"){
                    sProb = 0.02;}
                for(int j=0; j<tiles.size(); j++){
                    for(int i=0; i<tiles.get(j).size(); i++){
                        float rVal = random(0.0, 1.0);
                        if(rVal < sProb){
                            //Add Structure here
                            //...
                        }
                    }
                }
            }
            if(z==7){   //Border style
                if(mQuality == "water"){
                    int mBorder = 0;
                    if(mapQuality.get(z+1) == "sparse"){
                        mBorder = 2;}
                    if(mapQuality.get(z+1) == "dense"){
                        mBorder = 4;}
                    for(int j=0; j<tiles.size(); j++){
                        for(int i=0; i<tiles.get(j).size(); i++){
                            boolean isBorderTile = (i<mBorder || tiles.get(j).size()-mBorder<=i) || (j<mBorder || tiles.size()-mBorder<=j);
                            if(isBorderTile){
                                tiles.get(j).get(i).cVolume = new river();
                            }
                        }
                    }
                }
                if(mQuality == "open"){
                    //Leave as hard cut-off
                }
            }
        }
    }
}