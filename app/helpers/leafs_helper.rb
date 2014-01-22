module LeafsHelper
  def link_to_file(leaf)
    content_tag :span, class: "filesize" do
      if leaf.photo_file_name != nil
        "File: #{link_to leaf.photo_file_name, leaf.photo.url, :target => "_blank"} -(#{leaf.photo_file_size.to_s} B)".html_safe
      else
        "No file"
      end
    end
  end

  def display_photo(leaf)
   if leaf.photo.url != "/photos/original/missing.png"
     if leaf.photo.url =~ /\.svg\?\d+$/
       link_to (image_tag leaf.photo.url(:original), :class=> 'thumb', :style=> 'max-width: 300px; max-height: 300px;'), leaf.photo.url, :target => "_blank"
     else
       link_to (image_tag leaf.photo.url(:thumb), :class=> 'thumb'), leaf.photo.url, :target => "_blank"
     end
   end
  end

  def postername(leaf)
    if leaf.name == ""
      "Anonymous"
    else
      leaf.name
    end
  end

  def reflink(leaf)
    if reply_mode?
      link_to "No. #{leaf.id}", "#", class: "insert-emoticon", data: { text: ">>#{leaf.id}" }
    else
      link_to "No. #{leaf.id}", "/leafs/new/#{leaf.branch_id}##{leaf.id}"
    end
  end

  def display_content(leaf)
    if !leaf.content.blank?
      "<p>#{html_pipeline(leaf.content)}</p>".html_safe
    end
  end

  def reply_link(leaf)
    if !reply_mode? && (leaf == leaf.branch.leafs.first)
      content_tag :div, class: 'replylink' do
        link_to 'Reply', edit_board_post_path(leaf.branch.board.id, leaf.branch.id)
      end
    end
  end
end
