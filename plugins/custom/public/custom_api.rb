 module AresMUSH
  module Custom
      
  def self.is_adept?(char)
    return { (char.ranks_rank == "Adept") }
  end

  def self.set_connections?(char)
    return { (char.fs3_advantages.find(name: "Connections").first) }
  end

  end
 end
