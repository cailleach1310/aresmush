module AresMUSH
 class Character
#   attribute :is_adept, :type => DataType::Boolean
#   attribute :set_connections, :type => DataType::Boolean
   
  def is_adept
    self.ranks_rank == "Adept"
  end

  def set_connections
    self.fs3_advantages.find(name: "Connections").first
  end

 end
end
