module AresMUSH
  class Character

    def self.has_scion_set?
      if !self.scion
        return false
      else
        return { Module::Custom.scions.member?(self.scion) }
      end
    end

    def self.is_adept?
      if !(self.ranks_rank == 'Adept')
        return false
      else
        return true
      end
    end

 end
end
