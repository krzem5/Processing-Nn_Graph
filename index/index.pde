void setup() {
  size(2400, 1800);
}

void draw() {
  background(255);
  graph_nn(new int[]{28*28, 28*29, 2}, 180, 20, 63);
  save("nn-shape.png");
}



void graph_nn(int[] nn, int C_SZ, int B_SZ, int F_SZ) {
  ellipseMode(CENTER);
  strokeWeight(2);
  textAlign(CENTER, CENTER);
  textFont(createFont("Consolas", F_SZ));
  for (int k=0; k<nn.length-1; k++) {
    for (int j=0; j<min(nn[k], 5); j++) {
      if (nn[k]>5&&j==3) {
        continue;
      }
      for (int i=0; i<min(nn[k+1], 5); i++) {
        if (nn[k+1]>5&&i==3) {
          continue;
        }
        line((k+1)*(width/(nn.length+1)), (j+1)*(height/(float)(min(nn[k], 5)+1)), (k+2)*(width/(nn.length+1)), (i+1)*(height/(float)(min(nn[k+1], 5)+1)));
      }
    }
  }
  for (int j=0; j<nn.length; j++) {
    push();
    noStroke();
    fill(0);
    text(nn[j], (j+1)*(width/(nn.length+1)), F_SZ*2);
    pop();
    if (nn[j]<=4) {    
      for (int i=0; i<nn[j]; i++) {
        circle((j+1)*(width/(nn.length+1)), (i+1)*(height/(float)(nn[j]+1)), C_SZ);
      }
    } else {    
      for (int i=0; i<5; i++) {
        if (i!=3) {
          circle((j+1)*(width/(nn.length+1)), (i+1)*(height/6), C_SZ);
        } else {
          push();
          noStroke();
          fill(0);
          circle((j+1)*(width/(nn.length+1)), (i+1)*(height/6)-C_SZ*0.5, B_SZ);
          circle((j+1)*(width/(nn.length+1)), (i+1)*(height/6), B_SZ);
          circle((j+1)*(width/(nn.length+1)), (i+1)*(height/6)+C_SZ*0.5, B_SZ);
          pop();
        }
      }
    }
  }
}
