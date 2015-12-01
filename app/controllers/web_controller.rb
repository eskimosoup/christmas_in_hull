class WebController < ApplicationController

  def index
    @page_node = PageNode.find_by_name("Home")
    @banners = Banner.for_index
    @events = Event.for_index
    @articles = Article.for_index
    @opening_times = OpeningTime.all(:include => :shopping_centre, :joins => :shopping_centre,
                                     :conditions => ["date = ? AND shopping_centres.display = ? AND opening_times.display = ?", Date.today, true, true],
                                     :order => "date ASC")
  end

  def site_down

  end

  def site_search
    if params[:search]
      results = Search.site(params[:search])
      @results = results.paginate(:page => params[:page], :per_page => 10)
    else
      @results = []
    end
  end

  def site_map
    @roots = PageNode.active.roots
    @roots += PageNode.active.navigation.select{|x| x.parent && !x.parent.display_in_navigation? }
    @roots = @roots.sort_by{|x| x.name}
  end

  def contact_us
    @page_node = PageNode.find_by_name("Contact Us")
  end

  def deliver_contact_us
    if params[:email].blank? && params[:tel].blank?
      flash[:error] = "Please enter either an email or telephone number so that we can get back to you."
      redirect_to :controller => "web", :action => "contact_us", :name => params[:name], :email => params[:email], :tel => params[:tel], :enquiry => params[:enquiry]
    else
      Mailer.deliver_contact_us(params[:name], params[:email], params[:tel], params[:enquiry])
      flash[:notice] = "Your enquiry has been sent."
      redirect_to :controller => "web", :action => "thank_you"
    end
  end

  def create_subscriber
    if params[:email].blank? || !params[:email].match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
      flash[:error] = "Please enter a valid email address."
    else
      NewsletterSubscriber.create({:email => params[:email]})
      flash[:notice] = "Thank you for subscribing."
    end
    redirect_to params[:referrer]
  end

end
