import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  player = minim.loadFile("data/song1.mp3"); // Replace with your song file
  fft = new FFT(player.bufferSize(), player.sampleRate());
  player.play();
}

void draw() {
  background(0);

  fft.forward(player.mix);
  float intensity = fft.getBand(20); // Adjust the band index as needed

  // Spawn bubbles based on intensity
  if (random(1) < intensity) {
    float x = random(width);
    float y = random(height);
    float radius = map(intensity, 0, 1, 10, 50);
    fill(255, 100);
    ellipse(x, y, radius, radius);
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
