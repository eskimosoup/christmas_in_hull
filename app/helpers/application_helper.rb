# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def determine_page_node
		if @page_node
			@current_page_node = @page_node
		elsif PageNode.controller_action(params[:controller], params[:action]).first
			@current_page_node = PageNode.controller_action(params[:controller], params[:action]).sort_by{|x| x.position}.first
		elsif PageNode.controller_action(params[:controller], "").first
			@current_page_node = PageNode.controller_action(params[:controller], "").sort_by{|x| x.position}.first
		else
			nil
		end
	end

	# pass :behaviour => "hide" or behaviour => "highlight" to change page hidden / not found behaviour
  def link_to_page(link_text, page_name, options={})
    page_node = PageNode.find_by_name(page_name)
    if page_node
      if !page_node.display? && options[:behaviour] == "hide"
        return ""
      elsif !page_node.display? && options[:behaviour] == "highlight"
        return link_to(link_text, page_node.path, options.merge(:style => "border: 2px #FF0000 solid;"))
      else
        return link_to(link_text, page_node.path, options)
      end
    else
      if options[:behaviour] == "hide"
        return ""
      elsif options[:behaviour] == "highlight"
        return link_to(link_text, "/404.html", options.merge(:style => "border: 2px #FF0000 solid;"))
      else
        return link_to(link_text, "/404.html", options)
      end
    end
  end

  def share_links(link, options={})
  # facebook, twitter, email, digg, delicious, stumbleupon, reddit
    ret = "<div class='share_links'>"
    options[:title] ||= link
    options[:target] ||= "_blank"
    if options[:facebook]
      ret += link_to image_tag("facebook.png"), "http://www.facebook.com/sharer.php?u=#{link}&t=#{options[:title]}", :target => options[:target]
    end
    if options[:twitter]
      ret += link_to image_tag("twitter.png"), "http://twitter.com/home?status=#{link}", :target => options[:target]
    end
    if options[:email]
      ret += mail_to "", image_tag("email.png"), :body => link, :subject => options[:title]
    end
    if options[:digg]
      ret += link_to image_tag("digg.png"), "http://digg.com/submit?url=#{link}", :target => options[:target]
    end
    if options[:delicious]
      ret += link_to image_tag("delicious.png"), "http://del.icio.us/post?url=#{link}", :target => options[:target]
    end
    if options[:stumbleupon]
      ret += link_to image_tag("stumbleupon.png"), "http://www.stumbleupon.com/submit?url=#{link}", options[:target]
    end
    if options[:reddit]
      ret += link_to image_tag("reddit.png"), "http://reddit.com/submit?url=#{link}", options[:target]
    end
    ret += "</div>"
    ret.html_safe
  end

	def remind_links(link, options={})
	  # google, yahoo, msn
	  options[:title] ||= link
	  options[:target] ||= "_blank"
	  ret = "<div class = 'remind_links'>"
	  if options[:google]
	    ret += link_to image_tag("google_remind.png"), "http://www.google.com/calendar/event?action=TEMPLATE&text=#{options[:title]}&sprop=website:#{link}&sprop=name:#{options[:title]}&details=#{link}", :target => options[:target]
    end
	  if options[:yahoo]
	    ret += link_to image_tag("yahoo_remind.png"), "http://calendar.yahoo.com/?v=60&TITLE=#{options[:title]}&ST=#{Time.now.strftime("%Y%m%d")}&URL=#{link}", :target => options[:target]
    end
	  if options[:msn]
	    ret += link_to image_tag("msn_remind.png"), "http://calendar.msn.com/calendar", :target => options[:target]
    end
	  ret += "</div>"
	  ret
	end

	# auto link
	def al(string)
	  string.gsub! URI::regexp(%w(http https)) do |match|
	    auto_link match
	  end
	  string
	end

  def brev(text, max_length)
		if text.length > max_length
			"#{text[0...(max_length)] + "..."}"
		else
			text
		end
  end

  def home?
		(params[:controller] == "web" && params[:action] == "index") ? true : false
  end

end
