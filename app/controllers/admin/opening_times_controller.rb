class Admin::OpeningTimesController < Admin::AdminController

  def index
    @opening_times = OpeningTime.order("date asc").paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @opening_time = OpeningTime.new
  end

  def create
    @opening_time = OpeningTime.new(params[:opening_time])
    if @opening_time.save
      flash[:notice] = "Successfully created opening time."
      redirect_to admin_opening_times_path
    else
      render :action => :new
    end
  end

  def edit
    @opening_time = OpeningTime.find(params[:id])
  end

  def update
    @opening_time = OpeningTime.find(params[:id])
    if @opening_time.update_attributes(params[:opening_time])
      flash[:notice] = "Successfully updated opening time."
      redirect_to admin_opening_times_path
    else
      render :action => :edit
    end
  end

  def destroy
    @opening_time = OpeningTime.find(params[:id])
    @opening_time.destroy
    flash[:notice] = "Successfully destroyed opening time."
    redirect_to admin_opening_times_path
  end

end