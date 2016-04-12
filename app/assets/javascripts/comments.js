$(function($) 
{
  var new_field_open = false;
  var comment_reply = false;
  var comment_edit = false;
  var parent_node;
	$(document).on('ajax:success', 'form', function(e, data, status, xhr) {
    if('comment' in data){
      if(this.parentNode.parentNode.id == "comment-form"){
        $('#comments-list').append(data.comment);
        $('#comment-field').val('');
      }
      else{
        if(comment_reply){
          var comment_field = parent_node.lastChild;
          var child_node = document.createElement('div');
          child_node.innerHTML=data.comment;
          parent_node.appendChild(child_node.childNodes[0]);
          comment_field.innerHTML="";
          comment_reply = false;
          new_field_open = false;
        }
        if(comment_edit){
           parent_node.innerHTML = data.comment;
           new_field_open = false;
           comment_edit = false;
        }
      }
    }
  });
  $(document).on('ajax:success', '#comment-delete', function(e, data, status, xhr) {
    if('comment_del' in data){
      this.parentNode.parentNode.parentNode.parentNode.remove();
    }
  });
  $(document).on('ajax:success', '#comment-reply', function(e, data, status, xhr) {
    if('comment_new' in data && !new_field_open){
      parent_node = this.parentNode.parentNode.parentNode.nextElementSibling;
      var child_node = document.createElement('div');
      child_node.innerHTML=data.comment_new;
      parent_node.appendChild(child_node.childNodes[0]);
      new_field_open = true;
      comment_reply = true;
    }
  });
  $(document).on('ajax:success', '#comment-edit', function(e, data, status, xhr) {
    if('comment_edit' in data){
      parent_node = this.parentNode.parentNode.parentNode;
      parent_node.innerHTML = data.comment_edit;
      new_field_open = true;
      comment_edit = true;
    }
  });
});
