---
layout: post
title: Building a photo search in a weekend - Building a Front End (Part 3)
excerpt: Extract Color and Exif Data from Photos to index into a search engine.
Category: posts
tags: [exif, photos,elasticsearch, search, indexing, angularjs, docker, photo search]
image:
  path: /images/elasticphotos/library_card.jpg
  thumbnail: /images/elasticphotos/library_card.jpg
  caption: "[andresmh](https://www.flickr.com/photos/amonroy/6955679718/)"
comments: true
share: true
ads: false
crosspost_to_medium: true

utm: utm_source=sandeepchivukula.com&utm_medium=blog&utm_campaign=photosearch-3
---

# Part 3: Search Front End

_Prerequisites: Node.js; Bower_

So far we've [created the search infrastructure](/posts/2016/03/06/photo-search/?{{page.utm}}), [indexed our photos into our ElasticSearch instance](/posts/2016/03/07/photo-search-2/?{{page.utm}}) and then used Kibana for intial data exploration.

Now we need a simple front end to collect user input and query the back end and tie it all together by displaying the pictures that have the chosen color.

Most of the AngularJS code needed is boilerplate. Rather than recreate the wheel, our app leverages the angular-seed app template and this [guide from SitePoint on building a very basic angular + elasticsearch app.](http://www.sitepoint.com/building-recipe-search-site-angular-elasticsearch/?{{page.utm}})

![SitePoint](/images/elasticphotos/sitepoint.png)

Both those sites provide detailed walk-throughs so the focus of this write up will be on the getting the query right which is the magic behind the curtain for our search experience.

As always, the full code for this example is available in the [photosearch project repository.](http://github.com/sandeep/photosearch/?{{page.utm}}) You can run it with `npm start`. Be sure to change the code to point to your Elasticsearch instance and update the path to your photo library in the view so that they display correctly.


### Finding the Right Query: RGB, HSL, LAB, OMG!

Color matching, it turns out, is a [non-trivial problem.](https://en.wikipedia.org/wiki/Color_difference/?{{page.utm}}) To summarize succintly, [RGB space](https://en.wikipedia.org/wiki/List_of_color_spaces_and_their_uses#RGB?{{page.utm}}) is perceptually non-uniform so your every day euclidean distance formula doesn't work to give you color that your percieve to be similar. To overcome this, professionals switch to [a more uniform color space](https://en.wikipedia.org/wiki/List_of_color_spaces_and_their_uses#LAB?{{page.utm}}) and then use a distance formula complicated by additional "weights" that account for differences in perception for a given application of the forumla.

To make life easier, Elasticsearch has a powerful concept called filtered query which allows you to aggregate and score the results using "nearness" functions that make the color matching problem simple. This is demonstrated in this post about [search by color for an ecommerce store.](https://dpb587.me/blog/2014/04/24/color-searching-with-elasticsearch.html?{{page.utm}})

We implement a similar scoring function on HSL values that we extracted using our indexer to get a result of photos that have perceptually similar colors to the color selected by the user.


<script src="https://gist.github.com/sandeep/eeac2ac42795e88e9c4f.js"></script>


### Finishing Up

With the right query in place we execute the search and... Voila!


![Angular Photo Search](/images/elasticphotos/angular-photo-search.gif)

In an very short time we've created a full featured search engine for your photos. Hope you enjoyed this walk-through on how  to create a powerful search engine based on some pretty easily available off-the-shelf components!

_If you found this interesting and want to chat, feel free to reach out via Twitter:[@_sandeep](http://twitter.com/_sandeep/?{{page.utm}})_



