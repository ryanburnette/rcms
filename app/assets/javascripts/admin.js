//= require jquery
//= require jquery.ui.sortable

//= require bootstrap

//= require ace/ace
//= require ace/theme-clouds

//= require ./lib/jquery.setnow.js

jQuery(document).ready(function($) {
  var admin = {}
    , editor
    ;

  admin.matchAceEditorAndField = function () {
    var height = editor.getSession().getScreenLength() * editor.renderer.lineHeight
      ;

    $('#post_content,#page_content').val(editor.getValue());
    
    console.log(height);
    $('#editor').height(height.toString() + "px");
    $('#editor-section').height(height.toString() + "px");
    editor.resize();
  };
  
  admin.initAceEditor = function () {
    if ( $('#editor').length > 0 ) {
      editor = ace.edit("editor");
      editor.setTheme("ace/theme/clouds");
      editor.getSession().setUseWrapMode(true);
      editor.getSession().setMode("ace/mode/markdown");

      editor.setValue($('#post_content,#page_content').val(), -1);

      editor.on('change', function () {
        admin.matchAceEditorAndField();
      });
      $(window).on('load',function () {
        admin.matchAceEditorAndField();
        $('body').click();
      });
    }
  };

  admin.setDtNow = function () {
    $('#post_date, #page_date').setNow(true);
  };

  admin.signOut = function () {
    var $link = $('.sign-out-link')
      , $button = $('.sign-out-button')
      ;

    $link.on('click', function (e) {
      console.log('foo');
      e.preventDefault();
      $button.trigger('click');
    });
  };

  admin.changePassword = function () {
    if ( $('.panel.user').hasClass('user-new') === true ) {
      return false;
    }

    var $passwordGroup = $('.form-group.password-group').wrap('<div class="password-group-location"></div>').remove()
      , $passwordGroupLocation = $('.password-group-location')
      , $changePasswordButton = $('input#update_password')
      ;
    
    $changePasswordButton.on('change', function () {
      if ( $(this).is(':checked') ) {
        $passwordGroupLocation.append($passwordGroup);
      }
      else {
        $passwordGroupLocation.html('');
      }
    });
  };

  admin.pagesSortable = function () {
    var $sortable = $('.admin-index.pages tbody')
      ;

    $sortable.sortable({
      handle: '.sort-handle'
    , helper: function(e,ui) {
        var $originals = ui.children()
          , $helper = ui.clone()
          ;
        
        $helper.css('background-color','white');
        $helper.children('td').css('border','none');
        $helper.children().each(function(index) {
          $(this).width($originals.eq(index).width());
        });
        
        return $helper;
      }
    , stop: function (e,ui) {
        var post
          ;
        //console.log(ui.item.data('id'),ui.item.index());
        post = $.ajax({
          type: 'POST',
          beforeSend: function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
          },
          url: '/admin/pages/' + ui.item.data('id') + '/order.json',
          data: { page: {'row_order_position':ui.item.index()} }
        });

        post.fail(function () {
          $sortable.sortable('cancel');
        });
      }
    });
  };

  admin.initAceEditor();
  admin.setDtNow();
  admin.signOut();
  admin.changePassword();
  admin.pagesSortable();
});
