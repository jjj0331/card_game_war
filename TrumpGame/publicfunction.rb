#トランプカード共通の処理をまとめたモジュール
module Publicfunction

#============================================================================  
  #基本的にはどこからでも呼び出し可能
  public

#============================================================================  
  #【テストメソッド】
  def hello
    puts "Hello World"
  end
#============================================================================
  #【トランプカードの番号を確認】
  def return_number(trump)
    trump[1..-1]
  end
#============================================================================
  #【トランプカードのマークを確認】
  def return_mark(trump)
    trump[0..1]
  end

#============================================================================
  #【入力チェック:数字】⇒引数:min(最小値),max(最大値)
  def inputcheck_number(text="数字を入力してください",min=0,max=100)
    #返り値の初期値を設定
    return_number=0
    #入力説明
    print "#{text}"
    loop do
      #入力
      number= gets.chomp
      #条件判定：数字かつ範囲内か
      if /\d+/.match?(number) && number.to_i<=max && min<=number.to_i
        return_number=number
        #条件を満たす場合のみloopを抜ける
        break
      elsif
        #再度入力説明
       print "※範囲以内(#{min}~#{max})の数字を入力してください:#{text}"  
      end
    end
    #メソッドの返り値
    return_number.to_i
  end   
end
