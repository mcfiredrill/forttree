//= require jquery
//= require textinputs_jquery
//= require jquery-cookie/jquery.cookie
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


function anim_show(el) {
  $(el).fadeIn();
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


function anim_hide(el) {
  $(el).fadeOut();
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


function insert_emoticon(face) {
  var my_text = $('#leaf_content').val();
  var caret_pos = $('#leaf_content').getSelection().end;
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


  $('#leaf_content').val(
    my_text.substring(0, caret_pos)
    + face
    + my_text.substring(caret_pos)
    );
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


  $('#leaf_content').setSelection(caret_pos + face.length);
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


/* yoinked from wakaba */
function set_stylesheet(styletitle) {
  var links = document.getElementsByTagName("link");
  var found = false;
  for (var i=0; i<links.length; i++) {
    var rel = links[i].getAttribute("rel");
    var title = links[i].getAttribute("title");
    if(rel.indexOf("style") != -1 && title) {
      links[i].disabled = true; // IE needs this to work. IE needs to die.
      if (styletitle == title) {
        links[i].disabled = false;
        found = true;
      }
    }
  }
  if (!found) {
    set_preferred_stylesheet();
  }
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


function set_preferred_stylesheet() {
  var links = document.getElementsByTagName("link");
  for (var i=0; i<links.length; i++) {
    var rel = links[i].getAttribute("rel");
    var title = links[i].getAttribute("title");
    if (rel.indexOf("style") != -1 && title) {
      links[i].disabled = (rel.indexOf("alt") != -1);
    }
  }
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


function get_preferred_stylesheet() {
  var links = document.getElementsByTagName("link");
  for (var i=0; i<links.length; i++) {
    var rel = links[i].getAttribute("rel");
    var title = links[i].getAttribute("title");
    if (rel.indexOf("style") != -1 && rel.indexOf("alt") == -1 && title) {
      return title;
    }
  }
  return null;
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


function get_active_stylesheet() {
  var links=document.getElementsByTagName("link");
  for (var i=0; i<links.length; i++) {
    var rel=links[i].getAttribute("rel");
    var title=links[i].getAttribute("title");
    if (rel.indexOf("style") != -1 && title && !links[i].disabled) {
      return title;
    }
  }
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


window.onunload = function(e) {
  var title = get_active_stylesheet();
  $.cookie('style_cookie', title, 365);
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


window.onload = function(e) {
  var cookie = $.cookie('style_cookie');
  var title = cookie ? cookie : get_preferred_stylesheet();
  set_stylesheet(title);
}
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


$(document).ready(function() {
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


  $('.set-theme').click(function(e) {
    console.log($(this).data('theme'));
    set_stylesheet($(this).data('theme'));
    return false;
  });
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


  $('.insert-emoticon').click(function(e) {
    insert_emoticon($(this).data('text'));
    return false;
  });
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require forttree

// for more details see: http://emberjs.com/guides/application/
Forttree = Ember.Application.create();


  $('#smiley-helper-show').click(function(e) {
    $("#smiley_helper").fadeToggle();
    return false;
  });
});
