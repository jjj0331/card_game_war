#トランプゲームの戦争
require './card' 
require './player' 


#ゲーム開始の宣言
puts
puts "********************************************************"
puts "         【トランプゲームの戦争を開始】                    "
puts "********************************************************"
puts
puts "********************************************************"
puts "         【プレイヤー数を設定してください】                "
puts "********************************************************"

#カードを作成
trump=Card.new
puts "log:カードを52枚作成"
puts "log:プレイヤー数は2名"

#ユーザを作成:2
player_count=2
players=[]
player1=Player.new("jun")
player2=Player.new("イワサキ")
players.push(player1)
players.push(player2)

#カードを配る
puts "********************************************************"
puts "         【カードを配る】                "
puts "********************************************************"
while trump.cards.length!=0
  players.each do |player|
    player.draw(trump.cards,1)
  end
end

puts "log:プレイヤー1の手持ちカードは#{player1.havingcards.length}です"
puts "log:プレイヤー2の手持ちカードは#{player2.havingcards.length}です"

#「戦争」と宣言
puts "********************************************************"
puts "         【戦争開始】                "
puts "********************************************************"

#各プレイヤーがカードを提出

puts "********************************************************"
puts "         【各プレイヤーがカードを提出】                "
puts "********************************************************"


player1_card=player1.output
player2_card=player2.output

puts "log:player1のカードは#{player1_card}"
puts "log:player2のカードは#{player2_card}"
puts "log:player1のカードは#{player1_card[1..-1]}"
puts "log:player2のカードは#{player2_card[1..-1]}"



#勝敗決める→勝った人が提出したカードをもらう

#...

# p player1.havingcards
# p player2.havingcards
# puts "#{trump.cards.length}"

