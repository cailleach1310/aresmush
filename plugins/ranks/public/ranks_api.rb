module AresMUSH
  module Ranks
    def self.is_enabled?
      !Global.plugin_manager.is_disabled?("ranks")
    end
    
    def self.app_review(char)
      message = t('ranks.app_review')
      
      if (!char.rank)
        status = t('chargen.are_you_sure', :missing => t('ranks.review_rank_missing'))
      elsif Ranks.check_rank(char, char.rank, false)
        status = t('ranks.review_rank_invalid')
      else
        status = t('chargen.ok')
      end
      
      Chargen.format_review_status(message, status)
    end
    
    def self.military_name(char)
      fullname = char.fullname
      
      return fullname if !Ranks.is_enabled?
      
      names = fullname.split(" ")
      if names.count == 1
        first_name = names[0]
        last_name = ""
      else
        first_name = names[0]
        last_name = names[-1]
      end
      rank_str = char.rank.blank? ? "" : "#{char.rank} "
      test = names[-2].downcase
      if (test == "nó") || (test == "no") || (test == "de") || (test == "van")
        fill_str = test + " "
      elsif (test == "la") && (names[-3].downcase == "de")
        fill_str = "de la "
      else fill_str = ""
      end
      "#{rank_str}#{first_name} #{fill_str}#{last_name}"
    end
    
    def self.set_rank(char, rank, allow_all = false)
      error = Ranks.check_rank(char, rank, allow_all)
      return error if error
      char.update(ranks_rank: rank)
      return nil
    end
  end
end
