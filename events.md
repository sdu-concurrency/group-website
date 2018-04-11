---
layout: default
---

<article id="main"><header class="major container" markdown="1">

# Events

</header>
<section class="wrapper style4">
<div class="container">
<div class="item-row row" markdown="1">
{% for post in site.posts %}
<div class="item col-12 col-lg-6 card border-0">
  <div class="card-body">
  <div class="card-title text-center alert-info rounded-top">
    <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
  </div>
    <div style="margin-top: -1.2em;" class="border border-top-0 text-justify hyphenate">
    <div class="col-12"><div class="pt-4"></div><small>{{ post.excerpt }}</small></div>
    <a class="nodec float-right" href="{{ post.url }}">
    <button class="rounded-0 btn btn-primary">Continue reading <span class="fa fa-arrow-circle-right"></span></button>
    </a>
    <div class="clearfix"></div>
    </div>
  </div>
    <div class="mt-4"></div>
</div>
{% endfor %}
</div>
</div>
</section>
</article>

<script>
jQuery(document).ready(function($) {
  $('.item-row').masonry({
    itemSelector : '.item'
  });  
});
</script>