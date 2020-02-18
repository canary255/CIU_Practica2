private PShape objeto;
boolean randomColor=false;
private ArrayList<Point> listaPuntos = new ArrayList();
private ArrayList<Line> listaLineas = new ArrayList();
private Rotacion Rotacion;
boolean modo2D=true;
boolean modo3D=false;

int ejeX=width/2;
int ejeY=height/2;

void settings(){
  size(900, 600, P3D);
}

void setup(){
  stroke(255);
}

void draw(){
  background(0);
  mensaje(); 
  if(modo2D){
    strokeWeight(2);
    line(width/2, 0, width/2, height);
    if(listaPuntos.size()>=1){
      dibuja();
      lineasDibujadas();
    }
  } else if (modo3D && listaPuntos.size()>=3){
    translate(ejeX, ejeY,-800);
    shape(objeto);
    if(keyPressed){
      if (key == 'f' || key == 'F') toggleDrawingState();
      else if (key == 's' || key == 'S') ejeY +=10;
      else if (key == 'w' || key == 'W') ejeY -=10;
      else if (key == 'a' || key == 'A') ejeX -=10;
      else if (key == 'd' || key == 'D') ejeX +=10;
    }
  }
}

void keyPressed(){
    if(modo2D){
      if (key == 'f' || key == 'F') toggleDrawingState();
      else if ((key == ENTER || key == ENTER) && listaPuntos.size() >=3){
        randomColor=true;
        modo3D=true;
        modo2D=false;
        dibuja3D();
      }
    }
}


void dibuja3D() {
   Rotacion = new Rotacion(listaPuntos);
   if (listaPuntos.size() >= 3) {      
    
    objeto = createShape();
    objeto.beginShape(TRIANGLE_STRIP);
    if(randomColor){
      randomColor=false;
      objeto.fill(random(0,255),random(0,255),random(0,255));
    }
    objeto.stroke(102);
    objeto.strokeWeight(1);
    
    Rotacion.puntosRotacion();
    
    objeto.endShape();   
  }
  stroke(255);
}

void mousePressed(){
  if (mouseButton == LEFT && mouseX >= width / 2){
    listaPuntos.add(new Point(mouseX,mouseY,0));
    if(listaPuntos.size()>1){
      listaLineas.add(new Line(listaPuntos.get(listaPuntos.size()-1), listaPuntos.get(listaPuntos.size()-2)));
    }
  } else if(mouseButton == RIGHT && listaPuntos.size()>0){
       listaPuntos.remove(listaPuntos.size()-1);
       if(listaPuntos.size()>0){
         listaLineas.remove(listaLineas.size()-1);
       } 
  }
}

void mensaje(){
  if(modo2D){
    textFont(createFont("Arial",48));
    text("GENERADOR 3D",  30, 110); 
    textSize(16);
    text("Haga click izquierdo para crear un punto",  30, height/2 - 125); 
    text("Haga click derecho para deshacer la acción",  30, height/2 - 100); 
    text("Dibuja en el lado derecho",  30, height/2 - 75); 
    text("Pulsa F para borrar todo el dibujo", 30, height/2-50);
    text("Pulsa ENTER para mostrar en 3D",  30, height/2 - 25); 
  } else if (modo3D){
    textSize(16);
    text("Pulsa F para borrar todo el dibujo", 30, height-150);
    text("W = Arriba", 30, height-125);
    text("S = Abajo", 30, height-100);
    text("A = Izquierda",30, height-75);
    text("D = Derecha", 30, height-50);
  }
}

void toggleDrawingState(){
    listaLineas.clear();
    listaPuntos.clear();
    objeto = null;
    modo3D=false;
    modo2D=true;
}

void dibuja(){
  strokeWeight(5);
  point(listaPuntos.get(listaPuntos.size()-1).x,listaPuntos.get(listaPuntos.size()-1).y);
  strokeWeight(2);
}

void lineasDibujadas(){
  if (listaLineas.size() > 0){    
    for (Line line : listaLineas){
      line(line.getpuntoPrimero().x(), line.getpuntoPrimero().y(), line.getpuntoSegundo().x(), line.getpuntoSegundo().y());
    }
    strokeWeight(5);
    for (Point p : listaPuntos){
      point(p.x(),p.y());
    }
    strokeWeight(2);
  }
}
