class Mailer < ActionMailer::Base

	add_template_helper ApplicationHelper

	def contact_us(name, email, tel, enquiry)
    @subject        = "Contact Us Form Completed - #{SiteSetting.like("Site Name").first.value}"
    @from           = email
    @recipients     = SiteSetting.like("Email").first.value
    @body[:enquiry] = enquiry
    @body[:name]    = name
    @body[:email]   = email
    @body[:tel]     = tel
    content_type "text/html"
  end

end
