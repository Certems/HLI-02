void setup(){
    fullScreen(P2D);
    //size(600,600, P2D);

    cWorld = new world();
}
void draw(){
    cWorld.displayManager();
    cWorld.calcManager();
}

void keyPressed(){
    keyPressedManager();}
void keyReleased() {
    keyReleasedManager();}
void mousePressed(){
    mousePressedManager();}
void mouseReleased() {
    mouseReleasedManager();}