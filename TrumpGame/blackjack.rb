require "./card.rb"
require "./dealer.rb"
require "./blackjackplayer.rb"
require "./publicfunction.rb" 
include Publicfunction

puts  "======【ゲーム開始】========================================================" 
puts  "【ブラックジャックを開始します】"
puts 
puts  "======【ゲームの各種設定】==================================================" 
#jokerのoptionを聞く
option=inputcheck_number(text="【トランプにjokerを含めますか? [含めない:0] 】：",0,100)
#トランプを作成　trump配列に格納
trump=Card.new(option)
#参加人数を聞く
playercount=inputcheck_number(text="【ゲームに参加する人数は何人ですか? 】：",1,3)
#参加者のメンバーの名前を入力
playernames=[]
playercount.times.each do |n|
  print "【プレイヤーの名前を入力してください PLAYER#{n+1} 】："
  name= gets.chomp
  playernames.push(name)
end
#参加者のインスタンスを作成
players=Blackjackplayer.create_users(playernames)


#======【参加者にカードを配り、追加するのか確認】==============================================
#敗者をまとめる配列
loseplayer=[]

puts  "======【プレイヤーにカードを配り、追加するのか確認】====================================" 
#各プレイヤーでLoopを回す
players.each do |user|
  #プレイヤーの名前を表示
  puts  "【プレイヤー:#{user.name}】" 
  #カードを二枚引く
  user.draw(trump.cards,2)
  #カードの合計と手札を確認
  print "#{user.name}の手札の合計は#{user.sum}  "
  user.show
  
  #カードを追加するのか確認：check(カードを追加する枚数)
  #とりあえず、追加の方向で
  check=1
  #追加の意思がある場合は以下のloopを繰り返す、check=0になれば抜け出す
  while check==1
    #意思確認
    check=inputcheck_number(text="【#{user.name}はカードを追加しますか 追加/1 決定/0】:",0,1)
    #カードを引く
    user.draw(trump.cards,check)
    #カードの合計と手札を確認
    print "#{user.name}の手札の合計は#{user.sum}"
    user.show
    
    #もし合計が21を超えた場合　
    if user.sum>21
      #負けの宣言
      puts "#{user.name}の負けです"
      #loopを抜け出す
      check=0
      #敗者配列に追加
      loseplayer.push(user)
    end  
  end
  puts "----------------------------------------------------------------------------------------"
end 

#======【ディーラー】===================================================
puts  "======【ディーラーにカードを配り、17以上になるまでカードを追加】============================"
#ディーラー作成
dealer=Dealer.new
#ディーラーにもカードを二枚配る
dealer.draw(trump.cards,2)
#ディーラーのカードを表示
dealer.dealershow
#17点以上になるまで
while dealer.sum<17
  dealer.draw(trump.cards,1)
end

if dealer.sum>21
  #負けの宣言
  puts "#{dealer.name}の負けです"
  print "#{dealer.name}の手札の合計は#{dealer.sum}"
  dealer.show
  #敗者配列に追加
  loseplayer.push(dealer)
end  

puts "----------------------------------------------------------------------------------------"

#======【OPEN_CARS】==========================================
puts  "======【結果】============================"
#playerにディーラーを追加
players.push(dealer)
#負けた人を排除
players=players.difference(loseplayer)
#結果を入れるハッシュを初期化
result={}

#負けた人を削除しているので、全員が21を超えた場合を考慮
if players.length>0
  #各プレイヤーの名前とスコアをハッシュに代入
   players.each do |player|
   result[player.name]=player.sum
  end
  winner=[]
  #結果発表　作成したハッシュを並び替えを行い最後の人の値を取得
  winner_value= result.values.sort.last
  #winner_valueを持つ人を選択(2人以上のことも考慮して配列で受け取る)
  winner=players.select{ |player| player.sum==winner_value}
  winner.each{ |win| puts "勝負は#{win.name}です"}
else
  "勝負はつきませんでした"
end 

#log
puts  "======【log】============================"
players.each do |player|
  print "#{player.name}の手札の合計は#{player.sum}"
  player.show
end









