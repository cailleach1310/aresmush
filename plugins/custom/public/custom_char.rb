 module AresMUSH
  module Custom
   class Character
    
  def self.is_adept?
    return { (self.ranks_rank == "Adept") }
  end

  def self.set_connections?
    return { (self.fs3_advantages.find(name: "Connections").first) }
  end

  end
 end
 end
