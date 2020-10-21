import oscP5.*;
import netP5.*;

OscP5 osc;

ArrayList<Sound> sounds = new ArrayList<Sound>();
ArrayList<Cycle> cycles = new ArrayList<Cycle>();

float alturaBar;

float movSequenser= 2;

void setup() {
  osc = new OscP5(this, 1818);  
  size(1400,400);
  alturaBar = height/6;
  noStroke();
  fill(0);  
  textSize(18);
}



void draw() {
  background(255);
  fill(228);
  noStroke();
  for(int y=0; y<3; y++ ) {
    rect(0, y*alturaBar*2, width, alturaBar);
  }
  for(int i=0; i<sounds.size() ; i++) {
    if ( sounds.get(i)!= null) { sounds.get(i).draw(); }
  }  
  for(int i=0; i<cycles.size() ; i++) {
    if ( cycles.get(i)!= null) { cycles.get(i).draw(); }
  }
}
