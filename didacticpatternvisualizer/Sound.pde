class Sound {
   PVector position, velocidad;
   int x = 1;
   int n = 1;
   String s = "";
   color colorB;
   float size = 40;
   
   Sound(String x, StringDict tidalLayer, float o) {
     this.x = parseInt(x);
     float y = map(this.x, 1, 6, 20, (height-alturaBar)+20);
     position = new PVector(width-offsetSubdivision, y+o);
     velocidad = new PVector(-movSequenser, 0.0);
     int numb = 0;
     for(int c=0; c<tidalLayer.get("s").length(); c++) {
       numb += (int)tidalLayer.get("s").charAt(c)  ;
     }
     if ( tidalLayer.hasKey("n") ) {
        numb *= ( parseInt( tidalLayer.get("n") )+0) ;
     } else {
        numb *= 18181818;
     }
     randomSeed(numb);
     colorB = color(random(255), random(255), random(255));
   }
   
   void draw() {
     noStroke();
     fill(colorB);
     position.add(velocidad);
     ellipse(position.x, position.y, size, size);
     if ( position.x < -30 ) {
       sounds.remove(this);
     }
     size -= 1.0;
     size = constrain(size, 10, 40);
   }
}
