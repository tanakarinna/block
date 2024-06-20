import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//import ddf.minim.signals.*;
//import ddf.minim.spi.*;
//import ddf.minim.ugens.*;

float b_x, b_y; // ボールの左上の座標
float b_w = 50, b_h = 50; // ボールの幅と高さ
float b_dx, b_dy; // ボールの移動速度
float r_x,r_y;//ラケットの左上の座標
float r_w = 80, r_h = 80; // ラケットの幅と高さ
float r_dx;//ラケットの移動速度1
int thunder1Count = 0;//サンダー1の命
int thunder2Count = 0;//サンダー2の命
int thunder3Count = 0;//サンダー3の命
int thunder4Count = 0;//サンダー4の命
int snowCount = 1;//雪の命
int rainbow1Count = 0;//虹の命
int rainbow2Count = 0;//虹の命
int starCount = 0;//月の命
int gameTime;//ゲームプレイの時間
int limitTime;//ゲームの制限時間
int ballStatus = 0;//ボールの状態
int scene = 1;//一番初めのシーン

/*
画像の名前を定義
*/
PImage teruteru1;
PImage cloud3;
PImage cloud2;
PImage cloud1;
PImage sun;
PImage thunder;
PImage sky1;
PImage rainbow;
PImage storm;
PImage snow1;
PImage sky2;
PImage sky3;
PImage sky4;
PImage snow2;
PImage teruteru2;
PImage teruteru3;
PImage teruteru4;
PImage star;
PImage shootingstar;
PImage start;
PImage result1;
PImage result2;
PImage result3;
PImage result4;
PImage result5;
PImage explain_scene;

int score = 0;//ゲーム終了時の得点

int racketLife=3; //ラケットの命

int thunderItem[] = new int[1];//雷アイテムの余命カウンター
int snowItem[] = new int[1];//雪アイテムの余命カウンター
int rainbowItem[] = new int[1];//虹アイテムの余命カウンター
int starItem[] = new int[1];//虹アイテムの余命カウンター

void setup() {
  size(700,850);//画面のサイズ
  initBall(); // ボールの初期化
  initRacket();//ラケットの初期化
  initBlocks(); // ブロックの初期化
  initThunder1 (); //雷アイテムの初期化
  initThunder2 (); //雷アイテムの初期化
  initThunder3 (); //雷アイテムの初期化
  initThunder4 (); //雷アイテムの初期化
  //initSnow ();//雪アイテムの初期化
  initRainbow1();//虹アイテムの初期化
  initRainbow2();//虹アイテムの初期化
  initStar();//星アイテムの初期化
  
  //画像の読み込み
  teruteru1 = loadImage("teruteru.png");
  cloud3 = loadImage("cloud3.png");
  cloud2 = loadImage("cloud2.png");
  cloud1 = loadImage("cloud1.png");
  sun = loadImage("sun.png");
  thunder = loadImage("thunder.png");
  sky1 = loadImage("sky1.png");
  rainbow = loadImage("rainbow.png");
  storm = loadImage("storm.png");
  snow1 = loadImage ("snow1.png");
  sky2 = loadImage("sky2.png");
  sky3 = loadImage("sky3.png");
  sky4 = loadImage("sky4.png");
  snow2 = loadImage("snow2.png");
  teruteru2 = loadImage("teru2.png");
  teruteru3 = loadImage("teru3.png");
  teruteru4 = loadImage("blackteruteru.png");
  star = loadImage("star.png");
  shootingstar = loadImage("shootingstar.png");
  start = loadImage("start_scene.png");
  explain_scene = loadImage("ex_scene.png");
  result1 = loadImage("result1.png");
  result2 = loadImage("result2.png");
  result3 = loadImage("result3.png");
  result4 = loadImage("result4.png");
  result5 = loadImage("result5.png");
  
  
  minim = new Minim(this);
  //BGMファイルをロード
  rainTrack = minim.loadFile("rain_music.mp3");
  poseTrack = minim.loadFile("pose_music.mp3");
  damageEffect = minim.loadSample("damage.mp3");
 
  // 最初のBGMを再生
  playBGM(poseTrack);
  //currentTrack = null;
  //pose_music();
}




/*
シーンの入れ替え
*/
void draw() {
  switch(scene){
    case 1:
    start_scene();
    break;
    case 2:
    game_scene();
    break;
    case 3:
    result_scene();
    break;
    case 4:
    explain_scene();
    break;
  }
}
