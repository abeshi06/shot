require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'
require_relative 'shotbomb'

backwindow = BackWindow.new
hero = Hero.new( BackWindow::WINDOW_WIDTH / 2, BackWindow::SKYLINE)

## 爆弾インスタンスを、配列で管理する
bombs = []
3.times do
  bombs << Shotbomb.new
end

## ループしている回数をカウントする変数
loopCount = 0

Window.loop do
  hero.move

  backwindow.draw
  hero.draw

  ## 爆弾を画面に書き出す
  bombs.each do |bomb|
    bomb.draw
  end

  ## 爆弾の位置を移動させる
  bombs.each do |bomb|
    bomb.drop
  end

  bombs.each do |bomb|
    if bomb.flag == false && Input.key_down?(K_SPACE) && loopCount % 4 == 0
      ## 爆弾が画面外にあり、かつスペースキーが押されており、かつループしている回数を4で割ってあまりが0なら
      ## 爆弾をルビィくんから発射する
      bomb.shot(hero.x, hero.y)
      ## 1個でも発射すれば、eachを抜け出す
      break
    end
    ## 爆弾が画面内にあれば、次の爆弾について考える
  end

  ## ループ回数について、カウントアップする
  loopCount += 1

  break if Input.key_push?(K_ESCAPE)
end