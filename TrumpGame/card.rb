#card

class Card
#============================================================================
  #インスタンス変数：cards(トランプカードのこと)
  attr_accessor :cards

#============================================================================ 
  #【初期化】⇒引数:option(Jokerを含めるか)
  def initialize(option=0)

    #トランプの各カードを配列
    @cards=[]
    
    #カードの種類
    marks=["♦","♠","♥","🍀"]
    numbers=["1","2","3","4","5","6","7","8","9","10","11","12","13"]
    
    #ループでカードを作成する
    marks.each do |mark|
      numbers.each do |number|
        @cards.push(mark+number)
      end
    end
    
    #optionでjokerを含めるのか含めないか
    if option!=0
      @cards.push("joker")
    end   
  end
end