module AresMUSH
  module Custom

    def self.scions
    	return Global.read_config("custom", "scion_list")
  	end

    def self.has_scion_set?(char)
      if !char.scion
        return false
      else
        return { self.scions.member?(char.scion) }
      end
    end

    def self.do_marque_raise(target, amount)
      new_marque = target.marque.to_i + amount
      target.update(marque: new_marque < 100 ? new_marque : 100)
    end

    def self.check_can_view_goals?(target, viewer)
      if target.name == viewer.name
        return nil
      elsif Character.has_permission?(viewer, 'view_bgs')
        return nil
      else
        return false
      end
    end  

    def self.has_scion_set?(char)
      if !char.scion
        return false
      else
        return { {{self.scions}}.member?(char.scion) }
      end
    end  
  end
end
