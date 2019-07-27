module AresMUSH
  module Custom
    class SetMarqueCmd
      include CommandHandler
      
      attr_accessor :marque

      def parse_args
       self.marque = integer_arg(cmd.args)
      end

      def handle
        if enactor.ranks_rank != Adept
          client.emit_failure "Only adept characters can set their marque!"
          return nil
        elsif enactor.chargen_locked = "true"
          client.emit_failure "You can't set your marque outside chargen! Please contact staff."
          return nil
        elsif (self.marque < 0) || (self.marque > 100)
          client.emit_failure "The value must be in the range 0-100!"
          return nil
        else 
          enactor.update(marque: self.marque)
          client.emit_success "The marque has been set!"
          return true
        end
      end  
    end
  end
end
