module AresMUSH
  module Profile
    class CustomCharFields

      # Return a hash of custom fields formatted for display
      # Note: Viewer may be nil if someone's looking at the character page without being logged in
      # Example: return { goals: Website.format_markdown_for_html(char.goals) }
      def self.get_fields_for_viewing(char, viewer)
        return { goals: Website.format_markdown_for_html(char.goals),
          marque: char.marque.to_i,
          connections: Website.format_markdown_for_html(char.connections) }
      end
    
      # Return a hash of custom fields formatted for editing in the profile editor
      # Example: return { goals: Website.format_input_for_html(char.goals) }
      def self.get_fields_for_editing(char, viewer)
        return { goals: Website.format_input_for_html(char.goals) }
      end

      # Return a hash of custom fields formatted for editing in chargen
      # Example: return { goals: Website.format_input_for_html(char.goals) }
      def self.get_fields_for_chargen(char)
         return { goals: Website.format_input_for_html(char.goals),
           marque: Website.format_input_for_html(char.marque),
           connections: Website.format_input_for_html(char.connections),
           cg_adept: char.ranks_rank == "Adept",
           cg_connections: char.fs3_advantages.find(name: "Connections").first != nil }
     end
      
      # Custom fields will be in char_data[:custom]
      # Example: char.update(goals: char_data[:custom][:goals])
      def self.save_fields_from_profile_edit(char, char_data)
         char.update(goals: Website.format_input_for_mush(char_data[:custom][:goals]))       
      end
      
      # Save fields and return an array of any error messages.
      # Note Custom fields will be in chargen_data[:custom]
      # Example: char.update(goals: chargen_data[:custom][:goals])
      def self.save_fields_from_chargen(char, chargen_data)
        char.update(marque: chargen_data[:custom][:marque])
        web_goals = chargen_data[:custom][:goals]
        if web_goals 
          char.update(goals: web_goals)
        else
          char.update(goals: nil)
        end  
        web_con = chargen_data[:custom][:connections]
        if web_con
          char.update(connections: web_con)
        else
          char.update(connections: nil)
        end
        return []
      end
      
    end
  end
end
