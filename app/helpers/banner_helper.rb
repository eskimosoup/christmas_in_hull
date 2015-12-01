module BannerHelper

  def banner_link(banner)
    if banner.page_node
      return link_to_page("More", "#{banner.page_node.name}")
    elsif banner.event
      return link_to("More", banner.event)
    elsif banner.article
      return link_to("More", banner.article)
    elsif banner.venue
      return link_to("More", banner.venue)
    elsif !banner.external_link.blank?
      return link_to("More", banner.external_link, {:popup => true})
    else
      return ""
    end
  end

  def banner_url(banner)
    if banner.page_node
      return banner.page_node
    elsif banner.event
      return banner.event
    elsif banner.article
      return banner.article
    elsif banner.venue
      return banner.venue
    elsif !banner.external_link.blank?
      return banner.external_link
    else
      return ""
    end
  end

end
