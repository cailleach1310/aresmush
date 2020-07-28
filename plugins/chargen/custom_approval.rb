module AresMUSH
  module Chargen
    def self.custom_approval(char)
            
      # If you don't want to have any custom approval steps, just leave this blank.
      
      # Otherwise, do what you need to do.  Here's an example of how to add
      # someone to a role based on their faction:
      #
       faction = char.group("faction")
       role = Role.find_one_by_name(faction)
      
       if (role)
         char.roles.add role
       end
      
       # auto-tagging the char page 
       tag_list = []
       tag_list.push(faction)
       if ((faction != "Commoner") && (faction != "Clergy"))
          tag_list.push(char.group("house"))
       end
       tags = (tag_list || []).map { |t| t.downcase }.select { |t| !t.blank? }
       char.update(profile_tags: tags)
       # See https://www.aresmush.com/tutorials/config/chargen.html for details.
    end
  end
end
