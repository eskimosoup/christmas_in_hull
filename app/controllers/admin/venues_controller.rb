class Admin::VenuesController < Admin::AdminController

  handles_images_for Venue

  def index
    @search = Venue.unrecycled.position.search(params[:search])
    @venues = @search#.paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(params[:venue])
    if @venue.save
      flash[:notice] = "Successfully created venue."
      redirect_to admin_venues_path
    else
      render :action => 'new'
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(params[:venue])
      flash[:notice] = "Successfully updated venue."
      redirect_to admin_venues_path
    else
      render :action => 'edit'
    end
  end

  def order
    params[:draggable].each_with_index do |id, index|
      Venue.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    flash[:notice] = "Successfully destroyed venue."
    redirect_to admin_venues_path
  end
end
