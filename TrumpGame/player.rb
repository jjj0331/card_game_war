#プレイヤー作成
require "./publicfunction.rb" 
include Publicfunction

class Player
#============================================================================
  #インスタンス変数：[name],[myhand(手持ちカード)]
  attr_reader :name,:myhand
 
#============================================================================  
  #【初期化】：nameとmyhand
  def initialize(name)
    @name=name||"player" 
    @myhand=[]
  end
#============================================================================  
  #【ユーザ作成】
  def self.create_users(names)
    names.map do |name|
      self.new(name)
    end  
  end
#============================================================================
  #【カードを引く】⇒引数:trump(配列のカード),number(カードを引く枚数)
  def draw(trump,numbers)
    
    #まず、引くカードがあるのか確認
    if trump.length>=numbers && numbers>0
      #引く枚数だけloop処理
      for num in 1..numbers do
        #乱数を発生させる(カードを引く元の枚数を超えない)
        random=rand(Range.new(0, trump.length-1))
        #playercardsにカードを格納
        @myhand.push(trump[random])  
        #カード元から引いたカードを削除
        trump.delete_at(random)     
      end  
    end 
  end

#============================================================================  
    #【カードを出す】⇒number(カードを出す枚数)
  def output(numbers)  
    #出すカードを初期化
    output=[]
    #手札が1枚あることを確認
    if @myhand.length>=numbers
      #引く枚数より手持ちカードが多い場合
      for num in 1..numbers do
          #乱数を発生させる(手札の枚数を超えない) 
          random=rand(Range.new(0, @myhand.length-1))
          #一度、outputに格納
          output.push(@myhand[random])
          #手札からカードを削除する
          @myhand.delete_at(random)
      end    
    else
      output.push("カードがありません")          
    end  
  output   
  end

#============================================================================  
   #【カードを加える】⇒引数:cards
   def add(cards)
    @myhand.concat(cards)
  end

#============================================================================  
  #【カード手持ちカードの合計】ルールなし
  def point
    sum=0
    @myhand.each do |card|
      sum+=card[1..-1].to_i
    end
  sum
  end
  
#============================================================================
  #【カードを見せる】
  def show
    if @myhand.length>0
        print "【"
      @myhand.each_with_index do |card,index|
        print "#{index+1}枚目は:#{card} "
      end
    end  
        puts "】"
  end 
  
end