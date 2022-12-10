class buildWheel{
    /*
    The build wheel is a selector wheel for specific tile functions, e.g selecting
    various floors, volumes and ceilings in order to be placed

    The wheel has 3 stages;
    1st = shows 3 sections, for floor, volume and ceiling
    2nd = when one of these is selected, x items will be shown in the wheel
        -> SELECTED with LEFT click, CLEARED with RIGHT click
        -> Clicking the middle opens a menu to add more items to the wheel
    3rd = small icon shown by mouse of the selected item, with coloured background based 
        on whether a floor, volume or ceiling is selected

    StoreSelect has 3 arrayLists, for                  
    Inside each is the tile type held in storage

    E.G:

    [[floor], [volume], [ceiling]]
    a,b,c      d       e,f,g,h
    Where a,...,h are IDs for each of the following
    */
    ArrayList<ArrayList<Integer>> storedSelect = new ArrayList<ArrayList<Integer>>();

    float rWheel;
    float rCenter;

    boolean stage1 = true;
    boolean stage2 = false;
    boolean stage3 = false;
    int stage2ind = 0;  //Index of store selected for stage 2

    buildWheel(float wRadius){
        rWheel  = wRadius;
        rCenter = rWheel/4.0;
        initStored();
    }

    void display(PVector pos){
        if(stage1){
            displayStage1(pos);}
        if(stage2){
            displayStage2(pos);}
        if(stage3){
            displayStage3(pos);}
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
    void displayStage1(PVector pos){
        pushStyle();

        float theta = (2.0*PI)/3.0;
        float thetaOffset = PI/2.0;

        //Outer
        fill(255,255,255,120);
        stroke(0);
        strokeWeight(2);
        ellipse(pos.x, pos.y, 2.0*rWheel, 2.0*rWheel);
        //Segmenting
        noFill();
        stroke(0);
        strokeWeight(2);
        for(int i=0; i<storedSelect.size(); i++){
            line(pos.x, pos.y, pos.x +rWheel*cos(i*theta -thetaOffset), pos.y +rWheel*sin(i*theta -thetaOffset));
        }
        //Fill each segment
        fill(0);
        noStroke();
        textSize(rWheel/10.0);
        textAlign(CENTER,CENTER);
        for(int i=0; i<storedSelect.size(); i++){
            String label = "";
            if(i == 0){
                label = "Floor";}
            if(i == 1){
                label = "Volume";}
            if(i == 2){
                label = "Ceiling";}
            text(label, pos.x +rWheel*cos(i*theta -thetaOffset +theta/2.0)/2.0, pos.y +rWheel*sin(i*theta -thetaOffset +theta/2.0)/2.0);
        }

        popStyle();
    }
    void displayStage2(PVector pos){
        pushStyle();

        float theta = (2.0*PI)/storedSelect.get(stage2ind).size();
        float thetaOffset = PI/2.0;

        //Outer
        fill(255,255,255,120);
        stroke(0);
        strokeWeight(2);
        ellipse(pos.x, pos.y, 2.0*rWheel, 2.0*rWheel);
        //Segmenting
        noFill();
        stroke(0);
        strokeWeight(2);
        for(int i=0; i<storedSelect.size(); i++){
            line(pos.x, pos.y, pos.x +rWheel*cos(i*theta -thetaOffset), pos.y +rWheel*sin(i*theta -thetaOffset));
        }
        //Inner
        fill(200,200,200,120);
        stroke(0);
        strokeWeight(2);
        ellipse(pos.x, pos.y, 2.0*rCenter, 2.0*rCenter);
        //Fill each segment
        fill(0);
        noStroke();
        textSize(rWheel/10.0);
        textAlign(CENTER,CENTER);
        for(int i=0; i<storedSelect.get(stage2ind).size(); i++){
            String label = "";
            //#### SELECTS NAME OF THAT TILE ELEMENT ####
            text(label, pos.x +rWheel*cos(i*theta -thetaOffset +theta/2.0)/2.0, pos.y +rWheel*sin(i*theta -thetaOffset +theta/2.0)/2.0);
        }
        
        popStyle();
    }
    void displayStage3(PVector pos){
        pushStyle();

        //pass
        
        popStyle();
    }
    void calcClick(){
        /*
        Checks for zones being clicked in each stage, to trigger different events
        */
        if(stage1){
            //pass
        }
        if(stage2){
            //pass
        }
        if(stage3){
            //pass
        }
    }
    void initStored(){
        storedSelect.add(new ArrayList<Integer>());
        storedSelect.add(new ArrayList<Integer>());
        storedSelect.add(new ArrayList<Integer>());
    }
}