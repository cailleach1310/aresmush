module AresMUSH
  module Custom
    class ListMarqueCmd
      include CommandHandler
      
      def handle
        adept_chars = all.select { |char| ranks_rank == 'Adept' }
                
        template = MarqueTemplate.new adept_chars
        client.emit template.render

      end
    end  
  end
end


