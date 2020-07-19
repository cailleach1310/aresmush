module AresMUSH
  module Custom

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

  end
end
