void game_scene() {
  thunder1Count = 0;//サンダーの命
  thunder2Count = 0;//サンダーの命
  thunder3Count = 0;//サンダーの命
  thunder4Count = 0;//サンダーの命
  rainbow1Count = 0;//虹の命
  rainbow2Count = 0;//虹の命
  starCount = 0;//月の命

  //if (currentTrack != rainTrack) {
  //  playTrack(rainTrack);
  //}

  gameTime = millis() - startTime;//ゲームがスタートしてからの時間
  limitTime = 30000 - gameTime;//30秒の制限時間

/*
時間が経過するにつれて外形の画像が変更
だんだんと天気が良い画像に切り替わる
*/  
  if (gameTime >= 0 && gameTime < 7500) {
    image(sky1, 0, 0, width, height);//初期の背景画像
  }

  if (gameTime >= 7500 && gameTime < 15000) {
    image(sky2, 0, 0, width, height);//二段階目の背景画
  }

  if (gameTime >= 15000 && gameTime < 22500) {
    image(sky3, 0, 0, width, height);///三段階目の背景画像
  }

  if (gameTime >= 22500) {
    image(sky4, 0, 0, width, height);//四段階目の背景画像
  }


  sunShot ();//ボールの発射

  moveBlocks();//ブロックを上下に動かす
  checkBlocks(); // ブロックによるボールの跳ね返り処理
  showBlocks(); //　命が残っているブロックを表示する
  
  if (millis() % 2000 >= 0 && millis() % 2000 < 1000) {
    thunder1Count = 1;
    showThunders1 ();//時間で雷アイテム1を表示する
  }
  if (gameTime % 2000 >= 0 && gameTime % 2000 < 1000) {
    thunder2Count = 1;
    showThunders2 ();//時間で雷アイテム2を表示する
  }
  if (millis() % 2000 >= 0 && millis() % 2000 < 1000) {
    thunder3Count = 1;
    showThunders3 ();//時間で雷アイテム3を表示する
  }
  if (gameTime % 2000 >= 0 && gameTime % 2000 < 1000) {
    thunder4Count = 1;
    showThunders4 ();//時間で雷アイテム4を表示する
  }


  if (millis() % 5000 >= 0 && millis() % 5000 < 1000) {
    rainbow1Count = 1;
    showRainbows1 ();//命が残っている虹アイテム1を表示する
  }
  if (gameTime % 5000 >= 0 && gameTime % 5000 < 1000) {
    rainbow2Count = 1;
    showRainbows2 ();//命が残っている虹アイテム2を表示する
  }

  if (gameTime % 5000 >= 0 && gameTime % 5000 < 1000) {
    starCount = 1;
    showStars ();//命が残っている月アイテムを表示する
  }


  checkAndShowRacket(height-80); // ラケットの表示とボールの打ち返し処理
  showRacket();//ラケットの表示

/*
30秒のカウントダウンタイマーの表示
*/

  PFont myFont = loadFont("CenturyGothic-48.vlw");//フォントの指定
  textFont(myFont);
  fill(255, 255, 255, 75);//文字の色と透明度を指定
  textSize(130);//文字の大きさを指定
  text(limitTime/1000, width/2-80, height/2);//表示する文字の内容と幅と高さ

/*
ゲームの終了条件を設定し、結果画面に移行する
ゲーム時間が終了した場合またはラケットのライフが0になった場合または全てのブロックが消えた場合の3つの場合がある
*/
  if (gameTime/1000 > 30 || racketLife == 0 || checkBlockDeleted()==false ) {
    for(int i = 0; i < block.length ; i++){
      score = score + block[i];
    }
    scene = 3;
    playBGM(poseTrack);
  }
}

//ゲームのスタート画面
void start_scene() {
  image(start, 0, 0, width, height);
  
  //if (currentTrack != poseTrack) {
  //  playTrack(poseTrack);
  //}
}

/*
ゲームのスコア画面
合計のスコアの値により、5段階の評価に分け、その評価に合った画像を表示する
*/

void result_scene() {
  //if (currentTrack != poseTrack) {
  //  playTrack(poseTrack);
  //}
  
  if(score >= 0 && score <6){
    image(result5, 0, 0, width, height);
  }
  if(score >= 6 && score <11){
    image(result4, 0, 0, width, height);
  }
  if(score >= 11 && score <16){
    image(result3, 0, 0, width, height);
  }
  if(score >= 16 && score <21){
    image(result2, 0, 0, width, height);
  }
  if(score >= 21 ){
    image(result1, 0, 0, width, height);
  }
}

/*
ブロックが残っているのかを確認する
ブロックが一つでも残っている場合にはtrueを、そうでない場合にはfalse
*/

boolean checkBlockDeleted() {
  for (int i = 0; i < block.length; i++) {
   if(block[i]>=1){
     return true;
   }
  }
  return false;
}

void explain_scene(){
  image(explain_scene,0,0,width,height);
  //if (currentTrack != poseTrack) {
  //  playTrack(poseTrack);
  //}
}
