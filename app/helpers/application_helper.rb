module ApplicationHelper
  def link_to_remove_fields(name, f)
    # for some reason this hidden field below doesnt work
    # have put it in form template instead
    #f.hidden_field(:_destroy), {:class => "killme"})
    link_to name, "javascript:", :onclick => "remove_fields(this);"
  end

  def link_to_add_fields(name, f, association)
    # f here must be from user_form for correct association
    new_object = f.object.class.reflect_on_association(association).klass.new

    puts ">>>>>>>>>>> new object is #{new_object}"

    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    link_to name, "javascript:", :onclick => "add_fields(this, \":language_profs\", \"#{escape_javascript(fields)}\");"

  end
    
end
