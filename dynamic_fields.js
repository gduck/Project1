  function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_language_profs", "g");
    $('#other-lang').append(content.replace(regexp, new_id));
  };

module ApplicationHelper

  def link_to_add_fields(name, f, association)
    # f here must be from user_form for correct association
    new_object = f.object.class.reflect_on_association(association).klass.new

    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to name, "javascript:", :onclick => "add_fields(this, \"association\", \"#{escape_javascript(fields)}\");"
  end
   
end