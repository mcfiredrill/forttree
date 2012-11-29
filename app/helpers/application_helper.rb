# encoding: utf-8
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
    Dir['app/assets/stylesheets/themes/*.css.scss']
  end

  def theme_basenames
    names = Array.new
    themes.each do |t|
      names << t[/(\w*)\.css\.scss/, 1]
    end
    return names
  end

  def reply_mode?
    #hack?
    if(request.url =~ /leafs/)
      return true
    else
      return false
    end
  end

  def markdown(text)
    options = {hard_wrap:true, filter_html:true, autolink:true, no_intraemphasis:true, fenced_code:true, gh_blockcode:true}
    m = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    m.render(text)
  end
end
