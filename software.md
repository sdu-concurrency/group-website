---
layout: default
---

<!-- Main -->
<article id="main">
<header class="major container" markdown="1">

# Software

</header>

<section class="wrapper card style4 container">
{% assign size = site.data.software | size %}
<div class="item-row row">
{% for software in site.data.software %}
{% assign i = forloop.index | modulo: 2 %}

<div class="item mb-4 col-12 col-lg-6">
<div class="media border border-bottom-0 rounded-top">
  <div class="col-4 align-self-center"><img style="padding-top:15px;max-width:100%;height:auto" src="{{ software.logo }}"></div>
  <div class="col-8 media-body">
  <h2>{{ software.name }}</h2>
  <div>{{ software.short-bio }}</div>
<div>
<small><a class="nodec" href="{{ software.website }}"><span class="fa fa-desktop"></span> Website</a></small>
| 
<small><a class="nodec" href="{{ software.github }}"><span class="fab fa-github"></span> Github</a></small>
</div>
</div>
</div>
<div class="border rounded-bottom border-top-0 pt-3 col-12">
  <p style="text-align:justify;" class="hyphenate"><small>{{ software.bio }}</small></p>
<div class="pb-4">
  <small>Keywords:
    {% for tag in software.tags %}
    <a href="/publications/#keyword_{{tag}}" class="nodec badge badge-light">{{ tag | capitalize }}</a>
  {% endfor %}</small>
</div>
</div>
</div>
{% endfor %}
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