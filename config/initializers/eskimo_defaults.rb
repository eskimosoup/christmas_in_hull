class Object

  def deep_blank?
    if (self.class == Hash || self.class == HashWithIndifferentAccess) && !blank?
      self.each_value.collect{|v| v.blank? }.reduce(:&)
    else
      blank?
    end
  end

end

module ActionView
  module Helpers
  
    module AssetTagHelper
      def image_tag_with_defaults(source, options={})
        options[:vspace] ||= 0
        options[:hspace] ||= 0
        options[:border] ||= 0
        image_tag_without_defaults(source, options)
      end
      alias_method_chain :image_tag, :defaults
    end
    
    class FormBuilder
      def error_messages_with_defaults(options={})
        options[:id] ||= 'flash_error'
        options[:header_message] ||= nil
        error_messages_without_defaults(options)
      end
      alias_method_chain :error_messages, :defaults
    end
    
    module FormTagHelper
      def check_box_tag_with_defaults(name, value="1", checked=false, options={})
        options[:class] ||= 'checkbox'
        check_box_tag_without_defaults(name, value, checked, options)
      end
      alias_method_chain :check_box_tag, :defaults
    end   
    
    module FormHelper
      def check_box_with_defaults(object_name, method, options={}, checked_value="1", unchecked_value="0")
        options[:class] ||= 'checkbox'
        check_box_without_defaults(object_name, method, options, checked_value="1", unchecked_value="0")
      end
      alias_method_chain :check_box, :defaults
    end 
    
  end
end


