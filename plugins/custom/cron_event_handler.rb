module AresMUSH
  module Custom
    class CronEventHandler
     
      def on_event(event)
        config = Global.read_config("custom", "monthly_raise_cron")
        return if !Cron.is_cron_match?(config, event.time)
        
        Global.logger.debug "Monthly marque raise."

        amount = Global.read_config('custom', 'monthly_raise_amount')
        message = Global.read_config('custom', 'monthly_raise_message')
        title = Global.read_config("custom", "monthly_raise_title")
        adepts = Character.all.select { |c| c.ranks_rank == 'Adept' }
        adepts.each do |a|
          Custom.do_marque_raise(a, amount)
          Mail.send_mail([a.name], title, message, nil)
        end
        names = adepts.map { |c| c.name }
        Mail.send_mail("Thelesis", title, "Marque raise for the previous month has been handled for the following adepts:%r%r #{names.join(", ")}")
      end
    end
  end
end
