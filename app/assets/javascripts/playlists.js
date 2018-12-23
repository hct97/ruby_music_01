$(document).on('turbolinks:load',function(){
  $('.add-playlist').on('submit',function(e){
    e.preventDefault();
    playlist_name = $('#playlist_name').val();
    url = $('.add-playlist form').attr('action');

    $.ajax({
      type: 'post',
      url: url,
      data: {name: playlist_name, user_id: user_id},
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        $('.notice').html(data.status);
        setTimeout(function(){
          $('#add_playlist').modal('hide')
          $('.notice').html('');
        },1000);
      },
      error: function(data) {
        $('.notice').html(data);
      }
    });
  });
});
