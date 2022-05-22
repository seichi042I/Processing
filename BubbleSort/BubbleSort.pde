int num = 100;

int[] simeji = new int[num];
int n = 0;
int right = num-1;
void setup(){
  size(800,800);
 for(int i = 1;i<num+1;i++){
   simeji[i-1] = (height/num)*i; 
 }
 for(int i = 0;i<num;i++){
   int a = int(random(0,num));
   int b = int(random(0,num));
   int t = simeji[a];
   simeji[a] = simeji[b];
   simeji[b] = t;
 }
 frameRate(60);
}

void draw(){
  
  background(0);
  for(int i = 0;i<num;i++){
    if(i == n)fill(255,20,20);
    rect(width*i/num,height,width/num,-simeji[i]);
    fill(255);
  }
  
  if(right==0)noLoop();
  
  if(n==right){
    n = 0;
    right--;
  }
  if(simeji[n]<simeji[n+1]){
    int t = simeji[n];
    simeji[n] = simeji[n+1];
    simeji[n+1] = t;
  }
  n++;
}
