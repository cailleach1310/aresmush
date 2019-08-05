module AresMUSH
  module Custom
    class InitMarqueCmd
      include CommandHandler
      
      attr_accessor :name, :num

      
      def parse_args
        self.name = trim_arg(cmd.args)
      end
      
      def required_args
        [ self.name ]
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
            Achievements.award_achievement(model, "debuted")
            client.emit_success "The marque has been set to zero! #{model.name} now has new status of adept."
            return true
          end   
        end
      end  
    end
  end
end
