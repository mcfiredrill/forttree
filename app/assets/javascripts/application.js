//= require jquery
//= require textinputs_jquery
//= require jquery-pjax/jquery.pjax
//= require jquery-cookie/jquery.cookie

function anim_show(el) {
	$(el).fadeIn();
}

function anim_hide(el) {
	$(el).fadeOut();
}

function insert_emoticon(face) {
	var my_text = $('#leaf_content').val();
	var caret_pos = $('#leaf_content').getSelection().end;

	$('#leaf_content').val(
		my_text.substring(0, caret_pos)
		+ face
		+ my_text.substring(caret_pos)
	);

	$('#leaf_content').setSelection(caret_pos + face.length);
}

$(document).ready(function() {
	img_src = '/images/spinner.gif';

	function createSpinner() {
		return $('<img/>', {
			src: img_src,
			class: 'spinner'
		});
	}

	$('.pagination a').on('click', function(e) {
		e.preventDefault();

		var $el = $(e.target);
		$el.closest('.pagination').append(createSpinner());
		target = $('branches');
		$.pjax({
			url: $el.attr('href'),
			container: '#page'
		});
	});
});

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

window.onunload = function(e) {
  var title = get_active_stylesheet();
	$.cookie('style_cookie', title, 365);
}

window.onload = function(e) {
  var cookie = $.cookie('style_cookie');
  var title = cookie ? cookie : get_preferred_stylesheet();
  set_stylesheet(title);
}
