module AresMUSH
  module Chargen
    def self.custom_app_review(char)
            
      # If you don't want to have any custom app review steps, return nil
      # return nil
            
      # Otherwise, return a message to display.  Here's an example of how to 
      # give an alert if the character has chosen an invalid position for their 
      # faction.
      #
      rank = char.ranks_rank
      scion = (char.fs3_advantages.find(name: "Scion Power").first)
      
      msg = ""
      
      if (rank == "Adept" && !(char.marque))
         msg = "%xrAdept concepts need to set the starting percentage of their marque! %xn"
      end
      
      if (scion && !(custom.has_scion_set?(char)))
         msg = msg + "%xrScions need to set their scion power! %xn"
      end
      
      if (msg == "")
         msg = t('chargen.ok')
      end

      return Chargen.format_review_status "Checking custom settings.", msg
      #
      # You can also use other built-in chargen status messages, like t('chargen.not_set').  
      # See https://www.aresmush.com/tutorials/config/chargen.html for details.
    end
  end
end
