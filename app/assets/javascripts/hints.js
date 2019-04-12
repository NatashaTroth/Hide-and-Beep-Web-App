// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("turbolinks:load", function() {
    $("#hints").sortable({
        update: function(e, ui) {
            Rails.ajax({
                url: $(this).data("url"),
                type: "PATCH",
                data: $(this).sortable('serialize')
            });
        }
    });


    let lat = document.getElementById('hint_latitude').value
    let lng = document.getElementById('hint_longitude').value
  
    if (lat.length == 0 && lng.length == 0) {
      // set default value if user want to add a new hint -> default value: position of FH Salzburg
      lat = 47.723730
      lng = 13.086596
    }
  
    var map = L.map('map').setView([lat, lng], 13);
  
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
  
    // set edit hint location in
    L.marker([lat, lng]).addTo(map)
      .bindPopup(`Current hint: ${lat}, ${lng}`)
      .openPopup();
  
    var popup = L.popup();
  
    function onMapClick(e) {
      var lat = ""
      var lng = ""
  
          popup
              .setLatLng(e.latlng)
              .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(map);
  
      document.getElementById('hint_latitude').value = e.latlng.lat
      document.getElementById('hint_longitude').value = e.latlng.lng
    }
    map.on('click', onMapClick)
});