$(function($) 
{
  $(document).on('ajax:success', '#post-delete', function(e, data, status, xhr) {
    if('post' in data){
      console.log(data.post);
      this.parentNode.parentNode.remove();
    }
  });
});
