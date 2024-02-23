#ディーラー作成⇒Playerクラスを継承
require "./player.rb"
require "./card.rb"

class Blackjackplayer < Player

#============================================================================  
  #【ユーザ作成】
  def self.create_users(names)
    names.map do |name|
      Blackjackplayer.new(name)
    end  
  end

#============================================================================  
  #【カード手持ちカードの合計】
  def sum
    sum = 0
    ace_count = 0
  
    @myhand.each do |card|
      if card[1..-1].to_i == 1
        ace_count += 1
      end
      sum += point(card)
    end
  
    while ace_count > 0 && sum > 21
      sum -= 10
      ace_count -= 1
    end
    sum
    
  end
  

#============================================================================  
  #【カードのポイントを返す】
  def point(card)  
    case card[1..-1].to_i
    when 1
      11 
    when 13
      10
    when 12
      10
    when 11
      10
    else
      card[1..-1].to_i
    end
  end

end  