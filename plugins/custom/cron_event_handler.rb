module AresMUSH
  module Custom
    class CronEventHandler
     
      def on_event(event)
        config = Global.read_config("custom", "monthly_raise_cron")
        return if !Cron.is_cron_match?(config, event.time)
        
        month = Date::MONTHNAMES[Date.today.month]
        
        Global.logger.debug "Monthly marque raise for #{month}."

        amount = Global.read_config('custom', 'monthly_raise_amount')
        message = Global.read_config('custom', 'monthly_raise_message') 
        title = Global.read_config("custom", "monthly_raise_title") + month
        adepts = Character.all.select { |c| c.ranks_rank == 'Adept' }
        adepts.each do |a|
          Custom.do_marque_raise(a, amount)
          Mail.send_mail([a.name], title, message, nil)
        end
        names = adepts.map { |a| a.name }
        Jobs.create_job("MISC", 
               "Marque Raise Summary" + month, 
               "Marque raise for the month #{month} has been handled for the following adepts: #{names.join(", ")}", 
               Game.master.system_character)          
      end
    end
  end
end
