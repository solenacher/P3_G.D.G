import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;
float x1L = 600;
float x2L = 600;
float x3L = 600;
float x4L = 600;
float x5L = 600;
float x6L = 600;
float x1R = 900;
float x2R = 900;
float x3R = 900;
float x4R = 900;
float x5R = 900;
float x6R = 900;
boolean isInverse = false;  
boolean isFilled = true;   
boolean savePDF = false;   

void setup() {
  size(1000, 500);
  background(0);
  strokeWeight(10);
  
  cp5 = new ControlP5(this);

  addSlider("x1L", 20, 20, 600, 750, x1L);
  addSlider("x2L", 20, 50, 600, 750, x2L);
  addSlider("x3L", 20, 80, 600, 750, x3L);
  addSlider("x4L", 20, 110, 600, 750, x4L);
  addSlider("x5L", 20, 140, 600, 750, x5L);
  addSlider("x6L", 20, 170, 600, 750, x6L);
  addSlider("x1R", 210, 20, 750, 900, x1R);
  addSlider("x2R", 210, 50, 750, 900, x2R);
  addSlider("x3R", 210, 80, 750, 900, x3R);
  addSlider("x4R", 210, 110, 750, 900, x4R);
  addSlider("x5R", 210, 140, 750, 900, x5R);
  addSlider("x6R", 210, 170, 750, 900, x6R);

 
  cp5.addToggle("isInverse")
     .setPosition(20, 220)
     .setSize(50, 20)
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     .setLabel("Invert Colors");


  cp5.addToggle("isFilled")
     .setPosition(20, 265)
     .setSize(50, 20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setLabel("Filled Shape");


  cp5.addButton("saveToPDF")
     .setPosition(20, 310)
     .setSize(100, 30)
     .setLabel("Save PDF")
     .onClick(event -> savePDF = true);
}

void addSlider(String name, float posX, float posY, float min, float max, float value) {
  Slider slider = cp5.addSlider(name)
     .setPosition(posX, posY)
     .setRange(min, max)
     .setSize(150, 20)
     .setValue(value);

  // Cambiar el color del slider
  slider.setColorBackground(color(100, 100, 100));  
  slider.setColorActive(color(255, 0, 0));          
  slider.setColorValue(color(0, 255, 0));          
  slider.setColorLabel(color(255));                
}

void draw() {
 
  if (savePDF) {
    beginRecord(PDF, "output.pdf");
  }


  if (isInverse) {
    background(255); 
    fill(0);        
    cp5.getController("isInverse").setColorLabel(color(0)); 
    cp5.getController("isFilled").setColorLabel(color(0));  
    setSlidersColor(color(0));  
  } else {
    background(0);   
    fill(255);      
    cp5.getController("isInverse").setColorLabel(color(255)); 
    cp5.getController("isFilled").setColorLabel(color(255));  
    setSlidersColor(color(255)); 
  }

  if (isFilled) {
    noStroke();
  } else {
    noFill();
    stroke(isInverse ? 0 : 255); 
  }

  beginShape();
  vertex(x1L, 80);
  vertex(x2L, 144);
  vertex(x3L, 208);
  vertex(x4L, 272);
  vertex(x5L, 336);
  vertex(x6L, 400);
  vertex(x6R, 400);
  vertex(x5R, 336);
  vertex(x4R, 272);
  vertex(x3R, 208);
  vertex(x2R, 144);
  vertex(x1R, 80);
  endShape(CLOSE);

 
  if (savePDF) {
    endRecord();
    savePDF = false; 
    println("PDF saved as output.pdf");
  }
}

void setSlidersColor(int labelColor) {
 
  cp5.getController("x1L").setColorLabel(labelColor);
  cp5.getController("x2L").setColorLabel(labelColor);
  cp5.getController("x3L").setColorLabel(labelColor);
  cp5.getController("x4L").setColorLabel(labelColor);
  cp5.getController("x5L").setColorLabel(labelColor);
  cp5.getController("x6L").setColorLabel(labelColor);
  cp5.getController("x1R").setColorLabel(labelColor);
  cp5.getController("x2R").setColorLabel(labelColor);
  cp5.getController("x3R").setColorLabel(labelColor);
  cp5.getController("x4R").setColorLabel(labelColor);
  cp5.getController("x5R").setColorLabel(labelColor);
  cp5.getController("x6R").setColorLabel(labelColor);
}
