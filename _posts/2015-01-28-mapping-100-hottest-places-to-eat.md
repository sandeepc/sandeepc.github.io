---
layout: post
title: Mapping Yelp's Hottest 2015 Eats
modified: 1/27/2015
categories: post
excerpt: A mapping of Yelp’s Hottest 100 Places to Eat in the U.S. for 2015.
tags: [visualization, maps, api, yelp, data science,]
image: 
  feature: yelp/feature.jpg
  creditlink: https://www.flickr.com/photos/7511731@N06/3196630278/
  credit: John Beswick
utm: utm_source=sandeepchivukula.com&utm_medium=blog&utm_campaign=yelp-100-visualization
share: true
ads: false
crosspost_to_medium: true

---

###Getting Down with Data Science

The data science team at [Yelp](http://officialblog.yelp.com/2015/01/yelps-top-100-places-to-eat-in-the-us-for-2015.html?{{page.utm}}) crunched  their trove of user-generated data and published their list of _100 __HOTTEST__ places to eat in the US for 2015_. I prefer to see these lists on map so my friends and I can check out the nearby ones.

So without further ado here are the 100 Hottest Places according to Yelp's presented on a map. 

Built with the [Yelp API](http://www.yelp.com/developers/?{{page.utm}}) and [Leaflet.js](https://leafletjs.com/?{{page.utm}})<-- amazing, easy, mobile friendly maps.

<div id="map"></div>
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
<style> #map { height: 480px; width: 100%; } </style>
<script>
function initialize ()
{
var southWest = L.latLng(15, -170),
    northEast = L.latLng(60, -50),
    bounds = L.latLngBounds(southWest, northEast);

  var map = L.map('map',{center:[34, -94], zoom:3, maxBounds:bounds, minZoom:3});

  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  //Be sure you've loaded JQuery
  $.getJSON("/yelp-api-output.json", function(json) {
    json.forEach(function(item){
      var marker = L.marker([item.coordinates.latitude,item.coordinates.longitude]).addTo(map);
      marker.bindPopup("<div><p><a href="+item.url+"><em style=\"margin:0\">"+item.name+"</em></a><br><small>"+item.address.pop().match(/(.*\, \w\w).*/)[1]+"   </small><br><img src="+item.rating_img_url+"></a><br><img  src=\"http://s3-media3.fl.yelpcdn.com/assets/2/www/img/3049d7633b6e/developers/reviewsFromYelpRED.gif\"></p></div>");
    });
  });
}
window.onload = initialize;
</script>

[_Source Code on Github_](https://github.com/sandeep/yelp-map/?{{page.utm}})