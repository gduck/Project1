// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

 function remove_fields(link) {
    var x = $(link).prev(".killme").val(1);
    var y = $(link).closest(".fields").hide();
  };

  function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_language_profs", "g");
    // may need to adjust where this is added below
    console.log($('#other-lang'));
    $('#other-lang').append(content.replace(regexp, new_id));
    // $(link).parent().after(content.replace(regexp, new_id));
  };

   // must put the data-langid in when selected
  var update_langids = function(link) {
    //var id = link(id);
    console.log(link.id);
    //console.log(id);
    
    var element = document.getElementById(link.id);
    console.log(element);
    
    $(link).parent().attr("data-langid", element.selectedIndex);
    console.log($(link).parent().data("langid"));
  }
