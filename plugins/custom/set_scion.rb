module AresMUSH
  module Custom
    class SetScionCmd
      include CommandHandler
      
      attr_accessor :scion

      def parse_args
       self.scion = trim_arg(cmd.args)
      end

      def handle
        if Chargen.check_chargen_locked(enactor)
          client.emit_failure "You can't set your scion power outside of chargen! Please contact staff."
          return nil
        else
          enactor.update(scion: self.scion)
          client.emit_success "Scion power set to #{self.scion}!"
        end
      end
    end
  end
end
