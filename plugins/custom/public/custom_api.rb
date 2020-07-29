 module AresMUSH
  module Custom

  def self.standard_channel(char)
    faction = char.group("faction")
    if (faction == "Noble")
      return "Nobility"
    else
      return faction
    end
  end
      
  def self.is_adept?(char)
    return { (char.ranks_rank == "Adept") }
  end
