module DiscussionsHelper
  def render_with_hashtags(introduction)
    introduction.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/discussion/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end



#   def render_with_hashtags(tag_name, tag_id)
#     tag_name.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/discussion/hashtag/#{word.delete("#")}?tag_id=#{tag_id}"}.html_safe
#   end