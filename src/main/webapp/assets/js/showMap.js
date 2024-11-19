// function initMap() {
//     // Set a marker with the image map-marker-2-512.png
//     // var icon = {
//     //     url: '../../assets/img/map-marker-2-512.png',
//     //     scaledSize: new google.maps.Size(30, 30),
//     //     origin: new google.maps.Point(0, 0),
//     //     anchor: new google.maps.Point(16, 31)
//     // };
//
//     // Get the position of the post
//     var position = {lat: {{$publicacion->latitud_publicacion}}, lng: {{$publicacion->longitud_publicacion}}};
//
//     // Create the map
//     var map = new google.maps.Map(document.getElementById('map'), {
//         zoom: 15,
//         center: position
//     });
//
//     // Create the marker
//     var marker = new google.maps.Marker({
//         position: position,
//         map: map,
//         // icon: icon
//     });
// }
