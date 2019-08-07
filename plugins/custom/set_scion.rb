module AresMUSH
  module Custom
    class SetScionCmd
      include CommandHandler
      
      attr_accessor :scion

      def parse_args
       self.scion = trim_arg(cmd.args)
      end

      def handle
        enactor.update(scion: self.scion)
        client.emit_success "Scion power set to #{self.scion}!"
      end
    end
  end
end
