module AresMUSH
  module Chargen

    def self.standard_channel(char)
      f = char.group("faction")
      if (f == "Noble")
        return "Nobility"
      else
        return f
      end
    end
    
    def self.custom_approval(char)
     
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
      # ^^ tags for houses may have to be tackled in a function (salons, etc)
       tags = (tag_list || []).map { |t| t.downcase }.select { |t| !t.blank? }
       char.update(profile_tags: tags)

      # auto-joining to the faction channel happens in the channels plugin
      c = []
      c.push(self.standard_channel(char))
      Channels.add_to_channels(nil, char, c)
    end
    
  end
end
