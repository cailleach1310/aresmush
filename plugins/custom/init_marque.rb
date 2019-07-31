module AresMUSH
  module Custom
    class InitMarqueCmd
      include CommandHandler
      
      attr_accessor :marque
   
      def handle
        if !enactor.has_role?("admin")
          client.emit_failure "Only staff are allowed to trigger this command."
          return nil
        elsif target.ranks_rank != "Novice"
          client.emit_failure "Initialising marque is only possible for a novice after their debut!"
          return nil
        else 
          target.update(marque: 0)
          target.update(rank: "Adept")
          client.emit_success "The marque has been set to zero! #{target.name} now has new status of adept."
          return true
        end
      end  
    end
  end
end
