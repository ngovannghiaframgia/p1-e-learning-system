$(document).on('turbolinks:load', function() {
  getVideo();
  $("#video_id").on("change", function() {
    getVideo();
  });
})
function getVideo() {
  $.ajax({
    url: "/admin/lessons/get_video",
    method: "POST",
    dataType: "json",
    data: {video_id: $("#video_id").val() },
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      if (response == null) {
        $("#video").html("");
      } else {
        $("#video").html(response.link);
      }
    }
  });
}
