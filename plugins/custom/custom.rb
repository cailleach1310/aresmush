$:.unshift File.dirname(__FILE__)

module AresMUSH
  module Custom
    def self.plugin_dir
      File.dirname(__FILE__)
    end
 
    def self.shortcuts
      Global.read_config("custom", "shortcuts")
    end
 
    def self.get_cmd_handler(client, cmd, enactor)      
      case cmd.root
      when "goals"
        case cmd.switch
        when "set"
          return SetGoalsCmd
        else
          return GoalsCmd
        end
      when "marque"
        case cmd.switch
        when "set"
          return SetMarqueCmd
        when "init"
          return InitMarqueCmd
        when "raise"
          return RaiseMarqueCmd
        when "acknowledge"
          return AcknMarqueCmd
        else
          return MarqueCmd
        end
      else
        return nil
      end
    end
  
  end
end
