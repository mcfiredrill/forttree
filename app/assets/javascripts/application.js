//= require jquery
//= require caret/jquery.caret
//= require js-cookie/js.cookie
//= require three.js.js
//= require fort-scene

(function() {
  function insertEmoticon(face) {
    var $content = $('#leaf_content');
    var myText = $content.val();
    var caretPos = $content.caret();

    $content.val(
      myText.substring(0, caretPos) +
      face +
      myText.substring(caretPos)
    );

    $content.caret(caretPos + face.length);
  }

  /* yoinked from wakaba */
  function setStylesheet(styletitle) {
    $('#forttree-3d-content').hide();
    $('#forttree-content').show();
    var links = document.getElementsByTagName('link');
    var found = false;
    for (var i = 0;  i <links.length; i++) {
      var rel = links[i].getAttribute('rel');
      var title = links[i].getAttribute('title');
      if(rel.indexOf('style') !== -1 && title) {
        links[i].disabled = true; // IE needs this to work. IE needs to die.
        if (styletitle === title) {
          links[i].disabled = false;
          found = true;
        }
      }
    }
    if (!found) {
      setPreferredStylsheet();
    }
  }

  function setPreferredStylsheet() {
    var links = document.getElementsByTagName('link');
    for (var i = 0; i < links.length; i++) {
      var rel = links[i].getAttribute('rel');
      var title = links[i].getAttribute('title');
      if (rel.indexOf('style') !== -1 && title) {
        links[i].disabled = (rel.indexOf('alt') !== -1);
      }
    }
  }

  function getPreferredStylesheet() {
    var links = document.getElementsByTagName('link');
    for (var i = 0; i < links.length; i++) {
      var rel = links[i].getAttribute('rel');
      var title = links[i].getAttribute('title');
      if (rel.indexOf('style') !== -1 && rel.indexOf('alt') === -1 && title) {
        return title;
      }
    }
    return null;
  }

  function getActiveStylesheet() {
    var links = document.getElementsByTagName('link');
    for (var i = 0; i < links.length; i++) {
      var rel = links[i].getAttribute('rel');
      var title = links[i].getAttribute('title');
      if (rel.indexOf('style') !== -1 && title && !links[i].disabled) {
        return title;
      }
    }
  }

  window.onunload = function() {
    var title = getActiveStylesheet();
    Cookies.remove('style_cookie');
    Cookies.set('style_cookie', title);
  };

  window.onload = function() {
    var cookie = Cookies.get('style_cookie');
    var title = cookie ? cookie : getPreferredStylesheet();
    setStylesheet(title);
  };

  $(document).ready(function() {

    var fortscene;
    $('.set-theme').click(function() {
      var theme = $(this).data('theme');
      if (theme === '3d') {
        var $container = $('#forttree-content-container');
        if (typeof fortscene === 'undefined') {
          fortscene = new FortScene($container);
        }

        fortscene.init();
      } else {
        setStylesheet($(this).data('theme'));
      }
      return false;
    });

    $('.insert-emoticon').click(function() {
      insertEmoticon($(this).data('text'));
      return false;
    });

    $('.smiley-helper-show').click(function() {
      $('#smiley_helper').fadeToggle();
      return false;
    });
  });
})();
