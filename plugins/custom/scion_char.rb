module AresMUSH
  class Character
    attribute :scion
#    attribute :sp

    def self.has_scion_set?(char)
      if !char.scion
        return false
      else
#        return { {{self.scions}}.member?(char.scion) }
        return true
      end
    end
  
  end
end
