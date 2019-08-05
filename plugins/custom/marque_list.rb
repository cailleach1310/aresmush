module AresMUSH
  module Custom
    class ListMarqueCmd
      include CommandHandler
      
      def handle
#        Character.all.select { |model| model.ranks_rank == 'Adept' }.map 
#          client.emit("* #{c.name} -- Marque at #{c.marque}'%' -- last on: #{c.last_on}") }ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
#          template = BorderedDisplayTemplate.new model.name model.marque model.last_on, "List of Adepts"
#          client.emit template.render
#        end
#      end
#        <%= header %>
#        client.emit("%xcList of Adepts%xn:%r%r")
#        Character.all.select { |c| c.ranks_rank == 'Adept' }.map { |c| client.emit("* #{c.name} -- Marque at #{c.marque}% -- last on: #{c.last_on}") }
#          client.emit("* #{c.name} -- Marque at #{c.marque}'%' -- last on: #{c.last_on}") } end 
#        <%= footer %>
#      end
    end  
  end
end
