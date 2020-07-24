module AresMUSH
  module Custom
    class SetConnectionsCmd
      include CommandHandler
      
      attr_accessor :connections

      def parse_args
       self.connections = trim_arg(cmd.args)
      end

      def handle
        if Chargen.check_chargen_locked(enactor)
          client.emit_failure "You can't set your connections outside of chargen! Please contact staff."
          return nil
        else
          enactor.update(connections: self.connections)
          client.emit_success "Your connections have been set to #{self.connections}!"
        end
      end
    end
  end
end
