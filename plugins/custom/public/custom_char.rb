module AresMUSH
  class Character
   
  def is_adept
    return { (self.ranks_rank == "Adept") }
  end

  def set_connections
    return { (self.fs3_advantages.find(name: "Connections").first) }
  end

  end
 end
 end
