---
layout: post
title: Three reasons to use static sites and get down to business
excerpt: "Static sites - setup very sophisticated sites, focus on content and scale as needed."
category: posts
tags: [Static Sites, Jekyll]
image:
  feature: static-sites.jpg
  creditlink: https://www.flickr.com/photos/mushman1970/6651066661/
  credit: Taehyun Kim
comments: true
share: true
ads: false
crosspost_to_medium: true

utm: utm_source=sandeepchivukula.com&utm_medium=blog&utm_campaign=staticsited
---

Setting up a sophisticated blog meant rolling and customizing your own wordpress
or drupal installation. Even the hosted versions of these packages require you to
learn the platform before you can blog.

Options like [Medium](https://medium.com/) and [Svbtle](https://svbtle.com/?),
while simplifing the learning curve, have created [another](https://medium.com/writers-on-writing/336300490cbb)
[set of problems](http://blog.spanishcurls.com/the-reasons-why-you-should-not-join-medium?{{page.utm}})
around ownership, branding, and discoverability.

#### Enter Static Sites

Static sites allow for feature rich blogs with high grained control while eliminating complexity.  
They can [be hosted for free on github](https://help.github.com/articles/what-are-github-pages?{{page.utm}}), or for
a few bucks on [AMAZONS3 bucket](http://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html) or [Dropbox.](https://dropbox.com/??{{page.utm}})

I've been using a static site generator called [Jekyll](http://jekyllrb.com/?{{page.utm}}) for the last 2 years
and, as content creator, here are three reasons why you should too:

#### Launch Sophisticated Sites < 10 mins

You can launch a blog using a Jekyll and Github Pages in under 10 mins.
The longest part of this process is you figuring out which of the many
Jekyll themes you want to use.

This theme, *so-simple*, for example gives you a responsive design (so it looks
good on mobile), SEO Optimization, social sharing, google analytics, disqus and
a fine looking design right out of the box.

Upgrading to the latest fancy theme is simple - just copy the `_posts` and `images`
directories to your new theme to port your content. If you want to tinker with
the code simply clone into [a Nitrous.IO box](https://www.nitrous.io/?).
and edit to your heart's desire.

#### Focus On Content

Your goal as a content creator is to get your message to your audience.

Static site generators like Jekyll let you get to the meat faster by allowing
you focus on the task at hand - _creating and publishing content._ Write your
content using simple text files. Style it quickly with [Markdown](http://daringfireball.net/projects/markdown/?{{page.utm}}).

You can write your posts from any text editor or edit in a browser within the
GitHub repo, or through a third party like [Prose](http://prose.io/?{{page.utm}}).

#### Scale without Headaches

If your blog goes "Big Time (TM)", scaling a static site is simple - Do nothing.
If you're on Github you get autoscaling for free. On S3 you simply have to pay
for the added bandwidth costs at the end of the month
(on the order cents vs. 100s of dollars to scale servers.)

Need back ups? Simply copy text files to you backup location.
This Blog, for example, has a revision control on Github and is backed up to
Dropbox without my intervention.


#### Roll one out today!

If Jekyll is not your thing, you should [check out Punch](http://laktek.github.io/punch/?{{page.utm}}) from my
[Nitrous.IO](https://www.nitrous.io/?) colleague [Lakshan Perera.](http://www.laktek.com/?{{page.utm}})

If you're looking to create more complex static websites beyond blogs you should
checkout [DIVSHOT](https://www.divshot.com/?{{page.utm}}) from [Michael Bleigh](http://www.mbleigh.com/?{{page.utm}}) and team.

If you need help getting one setup feel free to [reach out to me on twitter](http://twitter.com/_sandeep?{{page.utm}})
