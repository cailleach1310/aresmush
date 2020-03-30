module AresMUSH
  module Custom
    class ListMarqueCmd
      include CommandHandler
      
      def handle
        ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
        if !enactor.has_role?("admin")
          client.emit_failure "Only staff are allowed to trigger this command."
          return nil
        else
          adept_chars = Character.all.select { |char| char.ranks_rank == 'Adept' }
          template = MarqueTemplate.new adept_chars
          client.emit template.render
        end
      end

    end  
  end
end


