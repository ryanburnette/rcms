//= require jquery

//= require bootstrap

//= require ace/ace
//= require ace/theme-monokai

jQuery(document).ready(function($) {
  var posts = {}
    , admin = {}
    , editor
    ;

  posts.matchAceEditorAndField = function () {
    var editorContent = editor.getValue()
      , $field = $('#post_content')
      ;

    $field.val(editorContent);

    return editorContent;
  };
  
  posts.initAceEditor = function () {
    if ( $('#editor').length > 0 ) {
      editor = ace.edit("editor");
      editor.getSession().setUseWrapMode(true);

      editor.setValue($('#post_content').val());

      editor.on('change', function (e) {
        posts.matchAceEditorAndField();
      });
    }
  };

  posts.setDtNow = function () {
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

  posts.initAceEditor();
  posts.setDtNow();
  admin.signOut();
  admin.changePassword();
});









$.fn.setNow = function (onlyBlank) {
  var now = new Date($.now())
    , year
    , month
    , day
    , hours
    , minutes
    , seconds
    , formattedDateTime
    ;
  
  year = now.getFullYear();
  month = now.getMonth().toString().length === 1 ? '0' + (now.getMonth() + 1).toString() : now.getMonth() + 1;
  day = now.getDay().toString().length === 1 ? '0' + (now.getDay() + 1).toString() : now.getDay() + 1;
  hours = now.getHours().toString().length === 1 ? '0' + now.getHours().toString() : now.getHours();
  minutes = now.getMinutes().toString().length === 1 ? '0' + now.getMinutes().toString() : now.getMinutes();
  seconds = now.getSeconds().toString().length === 1 ? '0' + now.getSeconds().toString() : now.getSeconds();
  
  // seconds needs to be 0
  seconds = '00';

  formattedDateTime = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes + ':' + seconds;
 
  if ( onlyBlank === true && $(this).val() ) {
    return this;
  }
  
  $(this).val(formattedDateTime);
  
  return this;
}