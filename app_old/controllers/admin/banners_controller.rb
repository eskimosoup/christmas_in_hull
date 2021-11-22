class Admin::BannersController < Admin::AdminController

  handles_images_for Banner

  before_filter :gather_variables, :only => [:new, :edit]

  def index
    @search = Banner.unrecycled.position.search(params[:search])
    @banners = @search.paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      flash[:notice] = "Successfully created banner."
      redirect_to admin_banners_path
    else
      render :action => 'new'
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update_attributes(params[:banner])
      flash[:notice] = "Successfully updated banner."
      redirect_to admin_banners_path
    else
      render :action => 'edit'
    end
  end

  def order
    params[:draggable].each_with_index do |id, index|
      Banner.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    flash[:notice] = "Successfully destroyed banner."
    redirect_to admin_banners_path
  end

  def gather_variables
    @events   = Event.active
    @articles = Article.active
    @venues   = Venue.active
  end

end