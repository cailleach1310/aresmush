 module AresMUSH
  class Character

  def self.standard_channel
    faction = self.group("faction")
    if (faction == "Noble")
      return "Nobility"
    else
      return faction
    end
  end
      
  def self.is_adept?
    return { (self.ranks_rank == "Adept") }
  end
