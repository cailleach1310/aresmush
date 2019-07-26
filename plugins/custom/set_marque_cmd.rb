module AresMUSH
  module Custom
    class SetMarqueCmd
      include CommandHandler
      
      attr_accessor :marque

      def parse_args
       self.marque = trim_arg(cmd.args)
      end

      def handle
        enactor.update(marque: self.marque)
        client.emit_success "The marque has been set to self.marque!"
      end
    end
  end
end