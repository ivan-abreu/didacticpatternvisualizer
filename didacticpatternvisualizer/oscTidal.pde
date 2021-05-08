void oscEvent(OscMessage m) {
  //println(m);
  //if (m.checkAddrPattern("/didacticpatternvisualizer")==true ) {
    StringDict tidalLayer = new StringDict();
    for (int d=0; d<m.typetag().length(); d+=2 ) {
      String property = m.get(d).stringValue();
      String value = "";
      switch( m.typetag().charAt(d+1) ) {
      case 's': 
        value = m.get(d+1).stringValue(); 
        break;
      case 'f': 
        value = str(m.get(d+1).floatValue());
        break;
      case 'i': 
        value = str(m.get(d+1).intValue());
        break;
      case 'b': 
        //println("Binario");
        break;
      default: 
        //println("None");
        break;
      } 
      tidalLayer.set(property, value);
    }
    //printArray(tidalLayer);

    if ( tidalLayer.hasKey("grid") ) {
      cycles.add( new Cycle( tidalLayer.get("grid") ) ) ;
    }
    
    if ( tidalLayer.hasKey("connectionN") ) {
      sounds.add( new Sound(tidalLayer) ) ;
    }
    if ( tidalLayer.hasKey("connectionMax") ) {
      connectionTotal = parseInt( tidalLayer.get("connectionMax") )  ;
      alturaBar = height/connectionTotal;
    }
    if ( tidalLayer.hasKey("speedSequenser") ) {
      movSequenser = parseFloat( tidalLayer.get("speedSequenser") );
    }   
    if ( tidalLayer.hasKey("clear") ) {
      noLoop();
      cycles.clear();
      sounds.clear();
      background(255,255,255);
      loop();
    }
    
  //}
}
