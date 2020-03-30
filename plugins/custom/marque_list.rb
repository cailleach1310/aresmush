module AresMUSH
  module Custom
    class ListMarqueCmd
      include CommandHandler
      
      def check_can_view
        return nil if enactor.has_role?("admin")
        return "You are not allowed to use this command."
      end	

      def handle
        adept_chars = Character.all.select { |char| char.ranks_rank == 'Adept' }

        template = MarqueTemplate.new adept_chars
	client.emit template.render
      end 
    end  
  end
end

