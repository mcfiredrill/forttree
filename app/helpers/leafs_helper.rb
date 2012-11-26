module LeafsHelper
  def link_to_file(leaf)
    if leaf.photo_file_name != nil
      "File: #{link_to leaf.photo_file_name, leaf.photo.url, :target => "_blank"} -(#{leaf.photo_file_size.to_s} B)"
    else
      "No file"
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
      link_to_function "No. #{leaf.id}", "insert_emoticon('>>#{leaf.id}')"
    else
      link_to "No. #{leaf.id}", "/leafs/new/#{leaf.branch_id}##{leaf.id}"
    end
  end

  def display_content(leaf)
    if !leaf.content.empty?
      "<p>#{markdown(leaf.content)}</p>".html_safe
    end
  end
end
