function iniciarMap(){
    var icon = {
        url: '../../assets/img/map-marker-2-512.png',
        scaledSize: new google.maps.Size(30, 30),
        origin: new google.maps.Point(0,0),
        anchor: new google.maps.Point(16, 31)

    };

    navigator.geolocation.getCurrentPosition(function(position){
        var coords = new google.maps.LatLng(document.getElementById('latitud').value, document.getElementById('longitud').value);
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: coords
        });

        var marker = new google.maps.Marker({
            map: map,
            draggable: true,
            animation: google.maps.Animation.DROP,
            position: coords,
            icon: icon
        });

        marker.addListener('click', function(event){

            infoWindow = new google.maps.InfoWindow({
                content: '<p>Latitud: ' + marker.getPosition().lat() + '</p><p>Longitud: ' + marker.getPosition().lng() + '</p>'
            });

            infoWindow.open(map, marker);

            console.log("HELLO WORLD");
        });

        google.maps.event.addListener(marker, 'dragend', function(event){
            document.getElementById('latitud').value = this.getPosition().lat();
            document.getElementById('longitud').value = this.getPosition().lng();

            console.log("Latitude: " + this.getPosition().lat());
            console.log("Longitude: " + this.getPosition().lng());
        });

    });

    

}

