$ ->
  $('.genreFilter').change ->
    location.href = '/books?genre=' + $(this).val()

  $('.nameFilter').change ->
    location.href = '/books?name=' + $(this).val()