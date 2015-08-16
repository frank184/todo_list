$(function(){
  $('.checkbox').click(function(){$(this).parent('form').submit();});
  $('.task_updated_at').timeago();
});
