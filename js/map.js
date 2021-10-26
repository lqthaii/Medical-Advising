navigator.geolocation.getCurrentPosition((success) => {
    console.log(success.coords);
    setupMap([success.coords.longitude, success.coords.latitude])
}, (error) => {
    console.log(error);
},{enableHighAccuracy: true})

function setupMap(center) {
    mapboxgl.accessToken = 'pk.eyJ1IjoibWl6dWhhMjAyMSIsImEiOiJja3VuZm5tcTUwcnh5MnZveDY1Zm4xcjR2In0.5XH5sAKsaf_7USq6iC7rBA';
    const map = new mapboxgl.Map({
        container: 'map', // container ID
        style: 'mapbox://styles/mapbox/streets-v11', // style URL
        center: center, // starting position [lng, lat]
        zoom: 9 // starting zoom
    });
    const nav = new mapboxgl.NavigationControl();
    map.addControl(nav);
    const direction = new MapboxDirections({
        accessToken: mapboxgl.accessToken
        });
    map.addControl(direction,'top-left');
}
