module AresMUSH
  module Chargen

    def standard_channel(faction)
      if (faction == "Noble")
        return "Nobility"
      else
        return faction
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

      # auto-joining to the faction channel
      channel = []
      channel.push(standard_channel(faction))
      Channels.add_to_channels(client, char, channel)
      if (client)
          client.emit_success t('channels.channel_command_hint')
      end
    end
  end
end
