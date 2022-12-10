class world{
    ArrayList<map> maps = new ArrayList<map>();

    int cMap = 0;   //The map currently with the user in

    //####
    // Game state booleans here
    //####
    boolean showMap     = true;
    boolean showWorld   = false;
    
    world(){
        createMapPreset(0);
    }

    void displayManager(){
        if(showMap){
            /*
            ** Note in here, this will tell the map to draw itself
                The map will then decide whether it wants to draw any 
                of its own sub menus
            */
            maps.get(cMap).displayManager();
        }
        if(showWorld){
            //pass
        }
        
        overlay();
    }
    void calcManager(){
        if(showMap){
            maps.get(cMap).calcManager();
        }
        if(showWorld){
            //pass
        }
    }


    void keyPressedManager(){
        if(showMap){
            maps.get(cMap).keyPressedManager();
        }
        if(showWorld){
            //pass
        }
    }
    void keyReleasedManager(){
        if(showMap){
            maps.get(cMap).keyReleasedManager();
        }
        if(showWorld){
            //pass
        }
    }
    void mousePressedManager(){
        if(showMap){
            maps.get(cMap).mousePressedManager();
        }
        if(showWorld){
            //pass
        }
    }
    void mouseReleasedManager(){
        if(showMap){
            maps.get(cMap).mouseReleasedManager();
        }
        if(showWorld){
            //pass
        }
    }


    void overlay(){
        pushStyle();

        fill(255);
        textSize(20);
        text(frameRate, 20, 20);

        popStyle();
    }
    void createMapPreset(int variant){
        if(variant == 0){
            ArrayList<String> qualitySet = new ArrayList<String>();
            qualitySet.add("large");qualitySet.add("exterior");qualitySet.add("neutral");
            qualitySet.add("forest");qualitySet.add("dense");   //Folliage
            qualitySet.add("clear");qualitySet.add("sparse");   //Structures
            qualitySet.add("water");qualitySet.add("sparse");    //Border
            map newMap = new map(qualitySet);
            newMap.generateMap();
            maps.add(newMap);
        }
        //...
    }
}