module AresMUSH
  class Character
   
  def is_adept
    t(self.ranks_rank == "Adept")
  end

  def set_connections
    t(self.fs3_advantages.find(name: "Connections").first)
  end

  end
 end
 end
