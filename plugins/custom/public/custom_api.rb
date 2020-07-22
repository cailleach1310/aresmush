module AresMUSH
  module Custom

    def self.scions
    	return Global.read_config("custom", "scion_list")
  	end

    def self.has_scion_set?(char)
      if !char.scion
        return false
      else
        return { Custom.scions.member?(char.scion) }
      end
    end

    def self.is_adept?(char)
       if (char.ranks_rank == "Adept")
         return true
       else 
         return false
       end
    end

 end
end
