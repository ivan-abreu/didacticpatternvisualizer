int millisPrev = 0;
float offset = 0;
String layerPrev = "";
float widthCycleByBps = 100;
float offsetSubdivision = 40;
int subdivision = 1;
int sincroniaCPrev = 0;

void oscEvent(OscMessage m) {
  //println(m);
  if (m.checkAddrPattern("/didacticpatternvisualizer")==true ) {
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
    printArray(tidalLayer);

    if ( tidalLayer.hasKey("tempo") ) {
      cycles.add( new Cycle( tidalLayer.get("tempo") ) ) ;
    } else {
      float cycle = parseFloat( tidalLayer.get("cycle") );
      int sincroniaC = (int)((cycle - (int)(cycle)) * 100);
      float sincroniaCMapped = 0; //map(sincroniaC, 0, 100, 0, 40); 
      if ( sincroniaCPrev == sincroniaC ) {
        offset += 10;
      } else {
        offset = 0;
      }
      sounds.add( new Sound(tidalLayer.get("connectionN"), tidalLayer, offset ) ) ;
      layerPrev = tidalLayer.get("connectionN");
      sincroniaCPrev = sincroniaC;
    }
  }
}
