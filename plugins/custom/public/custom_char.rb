 module AresMUSH
  module Custom
   class Character
    
  def self.is_adept?
    return { (self.ranks_rank == "Adept") }
  end

  def self.set_connections?(char)
    return { (self.fs3_advantages.find(name: "Connections").first) }
  end

  end
 end
 end
