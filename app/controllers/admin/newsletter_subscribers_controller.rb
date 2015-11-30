class Admin::NewsletterSubscribersController < Admin::AdminController
  
  def index
    @newsletter_subscribers = NewsletterSubscriber.ordered.paginate(:page => params[:page], :per_page => 50)
  end
  
  def new
    @newsletter_subscriber = NewsletterSubscriber.new
  end
  
  def create
    @newsletter_subscriber = NewsletterSubscriber.new(params[:newsletter_subscriber])
    if @newsletter_subscriber.save
      flash[:notice] = "Successfully created subscriber."
      redirect_to admin_newsletter_subscribers_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @newsletter_subscriber = NewsletterSubscriber.find(params[:id])
  end
  
  def update
    @newsletter_subscriber = NewsletterSubscriber.find(params[:id])
    if @newsletter_subscriber.update_attributes(params[:newsletter_subscriber])
      flash[:notice] = "Successfully updated subscriber."
      redirect_to admin_newsletter_subscribers_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @newsletter_subscriber = NewsletterSubscriber.find(params[:id])
    @newsletter_subscriber.destroy
    flash[:notice] = "Successfully destroyed subscriber."
    redirect_to admin_newsletter_subscribers_path
  end
  
end