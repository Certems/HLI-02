float vecMag(PVector v){
    return sqrt( pow(v.x,2) + pow(v.y,2) );
}
float vecDist(PVector v2, PVector v1){
    return sqrt( pow(v2.x-v1.x,2) + pow(v2.y-v1.y,2) );
}