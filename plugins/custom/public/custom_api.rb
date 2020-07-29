 module AresMUSH
  module Custom
      
  def self.is_adept?(char)
    return { (char.ranks_rank == "Adept") }
  end
