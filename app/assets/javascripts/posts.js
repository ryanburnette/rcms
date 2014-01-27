jQuery(document).ready(function($) {
  var posts = {}
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
    editor = ace.edit("editor");
    editor.getSession().setUseWrapMode(true);

    editor.setValue($('#post_content').val());

    editor.on('change', function (e) {
      posts.matchAceEditorAndField();
    });
  };

  posts.initAceEditor();
});