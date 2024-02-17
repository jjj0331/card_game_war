#card

class Card
  attr_reader :cards,:playercards

   
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
    @cards.push("joker")
    #プレイヤーが持っているカードも初期化
    @playercards=[]
  end

  def cardPoints(num=1)
    if num=="joker"
      99
    elsif num=="♠1"
      98
    else       
      case num[1..-1]
      when 1
        13
      when 13
        12
      when 12
        11
      when 11
        10
      else
        num[1..-1].to_i
      end
    end      
  end  
end



