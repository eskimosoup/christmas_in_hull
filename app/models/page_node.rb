class PageNode < ActiveRecord::Base

  after_save {|node| node.page_contents.each{|x| x.save} }
	after_save { ErrorPages.regenerate }

	named_scope :active, :conditions => ["recycled = ? AND display = ?", false, true]
  named_scope :recycled, :conditions => ["recycled = ?", true]
  named_scope :unrecycled, :conditions => ["recycled = ?", false]
  named_scope :position, :order => "position"
  named_scope :controller_action, lambda { |c, a| { :conditions => ["controller = ? AND action = ?", c, a] } }
  named_scope :controller, lambda { |c| { :conditions => ["controller = ?", c] } }
  named_scope :models, :conditions => "model IS NOT NULL AND model != ''"
  named_scope :navigation, :conditions => {:display_in_navigation => true, :display => true, :recycled => false}, :order => "position"
  named_scope :can_have_children, :conditions => {:can_have_children => true}
  named_scope :can_be_deleted_or_edited, :conditions => ["can_be_deleted = ? OR can_be_edited = ?", true, true]
  named_scope :access_key, :conditions => "access_key IS NOT NULL AND access_key != ''"

  has_friendly_id :url

  acts_as_eskimagical :recycle => true
  acts_as_tree

  has_many :page_contents, :dependent => :destroy
  accepts_nested_attributes_for :page_contents

  validates_presence_of :layout, :unless => Proc.new{|x| x.layout == "link"}
  validates_presence_of :name, :url
  validates_uniqueness_of :name, :url, :message => "must be unique"
  validates_format_of :name, :with => /^[\w\d\ ]+$/

  before_validation :set_url

  def set_url
  	self.url = name.downcase.gsub(' ','-')
  end

  def sections
  	page_nodes = []
  	page_node = self.parent
  	while page_node
  		page_nodes << page_node
  		page_node = page_node.parent
  	end
  	page_nodes.reverse
  end

  def sections_string
  	sections.collect{|s| s.name}.join(" / ")
  end

  def sections_name
  	(sections.collect{|s| s.name} << self.name).join(" / ")
  end

  def is_a_link?
    (layout == "link") ? true : false
  end

  def path
    if controller? && action?
      {:controller => "/" + controller, :action => action}
    elsif controller?
      {:controller => "/" + controller}
    else
      if is_a_link? && !active_content.link.blank?
        active_content.link
    	elsif !active_content.main_content? && children.length > 0
    		children.sort_by{|x| x.position}.first.path
    	else
    		self
    	end
    end
  end

  def admin_path
  	if controller? && !action?
  		{:controller => "admin/#{controller}"}
  	else
  		{:controller => "admin/page_nodes", :action => "edit", :id => self.id}
    end
  end

  def active_content
  	if page_contents.length > 1
  		page_contents.select{|x| x.active?}.first || page_contents.first
  	elsif page_contents.length == 1
  		page_contents.first
  	else
  		page_contents.build(:active => false)
  	end
  end

  def navigation_title
  	if active_content && active_content.navigation_title?
  		active_content.navigation_title
  	else
  		name
  	end
  end

  def title
  	if active_content && active_content.title
  		active_content.title
  	else
  		name
  	end
  end

  def style
  	return stylesheet if stylesheet?
  	page_node = parent
    while page_node != nil do
    	return page_node.stylesheet if page_node.stylesheet?
    	page_node = page_node.parent
    end
    return nil
  end

  def css_class
  	style.gsub("webstyle_","").gsub(".css","")
  end

  def active?
  	display? && display_in_navigation && !recycled
  end

  def self.layouts
	  list = %w( basic link none )
	  layouts = []
	  list.each do |layout|
	    layouts << [layout.titleize, layout]
	  end
	  layouts
	end

	def yield_name
    name.gsub(/\W/, '_').downcase
  end

end
