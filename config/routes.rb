ActionController::Routing::Routes.draw do |map|

  map.resources :articles
  map.resources :events
  map.resources :galleries
  map.resources :venues
  map.resources :offers
  map.resources :opening_times, :only => [:index]
  map.resources :page_nodes, :as => "page"
  map.resources :page_contents

  map.namespace :admin do |admin|
    admin.resources :articles,    :except => [:show]
    admin.resources :events,     :except => [:show]
    admin.resources :venues,     :except => [:show], :collection => {:order => :post}
    admin.resources :banners,    :except => [:show], :collection => {:order => :post}
    admin.resources :offers,     :except => [:show]
    admin.resources :projects,    :except => [:show]
    admin.resources :page_nodes, :except => [:show], :collection => {:index_list => :get, :index_list_advanced => :get, :index_reorder => :get, :order => :post}, :member => {:branch => :get, :activate => :get, :toggle_display => :get}
    admin.resources :newsletter_subscribers, :except => [:show]
    admin.resources :shopping_centres, :except => [:show]
    admin.resources :opening_times, :except => [:show]
    admin.resources :galleries, :except => [:show], :collection => { :order => :post } 
    admin.resources :gallery_images, :except => [:show], :collection => { :order => :post }
    admin.connect 'recycle_bin/index',        :controller => 'recycle_bin',    :action => 'index'
    admin.connect 'administrators/edit_self', :controller => 'administrators', :action => 'edit_self'
  end

  map.connect 'web/accessibility',      :controller => 'web', :action => 'accessibility'
  map.connect 'web/contact_us',         :controller => 'web', :action => 'contact_us'
  map.connect 'web/deliver_contact_us', :controller => 'web', :action => 'deliver_contact_us'
  map.connect 'web/index',              :controller => 'web', :action => 'index'
  map.connect 'web/site_down',          :controller => 'web', :action => 'site_down'
  map.connect 'web/site_map',           :controller => 'web', :action => 'site_map'
  map.connect 'web/site_search',        :controller => 'web', :action => 'site_search'
  map.connect 'web/thank_you',          :controller => 'web', :action => 'thank_you'
  map.connect 'create_subscriber',      :controller => 'web', :action => 'create_subscriber'

  map.root :controller => "web", :action => "index"

  # copy and paste (and uncomment) this link to add static pages
  # map.connect 'name_of_page', :controller => 'web', :action => 'name_of_page'

end
