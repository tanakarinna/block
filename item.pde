float thunder1_x, thunder1_y; // 雷1の左上の座標
float thunder1_w = 50, thunder1_h = 50; // 雷1の幅と高さ
float thunder1_dx, thunder1_dy; // 雷1の移動速度
float thunder2_x, thunder2_y; // 雷2の左上の座標
float thunder2_w = 50, thunder2_h = 50; // 雷2の幅と高さ
float thunder2_dx, thunder2_dy; // 雷2の移動速度
float thunder3_x, thunder3_y; // 雷3の左上の座標
float thunder3_w = 50, thunder3_h = 50; // 雷3の幅と高さ
float thunder3_dx, thunder3_dy; // 雷3の移動速度
float thunder4_x, thunder4_y; // 雷4の左上の座標
float thunder4_w = 50, thunder4_h = 50; // 雷4の幅と高さ
float thunder4_dx, thunder4_dy; // 雷4の移動速度

void initThunder1() {
  thunder1_x = 30;
  thunder1_y = 350;
  thunder1_dx = 0;
  thunder1_dy = 0;
}//雷アイテム1の位置と速度を初期化

void initThunder2() {
  thunder2_x = 230;
  thunder2_y = 350;
  thunder2_dx = 0;
  thunder2_dy = 0;
}//雷アイテム2の位置と速度を初期化

void initThunder3() {
  thunder3_x = 430;
  thunder3_y = 350;
  thunder3_dx = 0;
  thunder3_dy = 0;
}//雷アイテム3の位置と速度を初期化

void initThunder4() {
  thunder4_x = 630;
  thunder4_y = 350;
  thunder4_dx = 0;
  thunder4_dy = 0;
}//雷アイテム4の位置と速度を初期化

void showThunders1 () {
  image(thunder,thunder1_x,thunder1_y,thunder1_w,thunder1_h);//雷アイテム1の画像の表示と位置と大きさ
}
void showThunders2 () {
  image(thunder,thunder2_x,thunder2_y,thunder2_w,thunder2_h);//雷アイテム2の画像の表示と位置と大きさ
}
void showThunders3 () {
  image(thunder,thunder3_x,thunder3_y,thunder3_w,thunder3_h);//雷アイテム3の画像の表示と位置と大きさ
}
void showThunders4 () {
  image(thunder,thunder4_x,thunder4_y,thunder4_w,thunder4_h);//雷アイテム5の画像の表示と位置と大きさ
}



float rainbow1_x,rainbow1_y; //虹1の左上の座標
float rainbow1_w = 50, rainbow1_h = 50; //虹1の幅と高さ
float rainbow1_dx, rainbow1_dy; //虹1の移動速度
float rainbow2_x,rainbow2_y; //虹2の左上の座標
float rainbow2_w = 50, rainbow2_h = 50; //虹2の幅と高さ
float rainbow2_dx, rainbow2_dy; //虹2の移動速度


void initRainbow1 () {
  rainbow1_x = 130;
  rainbow1_y = 350;
  rainbow1_dx = 0;
  rainbow1_dy = 0;
} //虹アイテム1の位置と速度を初期化
void initRainbow2 () {
  rainbow2_x = 530;
  rainbow2_y = 350;
  rainbow2_dx = 0;
  rainbow2_dy = 0;
} //虹アイテム2の位置と速度を初期化

void showRainbows1 () {
  image(rainbow,rainbow1_x,rainbow1_y,rainbow1_w,rainbow1_h);//虹アイテム1の画像の表示と位置と大きさ
}
void showRainbows2 () {
  image(rainbow,rainbow2_x,rainbow2_y,rainbow2_w,rainbow2_h);//虹アイテム2の画像の表示と位置と大きさ
}

float moon_x, moon_y ; //月の左上の座標
float moon_w = 50, moon_h = 50;//月の幅と高さ
float moon_dx,moon_dy; //月の移動速度

void showMoons () {
  image(moon,moon_x,moon_y,moon_w,moon_h);
  }//月アイテムの画像の表示と位置と大きさ

void initMoon() {
  moon_x = 330;
  moon_y = 350;
  moon_dx = 0;
  moon_dy = 0;
}//月アイテムの位置と速度を初期化

float shootingstar_x =width, shootingstar_y = 40; //流れ星の左上の座標
float shootingstar_w = 50, shootingstar_h = 50;//流れ星の幅と高さ
float shootingstar_dx = 20,shootingstar_dy =0; //流れ星の移動速度

//boolean showShootingstar = false;

//if(showShootingstar){
// image(shootingstar, shootingstar_x, shootingstar_y, shootingstar_w, shootingstar_h);
// shootingstar_x -= shootingstar_dx;
//  if(shootingstar_x + shootingstar_w <0 ){
//    showShootingstar = false;
//  }
//}
