class Cycle {
   PVector position, velocidad;
   float grosor = 1.5;
   
   Cycle(String n) {
     position = new PVector(width-offsetSubdivision, 0);
     velocidad = new PVector(-movSequenser, 0.0);
     grosor = (n.equals("1")) ? 1.5 : 0.5;
     
   }
   
   void draw() {
     noFill();
     stroke(0);
     position.add(velocidad);
     strokeWeight(grosor);
     line(position.x, position.y, position.x, height);
     if ( position.x < -30 ) {
       cycles.remove(this);
     }
   }
}
