#トランプゲームの戦争
require './card' 
require './player' 


#ゲーム開始の宣言

#カードを作成
trump=Card.new
puts "log:カードを52枚作成"

puts
puts "********************************************************"
puts "         【トランプゲームの戦争を開始】                    "
puts "********************************************************"
puts
puts "********************************************************"
puts "         【プレイヤー数を設定してください】                "
puts "********************************************************"

#エラーのための取りあえずの代入
player_count=trump.cards.length

#プレイヤー数を入力
#breakのみでloopを抜け出す
loop do
  player_count= gets.chomp.to_i
  if player_count<trump.cards.length && player_count>0
    break
  elsif
    puts "#{trump.cards.length}以下の数字を入力してください"  
  end
end    




#ユーザを作成
players=[]
for num in 1..player_count do
  puts "PLAYER#{num.to_s}の名前を入力してください"
  name=gets.chomp 
  player=Player.new(name)
  players.push(player)
end    

#カードを配る
while trump.cards.length!=0
  players.each do |player|
    player.draw(trump.cards,1)
  end
end


puts "********************************************************"
puts "         【カードの枚数を確認】                "
players.each do |player|
  puts "ユーザの名前は:#{player.name}"
  puts "#{player.name}の手持ちの枚数は#{player.havingcards.length}です"   
end
puts "********************************************************"


i=1
while players.all? { |player| player.havingcards.length != 0 }
puts "********************************************************"
puts "【戦争開始#{i}回線目:各プレイヤーはカードを1枚提出】                "

outputs_cards={}
outputs=[]

#各プレイヤーの出したカードを格納
players.each do |player|
  temp=player.output
  outputs_cards[player]=temp
  outputs.push(temp)
end

#一番最大値を求める
outputs_num=[]
outputs.each{|n| outputs_num << trump.cardPoints(n)}
winner_value =outputs_num.max

#最大値を持つPLAYERを見つける
winner=[]
outputs_cards.each do |key,value|
  if winner_value==trump.cardPoints(value)
    winner.push(key.name)
  end
end 

if winner.length==1
  players.each do |player|
      if player.name==winner[0]
        player.addcard(outputs)
      end  
  end
  puts "【戦争開始#{i}回線目勝者は#{winner[0]}】"
else
  puts "【戦争開始#{i}回線目勝者はなし】"
end
i+=1
outputs_cards.each{|out| print "【#{out[0].name}:#{out[1]}】" }
puts
end


puts "********************************************************"
puts "         【終了】                "
puts "********************************************************"
#結果を出力
rank={}
players.each do |player|
  puts "ユーザの名前は:#{player.name}"
  puts "手持ちの枚数は#{player.havingcards.length}です" 
  puts
  rank[player.name] = player.havingcards.length
end

#ハッシュの並び替え　降順にしたいので「-value」
sorted_rank = rank.sort_by { |key, value| -value }

#並び替えを行っているのでそのまま出力
sorted_rank.each_with_index do |(key, value), index|
  puts "#{index + 1}位は #{key}  #{value}枚"
end

