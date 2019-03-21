$(document).on('turbolinks:load', function() {
  $("#exercise").on("change", function(){
    var txt = $("#exercise option:selected").text();
    var val = $("#exercise option:selected").val();
    addListExercied(val, txt)

  })

  $(document).on("click", ".cursor-pointer",function() {
    id = $(this).attr("data-id")
    const selt = $(this)
    removeListExercied(id, selt)
  });
})

function addListExercied(val, txt) {
  $.ajax({
    url: "/admin/homeworks_details",
    method: "POST",
    dataType: "json",
    data: {homework_id: $("#homework_homework_id").val(), exercise_id: val },
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      if (response != null) {
        $("#list_exercises").append(`
        <div class="margin-top-bottom-1em">
          <input type="text" disabled="disabled" value="`+txt+`">
          <i class="fa fa-times-circle-o cursor-pointer" aria-hidden="true"
            data-id="`+$("#homework_homework_id").val()+`"></i>
        </div>`);
      } else {
        alert("response null")
      }
    },

  })
}

function removeListExercied(id, selt) {
  $.ajax({
    url: "/admin/homeworks_details/"+id,
    method: "DELETE",
    dataType: "json",
    data: {homeworks_detail_id: id },
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      if (response != null) {
        selt.parent().remove()
      } else {
        alert("response null")
      }
    },

  })
}
