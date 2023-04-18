import processing.video.*;
import processing.serial.*;

Movie myMovie;
Serial myPort;

int lastKnobValue = 0;
float framesToProgress = 0.2;

void setup() {
 fullScreen();
 background(0);
  myMovie = new Movie(this, "visu.mp4");
  myMovie.loop();
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, "COM5", 9600);
  
 
  myMovie.play();
  myMovie.pause();
}

void draw() {
  if (myPort.available() > 0) {
    int knobValue = Integer.parseInt(myPort.readStringUntil('\n').trim());
    println(knobValue);
    if (abs(knobValue - lastKnobValue) >= 4)  {
      // progress the video by X number of frames:
      myMovie.jump(myMovie.time() + (knobValue - lastKnobValue) * framesToProgress);
      // play the video if the knob is being turned:
      myMovie.play();
    } else {
      myMovie.pause();
    }
    
    lastKnobValue = knobValue;
  }
  image(myMovie, 0, 0);
}
void movieEvent(Movie m) {
  m.read();
}
