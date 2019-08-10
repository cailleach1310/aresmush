module AresMUSH
  module Custom
    def self.do_marque_raise(target, amount)
      new_marque = target.marque.to_i + amount
      target.update(marque: new_marque < 100 ? new_marque : 100)
    end
  end
end
