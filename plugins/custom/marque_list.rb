module AresMUSH
  module Custom
    class ListMarqueCmd
      include CommandHandler
      
      def handle
#        <%= header %>
        client.emit("%xcList of Adepts%xn:%r%r")
        Character.all.select { |c| c.ranks_rank == 'Adept' }.map 
          { client.emit("* #{c.name} -- Marque at #{c.marque}% -- last on: #{c.last_on}") }
#        <%= footer %>
      end
    end  
  end   
end   
