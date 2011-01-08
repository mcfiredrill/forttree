module ApplicationHelper
  def faces 
    [ "´ ▽ `",
    "＾ω＾",
    "＾∀＾",
    "(´ε`)",
    "Σ(ﾟДﾟ)",
    "( ﾟ ヮﾟ)",
    "ヽ(´ー｀)ノ",
    "ノ°ο°)ノ",
    "o(≧∀≦)o",
    "(づ｡◕‿‿‿‿◕｡)づ",
    "♡✰☁☼✿⚈‿‿⚈✿☼☁✰♡"]
  end
  
  def themes
    Dir['public/stylesheets/themes/*.css'] 
  end

  def theme_basenames
    names = Array.new
    themes.each do |t|
      names << t[/(\w*)\.css/, 1]
    end
    return names
  end

end
