module AresMUSH
  module Custom
    class SetMarqueCmd
      include CommandHandler
      
      attr_accessor :marque

      def parse_args
       self.marque = integer_arg(cmd.args)
      end

      def handle
        if (self.marque >= 0) && (self.marque <=100)
          enactor.update(marque: self.marque)
          client.emit_success "The marque has been set!"
        else
          return nil
        end  
      end
    end
  end
end
