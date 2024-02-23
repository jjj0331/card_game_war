#ディーラー作成⇒Playerクラスを継承
require "./blackjackplayer.rb"

class Dealer < Blackjackplayer
#============================================================================
  #【初期化】：nameを固定
  def initialize
    super("ディーラー")
  end

#============================================================================
  #【カードを見せる】
  def dealershow
    if @myhand.length>0
      @myhand.each_with_index do |card,index|
        if index==0
          print "【#{index+1}枚目は ?? "
        else
          print "#{index+1}枚目は:#{card} "
        end  
      end  
    puts "】"
    end
  end 

end  
