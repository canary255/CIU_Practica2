public class Line{
  
  private Point puntoPrimero, puntoSegundo;
  
  public Line(Point puntoPrimero, Point puntoSegundo) {
    this.puntoPrimero = puntoPrimero;
    this.puntoSegundo = puntoSegundo;
  }
  
  public Point getpuntoPrimero(){
    return puntoPrimero;
  }
  
  public Point getpuntoSegundo(){
    return puntoSegundo;
  }
  
}
