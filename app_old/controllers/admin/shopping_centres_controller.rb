class Admin::ShoppingCentresController < Admin::AdminController

  def index
    @shopping_centres = ShoppingCentre.order("created_at desc").paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @shopping_centre = ShoppingCentre.new
  end

  def create
    @shopping_centre = ShoppingCentre.new(params[:shopping_centre])
    if @shopping_centre.save
      flash[:notice] = "Successfully created shopping centre."
      redirect_to admin_shopping_centres_path
    else
      render :action => :new
    end
  end

  def edit
    @shopping_centre = ShoppingCentre.find(params[:id])
  end

  def update
    @shopping_centre = ShoppingCentre.find(params[:id])
    if @shopping_centre.update_attributes(params[:shopping_centre])
      flash[:notice] = "Successfully updated shopping centre."
      redirect_to admin_shopping_centres_path
    else
      render :action => :edit
    end
  end

  def destroy
    @shopping_centre = ShoppingCentre.find(params[:id])
    @shopping_centre.destroy
    flash[:notice] = "Successfully destroyed shopping centre."
    redirect_to admin_shopping_centres_path
  end

end
