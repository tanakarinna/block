Minim minim; //Minim型変数であるminimの宣言
//AudioPlayer currentTrack;
AudioPlayer rainTrack;
AudioPlayer poseTrack;
AudioSample damageEffect;
AudioSample healEffect;
AudioSample starEffect;

// BGMを再生する関数
void playBGM(AudioPlayer newBGM) {
  // 現在再生中のBGMを停止
  if (rainTrack.isPlaying()) {
    rainTrack.pause();
    rainTrack.rewind();
  }
  if (poseTrack.isPlaying()) {
    poseTrack.pause();
    poseTrack.rewind();
  }
  
  // 新しいBGMを再生
  newBGM.loop();
}

void stop() {
  rainTrack.close();
  poseTrack.close();
  damageEffect.close();
  healEffect.close();
  starEffect.close();
  minim.stop();
  super.stop();
}

// 効果音を再生する関数
void playDamageEffect() {
  damageEffect.trigger();
}

void playHealEffect(){
  healEffect.trigger();
}

void playStarEffect(){
  starEffect.trigger();
}
//void playSoundEffect() {
//  soundEffect.rewind();
//  soundEffect.play();
//}

//void effectstop() {
//  soundEffect.close();
//  minim.stop();
//  super.stop();
//}

//void playTrack(AudioPlayer track) {
//  if (currentTrack != null) {
//    currentTrack.close(); // 現在再生中のトラックを停止
//  }
//  currentTrack = track;
//  currentTrack.rewind();
//  currentTrack.play();
//}

//void stopCurrentTrack() {
//  if (currentTrack != null) {
//    currentTrack.close();
//    currentTrack = null;
//  }
//}


//AudioPlayer pose_player; //サウンドデータ格納用の変更
//AudioPlayer rain_player; //サウンドデータ格納用の変更

//void pose_stop() {
//pose_player.close(); //サウンドデータを終了
//minim.stop();
//super.stop(); /*superは、 サブクラスのスーパークラスを参照するために使用される
//キーワード*/
//}

//void pose_music() {
//minim = new Minim(this); //初期化,thisは現在のオブジェクトを参照する。
//pose_player = minim.loadFile("pose_music.mp3"); //bgm.mp3（音楽ファイル）の読み込み
//pose_player.play(); //再生
//}

//void rain_stop() {
//pose_player.close(); //サウンドデータを終了
//minim.stop();
//super.stop(); /*superは、 サブクラスのスーパークラスを参照するために使用される
//キーワード*/
//}


//void rain_music() {
//minim = new Minim(this); //初期化,thisは現在のオブジェクトを参照する。
//pose_player = minim.loadFile("rain_music.mp3"); //bgm.mp3（音楽ファイル）の読み込み
//pose_player.play(); //再生
//}
