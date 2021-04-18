void setup(){
	size(2400,1800);
}



void draw(){
	background(255);
	graph_nn(new int[]{28*28,28*29,2},180,20,63);
	save("nn-shape.png");
	noLoop();
}



void graph_nn(int[] nn,int c_sz,int b_sz,int f_sz){
	ellipseMode(CENTER);
	strokeWeight(2);
	textAlign(CENTER,CENTER);
	textFont(createFont("Consolas",f_sz));
	for (int k=0;k<nn.length-1;k++){
		for (int j=0;j<min(nn[k],5);j++){
			if (nn[k]>5&&j==3){
				continue;
			}
			for (int i=0;i<min(nn[k+1],5);i++){
				if (nn[k+1]>5&&i==3){
					continue;
				}
				line((k+1)*(width/(nn.length+1)),(j+1)*(height/(float)(min(nn[k],5)+1)),(k+2)*(width/(nn.length+1)),(i+1)*(height/(float)(min(nn[k+1],5)+1)));
			}
		}
	}
	for (int j=0;j<nn.length;j++){
		push();
		noStroke();
		fill(0);
		text(nn[j],(j+1)*(width/(nn.length+1)),f_sz*2);
		pop();
		if (nn[j]<=4){
			for (int i=0;i<nn[j];i++){
				circle((j+1)*(width/(nn.length+1)),(i+1)*(height/(float)(nn[j]+1)),c_sz);
			}
		}
		else{
			for (int i=0;i<5;i++){
				if (i!=3){
					circle((j+1)*(width/(nn.length+1)),(i+1)*(height/6),c_sz);
				}
				else{
					push();
					noStroke();
					fill(0);
					circle((j+1)*(width/(nn.length+1)),(i+1)*(height/6)-c_sz*0.5,b_sz);
					circle((j+1)*(width/(nn.length+1)),(i+1)*(height/6),b_sz);
					circle((j+1)*(width/(nn.length+1)),(i+1)*(height/6)+c_sz*0.5,b_sz);
					pop();
				}
			}
		}
	}
}
