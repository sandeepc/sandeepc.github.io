---
layout: post
title:  Building a photo search in a weekend - Elasticsearch + Docker (Part 1)
excerpt: Instantly sorting thousands of photos by color is a tough problem. Elasticsearch, Docker, and AngularJS makes it easy.
category: posts
tags: [photos,elasticsearch, search, indexing, angularjs, docker, photo search]
image:
  feature: elasticphotos/library_card.jpg
  creditlink: https://www.flickr.com/photos/amonroy/6955679718/
  credit: andresmh
comments: false
share: true
ads: false
crosspost_to_medium: true

utm: utm_source=sandeepchivukula.com&utm_medium=blog&utm_campaign=photosearch
crosspost_to_medium: true
---

# Motivation

If you're anything like me, which I suspect you are, over the years you've probably amassed a large collection of photos. With over 73,257 photos across 707 directories representing 15 years of digital photography, finding a particular photo is a challenge.

While most photos have some combination of date and time or even GPS information, most people don't spend their lives memorizing times and dates of photos. We need to augment the "metadata" with something more human. 

Wouldn't it be great if we could search for photos by features that people remember? Features, such as the color of the sunset or the blue of the sky in the picture they're looking for?


# A Three Part Solution

Our solution needs three parts: First, we need robust search engine infrastructure. Second, the photos need to be cataloged and added to search engine's index. And finally, we need a simple way for users to search through tens of thousands of images by metadata, colors or any other feature we choose to add to the index.

# Part 1: Search Infrastructure in a Box

_Prerequisites: You will a need working [Docker](http://www.docker.com/?{{page.utm}}) installation._

One of the most flexible search tools available today is [Elasticsearch](https://www.elastic.co/products/elasticsearch/?{{page.utm}}). This provides powerful indexing, query and aggregation functions out of the box. Best of all, you can access all of this via a http API. 

In addition to Elasticsearch, we'll also bring up [Kibana](https://www.elastic.co/products/kibana/?{{page.utm}}), a visualization tool to explore our data.

## Loading up with Docker

Instead of setting up these tools individually let's use [Docker](http://www.docker.com/?{{page.utm}}) to bring up the official containerized distributions of each of these components in seconds (with functional defaults.) Docker's new `docker-compose` command starts and links multiple containers together based on the configuration in a  `docker-compose.yml` file.

The configuration file below tells Docker to pull down the official images for Elasticsearch and Kibana from [Docker Hub](http://www.dockerhub.com/?{{page.utm}}), set up [a custom configuration file](https://github.com/sandeep/photosearch/blob/master/data/elasticsearch.yml/?{{page.utm}}) and connect the Kibana container to the ElasticSearch container. 

<script src="https://gist.github.com/sandeep/cc714daace5fe848b461.js"></script>

[You can clone this repo to get started on the photo search project.](https://github.com/sandeep/photosearch/?{{page.utm}})

## Start Your (search) Engines 

From the project directory simply issue `docker-compose up` and watch docker create your search engine. (You can use docker-machine on OSX if you need a [docker host.](https://docs.docker.com/machine/install/?{{page.utm}}))

<figure>
  <img src="/images/elasticphotos/docker-compose.gif">
  <figcaption>Running docker-compose.</figcaption>
</figure>


If you go to `http://<dockerhost_ip>:9200` a JSON response with the name of the cluster and Elasticsearch version information verifies that Elasticsearch is up and running. 

<figure>
  <img src="/images/elasticphotos/ElasticsearchStart.png">
  <figcaption>Elasticsearch up and running.</figcaption>
</figure>


Verify that Kibana is running and that it can connect to Elasticsearch at `http://<dockerhost_ip>:5601` 

<figure>
  <img src="/images/elasticphotos/Kibana_Start.png">
  <figcaption>Kibana launch screen.</figcaption>
</figure>


# Next Steps

We've created a powerful foundation for search that can both handle large amounts of data and be scaled out to service a high volume of requests.

[In Part 2, we will extract data from our images and add them to our search index.](http:///blog.sandeepchivukula.com/posts/2016/03/07/photo-search-2/?{{page.utm}})

PS - You can also check out [Part 3, for the AngularJS front end for our search engine.](http:///blog.sandeepchivukula.com/posts/2016/03/07/photo-search-3/?{{page.utm}})
