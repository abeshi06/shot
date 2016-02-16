##############################
## ルビィくんが発射する爆弾のクラス
##############################
class Shotbomb
  attr_accessor :x, :y, :flag
  def initialize
    @image=Image.load("image/bomb.png")
    @image.set_color_key(Color::WHITE)
    # 初期表示位置
    @x = 0
    @y = 0
    # 爆弾を表示させるのか、させないのかの判断
    ## true  : 表示させる
    ## false : 表示させない
    @flag = false
  end

  ##############################
  ## 初期化
  ##############################
  def reset
    @x = 0
    @y = 0
    @flag = false
  end

  ##############################
  ## 爆弾を位置を移動させる
  ### @y + @image.height > 0
  ## 画面の内か、画面外かの判定
  ##############################
  def drop
    if @y + @image.height > 0
      @y -= 10
    else
      reset
    end
  end

  ##############################
  ## 爆弾を表示する
  ### @flag
  ## true  : 表示する
  ## flase : 表示しない
  ##############################
  def draw
    Window.draw(@x, @y, @image) if @flag == true
  end

  ##############################
  ## 爆弾を表示する（初期位置）
  ##############################
  def shot(x, y)
    @x = x
    @y = y
    @flag = true
  end

end