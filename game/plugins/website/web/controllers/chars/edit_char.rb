module AresMUSH
  class WebApp
    get '/char/:id/edit/?', :auth => :approved do |id|
      @char = Character.find_one_by_name(id)
      if (!@char)
        flash[:error] = "Character not found."
        redirect '/chars'
      end

      erb :"chars/edit_char"
    end
    
    post '/char/:id/edit', :auth => :approved do |id|
      @char = Character.find_one_by_name(id)
      
      if (!@char)
        flash[:error] = "Character not found."
        redirect '/chars'
      end
      
      if (!can_manage_char?(@char))
        flash[:error] = "You are not allowed to do that."
        redirect "/chars"
      end
      
      if (!(@char.is_approved? || @user.is_admin? ) )
        flash[:error] = "You can only edit approved characters."
        redirect char_page_url(@char)
      end
                        
      demographics = {}
      profile = {}
      relationships = {}
      hooks = {}
      
      params.each do |k, v|
        if (k.start_with?('profiletitle-') && !v.blank?)
          name = k.after('-')
          profile[v.titleize] = params["profile-#{name}"]
        elsif (k.start_with?('demo-'))
          name = k.after('-')
          demographics[name.titleize] = v
        elsif (k.start_with?('relationname-') && !v.blank?)
          name = k.after('-')
          relationships[v.titleize] = { 
            'category' => params["relationcat-#{name}"],
            'relationship' => params["relationdetail-#{name}"]
          }
        elsif (k.start_with?('hookname-') && !v.blank?)
          name = k.after('-')
          hooks[v.titleize] = params["hookdesc-#{name}"]
        end
      end
      
      demographics.each do |name, value|
        @char.update_demographic name, value
      end
      
      relationship_categories = (@params[:relationship_category_order] || "").split(',').map { |r| r.strip.titleize }
      @char.update(relationships_category_order: relationship_categories)
      
      @char.set_profile(profile)
      @char.update(relationships: relationships)
      @char.update(profile_image: params[:profileimage])
      @char.update(profile_gallery: params[:gallery])
      
      tags = params[:tags] || ""
      @char.update(profile_tags: tags.split(" ").map { |t| t.downcase })
      
      hooks.each do |name, desc|
        FS3Skills.set_hook(@char, name, desc)
      end
      
      @char.fs3_hooks.each do |hook|
        if (!hooks.any? { |name, desc| name.upcase == hook.name.upcase })
          hook.delete
        end
      end
      
      flash[:info] = "Character updated!"
      redirect char_page_url(@char)
    end
  end
end