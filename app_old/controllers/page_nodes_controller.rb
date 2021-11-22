class PageNodesController < ApplicationController

  include PageContentsHelper

  def show

    @page_node = PageNode.find(params[:id])

    unless @page_node.display?
      redirect_to "/404.html"
      return
    end

    send(@page_node.layout)
    if @page_node.layout == "link" && !@page_node.active_content.link.blank?
      redirect_to @page_node.active_content.link
      return
    elsif @page_node.controller? && @page_node.action?
      redirect_to url_for(:controller => @page_node.controller, :action => @page_node.action)
      return
    elsif @page_node.controller?
      redirect_to url_for(@page_node.controller)
      return
    end

  end

end
