# encoding: utf-8

require 'fortconfig_defaults.rb'
require 'fortconfig.rb'

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

end
