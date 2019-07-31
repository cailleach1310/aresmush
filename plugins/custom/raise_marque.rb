module AresMUSH
  module Custom
    class RaiseMarqueCmd
      include CommandHandler
      
      attr_accessor :marque
   
      def handle
        if !enactor.has_role?("admin")
          client.emit_failure "Only staff are allowed to trigger this command."
          return nil
        elsif target.ranks_rank != "Adept"
          client.emit_failure "Only adept characters can have their marque raised!"
          return nil
        else 
          self.marque = target.marque + value
          target.update(marque: self.marque < 100 ? self.marque : 100)
          client.emit_success "#{target.name}'s marque has been raised to #{target.marque}."
          return true
        end
      end  
    end
  end
end
