class GalleriesController < ApplicationController
  
  def index
    @galleries = Gallery.all(:conditions => ["display = ?", true], :order => :position)
  end

  def show
    @galleries = Gallery.all(:conditions => ["display = ?", true], :order => :position)
    @gallery = Gallery.find(params[:id])
 end
end
