//Stijn Hogerwerf
//500875840
int NCIRCLES = 20;
float [] PlaceX = new float[NCIRCLES];
float [] PlaceY = new float[NCIRCLES];
float [] Size = new float[NCIRCLES];
float [] clr = new float[NCIRCLES];

int iCircle;

float PlayerX ;
float PlayerY ;
float PlayerSize = 60;
color Playerclr;

float x, y, r;
final int stop_at_zero = 0;

void setup() {
  size(800, 600);

  //EnemyBall
  for (int iCircle = 0; iCircle<NCIRCLES; iCircle++) {
    PlaceX[iCircle] = random(0, 800);
    PlaceY[iCircle] = random(0, 600);

    Size[iCircle] = random(40, 200);

    clr[iCircle] = random(100, 255);
  }
}

void draw() {
  background(0);

  //EnemyBall
  for (int iCircle = 0; iCircle<NCIRCLES; iCircle++) {
    fill(clr[iCircle]);
    circle(PlaceX[iCircle], PlaceY[iCircle], Size[iCircle]);

    //x = PlaceX[iCircle] - PlayerX;
    //y = PlaceY[iCircle] - PlayerY;
    //r = Size[iCircle]/2 + PlayerSize/2;
  }

  //Player
  PlayerX = mouseX;
  PlayerY = mouseY;
  Playerclr = #FA0D11;

  //checkCollsion
  for (int iCircle= 0; iCircle<NCIRCLES; iCircle++) {
    x = PlaceX[iCircle] - PlayerX;
    y = PlaceY[iCircle] - PlayerY;
    r = Size[iCircle]/2 + PlayerSize/2;
    if (circlePlayerOverlap(x, y, r)) {
      if (PlayerSize > Size[iCircle] && Size[iCircle] > 0) {
        PlayerSize += 1;
        Size[iCircle] -= 1;
        if(Size[iCircle] == 0){
          Size[iCircle] = stop_at_zero;
        }
      } else if (PlayerSize < Size[iCircle]) {
        PlayerSize -= 1 ;
        Size[iCircle] += 1;
        if (PlayerSize <= 0) {
          exit();
        }
      }
    }
  }
  fill(Playerclr);
  circle(PlayerX, PlayerY, PlayerSize);
}

//checkCollision
boolean circlePlayerOverlap(float x, float y, float r) {
  if (sqrt(x*x+y*y) < r ) {
    return true;
  } else {
    return false;
  }
}
