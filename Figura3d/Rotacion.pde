public class Rotacion {
   
  private float radians;
  private int angulo;
  private ArrayList<Point> listaPuntos;
  
  public Rotacion(ArrayList<Point> listaPuntos) {
    this.angulo = 10;
    this.radians = radians(angulo);
    this.listaPuntos = listaPuntos;
  }
  
  
  
  
  public void puntosRotacion(){
     for (int i = 0; i < listaPuntos.size() - 1; i++) {
      
      Point puntoPrimero = listaPuntos.get(i);
      Point puntoSegundo = listaPuntos.get(i + 1);
      
      objeto.vertex(puntoPrimero.x, puntoPrimero.y, puntoPrimero.z);
      objeto.vertex(puntoSegundo.x, puntoSegundo.y, puntoSegundo.z);
      
      for (int j = angulo; j <= 360; j += angulo) {
        Point point = Rotacion.rotaPunto(puntoPrimero);
        objeto.vertex(point.x, point.y, point.z);
  
        Point p = Rotacion.rotaPunto(puntoSegundo);
        objeto.vertex(p.x, p.y, p.z);
        radians = radians(angulo + j);
      }
    }
    
  }
  
  public Point rotaPunto(Point point) {
    
    float x = (point.x() * cos(radians) - point.z() * sin(radians));
    float z = (point.x() * sin(radians) + point.z() * cos(radians));
    
    return new Point(x, point.y(), z);
  }
  
}
