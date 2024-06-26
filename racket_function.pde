/*ブロックの座標と速さを初期化*/
void initRacket() {
  r_x = width /2;
  r_y = height-r_h;
  r_dx = 50.0;
}


int startTime;//ブログラム実行時からの経過時間

void keyPressed() {
  if (key == CODED) {      // コード化されているキーが押された
    if (keyCode == RIGHT) {    // rightキーが押されたとき画面右方向に動かす
      r_x += r_dx;
    }
    if (keyCode == LEFT) {   // leftキーが押されたときに画面左方向に動かす
      r_x -= r_dx;
    }
    if (keyCode == UP && ballStatus == 0) {  //upキーが押されたときに画面上方向に動かす
      ballStatus = 1;
      b_dx = 0;
      b_dy = -50;
    }
    if (keyCode == SHIFT){
      if(scene==1){
      scene=5;
      }
    }
  }
  if (key == ENTER || key == RETURN) {//enterキーが押されたとき
    if (scene==1) {//スタート画面からゲーム画面に切り替える、ゲームの開始時間を定義する
      startTime = millis();
      playBGM(rainTrack); // ゲーム画面のBGMを再生
      scene=2;
      //pose_stop();
      //rain_music();
    }
    if (scene==3) {//結果画面からスタート画面に切り替える
      playBGM(poseTrack);
      scene=1;
      //rain_stop();
      //pose_music();
    }
    if(scene==4){//説明画面からスタート画面に切り替える
      scene=1;
    }
  }
  if(key == TAB){
    if(scene==1){//スタート画面から説明画面に切り替える
      scene=4;
    }
  }
  if(key == '1'){
    if(scene==5){
      scene=1;
      teruCloths=1;
    }
  }
  if(key == '2'){
    if(scene==5){
      scene=1;
      teruCloths=2;
    }
  }
  if(key == '3'){
    if(scene==5){
      scene=1;
      teruCloths=3;
    }
  }
  if(key == '4'){
    if(scene==5){
      scene=1;
      teruCloths=4;
    }
  }
  if(key == '5'){
    if(scene==5){
      scene=1;
      teruCloths=5;
    }
  }
}

void checkAndShowRacket(float r_y) {
  if (r_x + r_w > width) { // 右に寄りすぎていたら補正する
    r_x = width - r_w - 10;
  }

  if (r_x < 0) { // 左に寄りすぎていたら補正する
    r_x = 0;
  }


  /* ラケットにボールが当たったらボールを上方へ跳ね返す */
  if (blockHitCheck(r_x, r_y, r_w, r_h, b_x, b_y, b_w, b_h, b_dx, b_dy) > 0) {
    b_dy = -2;
  }

/*
 雷にボールが当たったらracketLifeを１減らす
*/

  if (thunder1Count>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, thunder1_x, thunder1_y, thunder1_w, thunder1_h)) {
      racketLife = racketLife-1;   
      playDamageEffect();
    }
  }
  if (thunder2Count>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, thunder2_x, thunder2_y, thunder2_w, thunder2_h)) {
      racketLife = racketLife-1;
      playDamageEffect();
    }
  }
  if (thunder3Count>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, thunder3_x, thunder3_y, thunder3_w, thunder3_h)) {
      racketLife = racketLife-1;
      playDamageEffect();
    }
  }
  if (thunder4Count>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, thunder4_x, thunder4_y, thunder4_w, thunder4_h)) {
      racketLife = racketLife-1;
      playDamageEffect();
    }
  }

/*
虹に当たったらracketLifeを1増やす
*/

  if (rainbow1Count>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, rainbow1_x, rainbow1_y, rainbow1_w, rainbow1_h)) {
      racketLife = racketLife+1;
      playHealEffect();
    }
  }
  if (rainbow2Count>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, rainbow2_x, rainbow2_y, rainbow2_w, rainbow2_h)) {
      racketLife = racketLife+1;
      playHealEffect();
    }
  }

/*
星に当たったらランダムで一つのブロックの耐久値を1減らす
*/

  if (star1Count>0) {
    if (isOverlap(b_x, b_y, b_w, b_h, star_x, star_y, star_w, star_h)) {
      star1Count = star1Count - 1;
      playStarEffect();
      //image(shootingstar, shootingstar_x, shootingstar_y, shootingstar_w, shootingstar_h);
      //shootingstar_x -= shootingstar_dx;
      //shootingstar_y += shootingstar_dy;
      //showShootingstar = true;
      // shootingstar_x =width;
      // shootingstar_y = 40;
      ArrayList<Integer> liveBlockList = new ArrayList();//liveBlockListというArrayListを作る
      for (int i = 0; i < block.length;i++){
        if (block[i] > 0 ){
         liveBlockList.add(i);
       }
      }
      int randomNumber = int(random(liveBlockList.size()));
      int deleteNumber = liveBlockList.get(randomNumber);
      block[deleteNumber]--;
    }
  }
}


/*
ラケットの耐久値により表示するラケットの画像を変える
*/
void showRacket1() {
  if (racketLife>=3) {
    racketLife = 3;
    image(teru1_1, r_x +20, height-155, r_w, r_h);
  } else if (racketLife==2) {
    image(teru1_2, r_x+20, height-155, r_w, r_h);
  } else if (racketLife==1) {
    image(teru1_3, r_x +20, height-155, r_w, r_h);
  } else if (racketLife<=0) {
    image(teru1_4, r_x +20, height-155, r_w, r_h);
    racketLife = 0;
  }
}

void showRacket2() {
  if (racketLife>=3) {
    racketLife = 3;
    image(teru2_1, r_x +20, height-155, r_w, r_h);
  } else if (racketLife==2) {
    image(teru2_2, r_x+20, height-155, r_w, r_h);
  } else if (racketLife==1) {
    image(teru2_3, r_x +20, height-155, r_w, r_h);
  } else if (racketLife<=0) {
    image(teru2_4, r_x +20, height-155, r_w, r_h);
    racketLife = 0;
  }
}

void showRacket3() {
  if (racketLife>=3) {
    racketLife = 3;
    image(teru3_1, r_x +20, height-155, r_w, r_h);
  } else if (racketLife==2) {
    image(teru3_2, r_x+20, height-155, r_w, r_h);
  } else if (racketLife==1) {
    image(teru3_3, r_x +20, height-155, r_w, r_h);
  } else if (racketLife<=0) {
    image(teru3_4, r_x +20, height-155, r_w, r_h);
    racketLife = 0;
  }
}

void showRacket4() {
  if (racketLife>=3) {
    racketLife = 3;
    image(teru4_1, r_x +20, height-155, r_w, r_h);
  } else if (racketLife==2) {
    image(teru4_2, r_x+20, height-155, r_w, r_h);
  } else if (racketLife==1) {
    image(teru4_3, r_x +20, height-155, r_w, r_h);
  } else if (racketLife<=0) {
    image(teru4_4, r_x +20, height-155, r_w, r_h);
    racketLife = 0;
  }
}

void showRacket5() {
  if (racketLife>=3) {
    racketLife = 3;
    image(teru5_1, r_x +20, height-155, r_w, r_h);
  } else if (racketLife==2) {
    image(teru5_2, r_x+20, height-155, r_w, r_h);
  } else if (racketLife==1) {
    image(teru5_3, r_x +20, height-155, r_w, r_h);
  } else if (racketLife<=0) {
    image(teru5_4, r_x +20, height-155, r_w, r_h);
    racketLife = 0;
  }
}
