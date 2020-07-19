module AresMUSH
  class Character
    attribute :scion
#    attribute :sp

    def self.has_scion_set?
      if !self.scion
        return false
      else
        return { Module::Custom.scions.member?(self.scion) }
      end
    end

  end
end
