var finestra, map;
var centrale, duomo, sanSiro, portaGenova;
var hoverIcon = "https://img.icons8.com/fluency/48/000000/google-maps-new.png"

function initMap() {
	map = new google.maps.Map(
		document.getElementById("map"), { zoom: 12.7, center: { lat: 45.468913893303124, lng: 9.160935201189181 } }
	);

	finestra = new google.maps.InfoWindow();
	addMarkers();
	map.addListener('click', function() {
		if (finestra) finestra.close();
	});
};

function addMarkers() {
	centrale = addMarker({
		coords: { lat: 45.487433512217876, lng: 9.205436084655465 },
		content: 'Stazione Centrale'
	});
	duomo = addMarker({
		coords: { lat: 45.46452297530038, lng: 9.189282626813764 },
		content: 'Duomo'
	});
	sanSiro = addMarker({
		coords: { lat: 45.47694428187834, lng: 9.118550334792761 },
		content: 'San Siro'
	});

	portaGenova = addMarker({
		coords: { lat: 45.45314460557561, lng: 9.169503827056161 },
		content: 'Porta Genova'
	});

}

function addMarker(props) {
	var marker = new google.maps.Marker({
		position: props.coords,
		map: map,
	});

	if (props.content) {
		marker.addListener('click', function() {
			finestra.setContent(props.content);
			finestra.open(map, marker);
		});
	}
	return marker
}

function passAttribute(stazione) {
	localStorage.setItem("stazione", stazione.id)
}

function evidenzia(stazione) {
	switch (stazione.id) {
		case "Centrale": centrale.setIcon(hoverIcon); break;
		case "Duomo": duomo.setIcon(hoverIcon); break;
		case "San-Siro": sanSiro.setIcon(hoverIcon); break;
		case "Porta-Genova": portaGenova.setIcon(hoverIcon); break;
	}
}

function togli(stazione) {
	switch (stazione.id) {
		case "Centrale": centrale.setIcon(null);; break;
		case "Duomo": duomo.setIcon(null); break;
		case "San-Siro": sanSiro.setIcon(null); break;
		case "Porta-Genova": portaGenova.setIcon(null); break;
	}
}