$(document).ready(function() {
  $('#show_track_times').on('click', function(e) {
    e.preventDefault();
    $('#show_track_times').toggleClass('clicked');
    $('#show_local_times').toggleClass('clicked');
    $('#local_times').hide();
    $('#track_times').show();
  });

  $('#show_local_times').on('click', function(e) {
    e.preventDefault();
    $('#show_track_times').toggleClass('clicked');
    $('#show_local_times').toggleClass('clicked');
    $('#track_times').hide();
    $('#local_times').show();
  });
});
