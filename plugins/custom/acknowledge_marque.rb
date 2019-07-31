module AresMUSH
  module Custom
    class AcknMarqueCmd
      include CommandHandler
      
      attr_accessor :marque
   
      def handle
        if !enactor.has_role?("admin")
          client.emit_failure "Only staff are allowed to trigger this command."
          return nil
        elsif target.ranks_rank != "Adept"
          client.emit_failure "Only adept characters can have their marque acknowledged!"
          return nil
        else 
          target.update(marque: nil)
          target.update(rank: "Courtesan")
          client.emit_success "The marque has been acknowledged! #{target.name} now has new status of fully marqued courtesan."
          return true
        end
      end  
    end
  end
end
