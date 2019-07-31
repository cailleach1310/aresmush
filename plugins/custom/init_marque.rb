module AresMUSH
  module Custom
    class InitMarqueCmd
      include CommandHandler
      
      attr_accessor :name, :num

      
      def parse_args
        args = cmd.parse_args( /(?<name>[^\=]+)\/(?<num>.+)/)
        self.name = titlecase_arg(args.name)
        self.num = trim_arg(args.num)
      end
      
      def required_args
        [ self.name, self.num ]
      end
      
      def handle
          ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
          if !enactor.has_role?("admin")
            client.emit_failure "Only staff are allowed to trigger this command."
            return nil
          elsif model.ranks_rank != "Novice"
            client.emit_failure "Initialising marque is only possible for a novice after their debut!"
            return nil
         else 
            model.update(marque: 0)
            model.update(ranks_rank: "Adept")
            client.emit_success "The marque has been set to zero! #{model.name} now has new status of adept."
          return true
        end
      end  
    end
  end
end
