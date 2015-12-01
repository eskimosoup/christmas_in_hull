class Admin::OffersController < Admin::AdminController

  handles_images_for Offer

  def index
    if params[:keywords].blank?
      @offers = Offer.order("created_at desc").paginate(:page => params[:page], :per_page => 50)
    else
      @offers = Offer.all(:conditions => ["company_name LIKE :search OR summary LIKE :search OR description LIKE :search", {:search => "%#{params[:keywords]}%"}], :order => "created_at DESC").paginate(:page => params[:page], :per_page => 50)
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params[:offer])
    if @offer.save
      flash[:notice] = "Successfully created Offer."
      if Offer.image_changes?(params[:offer])
        redirect_to :action => "index_images", :id => @offer.id
      else
        redirect_to admin_offers_path
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update_attributes(params[:offer])
      flash[:notice] = "Successfully updated Offer."
      if Offer.image_changes?(params[:offer])
        redirect_to :action => "index_images", :id => @offer.id
      else
        redirect_to admin_offers_path
      end
    else
      render :action => 'edit'
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    flash[:notice] = "Successfully destroyed Offer."
    redirect_to admin_offers_path
  end

end
