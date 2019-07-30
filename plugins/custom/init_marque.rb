module AresMUSH
  module Custom
    class InitMarqueCmd
      include CommandHandler
      
      attr_accessor :marque
   
      def handle
        if Chargen.check_chargen_locked(enactor)
          client.emit_failure "Only staff are allowed to trigger this command."
          return nil
        elsif enactor.ranks_rank != "Novice"
          client.emit_failure "Initialising marque is only possible for a novice after their debut!"
          return nil
        else 
          enactor.update(marque: 0)
          enactor.update(rank: "Adept")
          client.emit_success "The marque has been set to zero! #{enactor.name} now has new status of adept."
          return true
        end
      end  
    end
  end
end
