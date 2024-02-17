#プレイヤークラス

class Player
  attr_reader :name,:havingcards

  def initialize(name)
    @name=name||"master" 
    @havingcards=[]
  end

  def draw(trump,numbers)
    if trump.length!=0
      for num in 1..numbers do
        #乱数を発生させる
        random=rand(Range.new(0, trump.length-1))
        #playercardsにカードを格納
        @havingcards.push(trump[random])  
        #@cardsからプレイヤーに渡されたカードを引く
        trump.delete_at(random)     
      end 
    end 
  end

  def output
      #乱数を発生させる
      if @havingcards.length!=0
      random=rand(Range.new(0, @havingcards.length-1))
      #playercardsにカードを格納
      output=@havingcards[random]  
      #@cardsからプレイヤーに渡されたカードを引く
      @havingcards.delete_at(random)  
      output
      end   
  end

  def addcard(cards)
     @havingcards.concat(cards)
  end
end