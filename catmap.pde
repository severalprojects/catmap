
PImage cat, iteratedImage; 

int[] map1 = {2, 1, 1, 1};
int[] map2 = {3, 1, 2, 1};
int[] map3 = {5, 1, 2, 2};


void setup() {
  cat = loadImage("RS2.jpg");
  iteratedImage = cat; 
  
  size(600, 600);
  frameRate(12); 
  //noLoop();
}

void draw() {
 iteratedImage = catMapIterate(iteratedImage, 600, map1);  
 image(iteratedImage, 0, 0); 
  
}


PImage catMapIterate(PImage oldImage, int Dim, int[] matrix) {
  PImage newImage = createImage(Dim, Dim, RGB); 
  
  for (int y = 0; y < Dim; y++) {
    for (int x = 0; x < Dim; x++) {
      //what to convert every index in 0 to Dim*Dim to an X, Y pair, 
      
      //int the_new_index;
      int[] thepixel = {x, y}; 
      int the_new_index = XY_to_index(thepixel, Dim); 
      
      //apply the map (x, y) -> (2x+y, x+y) (where both coordinates are mod the dimension of the image. 
      int new_x = (matrix[0]*x + matrix[1]*y) % Dim; 
      int new_y = (matrix[2]*x+matrix[3]*y) % Dim; 
      
      
      int[] theNpixel = {new_x, new_y}; 
      
      int the_old_index =  XY_to_index(theNpixel, Dim); 
      
      newImage.pixels[the_new_index] = oldImage.pixels[the_old_index]; 
    }
  }
  return newImage;
}

//pixels are stored in a 1D array. convert a 1D index to a 2D ordered pair
int[] index_to_XY(int index, int SquareDim) {

  int y = index/SquareDim;
  int x = index%SquareDim; 
  
  int coords[] = {x, y}; 
  return coords; 

 }
 //convert an ordered pair back into an index in the 1D array of pixels 
 int XY_to_index(int[] XY, int SquareDim) {

    int the_index; 
    the_index = XY[1]*SquareDim + XY[0]; 
  
    return the_index; 

 }
 
 void mousePressed(){
   noLoop(); 
 }
 
 void mouseReleased() {
   loop(); 
 }
