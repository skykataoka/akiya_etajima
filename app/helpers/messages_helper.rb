module MessagesHelper
  def choose_new_or_edit
    if action_name == 'index'
      messages_path
    else action_name == 'edit'
      message_path
    end
  end

  def text_url_to_link text
    URI.extract(text, ['http']).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
    
      text.gsub!(url, sub_text)
    end
    return text
  end
end
