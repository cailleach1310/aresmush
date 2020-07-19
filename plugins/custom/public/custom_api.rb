module AresMUSH
  module Custom

    def self.scions
    	return Global.read_config("custom", "scion_list")
  	end

    def self.has_scion_set?(char)
      if !char.scion
        return false
      else
        return { {{self.scions}}.member?(char.scion) }
#        return true
      end
    end

#    def self.is_adept?(char)
#      if !(char.ranks_rank == 'Adept')
#        return false
#      else
#        return true
#      end
#    end

 end
end
