class Admin::GalleryImagesController < Admin::AdminController

  handles_images_for GalleryImage

  before_filter :set_gallery_image, :only => [:edit, :update, :destroy]

  def index
    @gallery_images = if params[:gallery_id]
        GalleryImage.all(:conditions => ["gallery_id = ?", params[:gallery_id]]).paginate(:page => params[:page], :per_page => 50)			      
      else
        GalleryImage.all.paginate(:page => params[:page], :per_page => 50)
      end
  end


  def new
    @gallery_image = GalleryImage.new
  end

  def create
    @gallery_image = GalleryImage.new(params[:gallery_image])
    if @gallery_image.save
      flash[:notice] = "Successfully created gallery image."
      redirect_to admin_gallery_images_path 
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @gallery_image.update_attributes(params[:gallery_image])
      flash[:notice] = "Successfully updated gallery image."
      redirect_to admin_gallery_images_path
    else
      render :action => :edit
    end
  end

  def destroy
    @gallery_image.destroy
    flash[:notice] = "Successfully destroyed gallery image."
    redirect_to admin_gallery_images_path
  end
  
  private

  def set_gallery_image
    @gallery_image = GalleryImage.find(params[:id])
  end

end
