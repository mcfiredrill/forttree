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
    Dir['app/assets/stylesheets/themes/*.scss']
  end

  def theme_basenames
    themes.map {|m| File.basename m, ".scss" }
  end

  def reply_mode?
    #hack?
    if(request.url =~ /leafs/)
      return true
    else
      return false
    end
  end

  def html_pipeline(text)
    context = {
      :asset_root => "/images/"
    }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::YoutubeFilter,
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::EmojiFilter,
    ], context
    result = pipeline.call(text)
    result[:output].to_s
  end

  def current_board(board)
    @board && (@board.name == board.name)
  end

  def board_listing
    Board.all
  end
end
