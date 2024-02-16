#card

#=====================================================================
class Card
  attr_reader :cards,:playercards

  #===================================================================== 
  def initialize 
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
    
    #プレイヤーが持っているカードも初期化
    @playercards=[]
  end
  #=====================================================================

    #===================================================================== 
    def Draw(numbers)
      for num in 1..numbers do
        #乱数を発生させる
        random=rand(Range.new(0, @cards.length))
        #playercardsにカードを格納
        @playercards.push(@cards[random])  
        #@cardsからプレイヤーに渡されたカードを引く
        @cards.delete_at(random)     
      end  
    end
    #=====================================================================
end


trump=Card.new

trump.Draw(2)
p trump.playercards
p trump.cards.length
