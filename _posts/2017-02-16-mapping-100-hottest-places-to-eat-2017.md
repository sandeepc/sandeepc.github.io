---
layout: post
title: Mapping Yelp's Hottest 2017 Eats
Category: posts
excerpt: A mapping of Yelp’s Hottest 100 Places to Eat in the U.S. for 2017.
tags: [visualization, maps, api, yelp, data science,]
image:
  path: /images/yelp/feature.jpg
  thumbnail: /images/yelp/feature.jpg
  caption: "[John Beswick](https://www.flickr.com/photos/7511731@N06/3196630278/)"
utm: utm_source=sandeepchivukula.com&utm_medium=blog&utm_campaign=yelp-100-visualization
share: true
ads: false
crosspost_to_medium: true
author: sandeep

---

### Yes but can you show it to me on a map?

Yelp recently published their annual list of the hottest places for 2017.
As I mentioned in [2015](http://blog.sandeepchivukula.com/post/2015/01/28/mapping-100-hottest-places-to-eat/) I prefer to see this list of restuarants on a map.

So without further ado here are 2017's 100 Hottest Places to eat, according to Yelp, presented on a map.
For a good measure, I've included the 2015 and 2016 ones as well.

Built with the [Yelp API](http://www.yelp.com/developers/?{{page.utm}}) and [Leaflet.js](https://leafletjs.com/?{{page.utm}})<-- amazing, easy, mobile friendly maps.

<div id="map"></div>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.0.3/leaflet.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.0.3/leaflet.js"></script>

<style> #map { height: 480px; width: 100%; } </style>
<script>

function addYelpData (L, options, callback)
{
  var year = options.year || '2017';
  var fill=options.color || '#f03';
  var color = (fill & 0xfe) >> 1;

  //Be sure you've loaded JQuery
  $.getJSON("/yelp-api-output-"+year+".json", function(json) {
    var markers=[];
    json.forEach(function(item){
      var marker = L.circleMarker([item.coordinates.latitude,item.coordinates.longitude],{
    color: color,
    fillColor: fill,
    fillOpacity: 0.7,
    }).setRadius(4);
      marker.bindPopup("<div><p><a href="+item.url+"><em style=\"margin:0\">"+item.name+"</em></a><br><small>"+item.address.pop().match(/(.*\, \w\w).*/)[1]+"   </small><br><img src="+item.rating_img_url+"></a><br><img  src=\"http://s3-media3.fl.yelpcdn.com/assets/2/www/img/3049d7633b6e/developers/reviewsFromYelpRED.gif\"></p></div>");
      marker.on('mouseover', function (e) {
          this.openPopup();
        });
      marker.on('mouseout', function (e) {
          this.closePopup();
        });
      markers.push(marker);

      });
    callback({ "year": year, "layer":L.layerGroup(markers)})
  });

}
function initialize ()
{
var southWest = L.latLng(14, -170),
    northEast = L.latLng(60, -50),
    bounds = L.latLngBounds(southWest, northEast),
    mapZoom = 4;
var color_palette=['#45CCFF','#49E83E','#FFD432','#E84B30']

var base= L.tileLayer('http://stamen-tiles-{s}.a.ssl.fastly.net/toner-lite/{z}/{x}/{y}.{ext}', {
  attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    ext:'png',
    subdomains: 'abcd'
  });
var labels= L.tileLayer('http://stamen-tiles-{s}.a.ssl.fastly.net/toner-labels/{z}/{x}/{y}.{ext}', {
    ext:'png',
    subdomains: 'abcd'
  });




var map = L.map('map',{center:[34, -94], zoom: mapZoom, maxBounds:bounds, minZoom:2,layers: [base,labels]});

var cl =  L.control.layers(undefined,undefined,{collapsed:false})

years =["2015","2016","2017"]

years.forEach(function(element,index)
{
  addYelpData(L,{year:element, color:color_palette[index]}, function(data){
    cl.addOverlay(data.layer,"<span style=background:"+color_palette[index]+";padding-left:10px></span>"+data.year);
    data.layer.addTo(map)
  });
})
cl.addTo(map)
}

window.onload = initialize;
</script>

[_Source Code on Github_](https://github.com/sandeep/yelp-map/?{{page.utm}})