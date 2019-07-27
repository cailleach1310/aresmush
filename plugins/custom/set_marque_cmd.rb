module AresMUSH
  module Custom
    class SetMarqueCmd
      include CommandHandler
      
      attr_accessor :marque

      def parse_args
       self.marque = integer_arg(cmd.args)
      end

      def handle
        if enactor.rank = Adept
          if (self.marque >= 0) && (self.marque <=100)
            enactor.update(marque: self.marque)
            client.emit_success "The marque has been set!"
          else
            client.emit_failure "The value must be in the range 0-100!"
            return nil
          end
        else
          client.emit_failure "Only adept characters can set their marque!"
        end  
      end
    end
  end
end
