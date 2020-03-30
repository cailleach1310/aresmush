module AresMUSH
  module Custom
    class MarqueTemplate < ErbTemplateRenderer
       
      attr_accessor :adept_chars
      
      def initialize(adept_chars)
        self.adept_chars = adept_chars
        super File.dirname(__FILE__) + "/marque.erb"
      end
      
      def fields
        Global.read_config("marque", "marque_fields")
      end
      
      def marque_header
        Global.read_config("marque", "marque_header")
      end
      
      def show_field(char, field_config)
        field = field_config["field"]
        value = field_config["value"]
        width = field_config["width"]
        
        field_eval = Profile.general_field(char, field, value)
        left(field_eval, width)
      end
      
      def show_title(field_config)
        title = field_config["title"]
        width = field_config["width"]
        
        left(title, width)
      end
    end 
  end
end