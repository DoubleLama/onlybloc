document.addEventListener("turbolinks:load", () => {

  const showMap = () => {
    const map = document.querySelector("#map");
    
    if (map) {
      let latitude = document.querySelector(".latitude").textContent;
      let longitude = document.querySelector(".longitude").textContent;  
      let name = document.querySelector("#climbing-center-name").textContent;
      
      let mymap = L.map('mapid', { scrollWheelZoom: false, dragging: !L.Browser.mobile, tap: !L.Browser.mobile }).setView([latitude, longitude], 12);
      
      let marker = L.marker([latitude,longitude]).addTo(mymap);
      marker.bindPopup(name);
      
      L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZG91YmxlbGFtYSIsImEiOiJja2tvNTBwMTIzNzZzMm9tbjJsYmk4c3huIn0.g1hupj-4IVdwsOO567HVBg', {
        tileSize: 512,
        zoomOffset: -1,
      }).addTo(mymap);
    }
  }

  showMap();
});