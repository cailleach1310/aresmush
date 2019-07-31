module AresMUSH
  module Custom
    class AcknMarqueCmd
      include CommandHandler
      
      attr_accessor :name
   
      def handle
        ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
          if !enactor.has_role?("admin")
            client.emit_failure "Only staff are allowed to trigger this command."
            return nil
          elsif model.ranks_rank != "Adept"
            client.emit_failure "Only adept characters can have their marque acknowledged!"
            return nil
          else 
            model.update(marque: nil)
            model.update(ranks_rank: "Courtesan")
            client.emit_success "The marque has been acknowledged! #{model.name} now has new status of fully marqued courtesan."
            return true
          end
        end
      end  
    end
  end
end
