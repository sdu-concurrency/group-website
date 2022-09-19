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
{% assign sorted_software = site.data.software | sort:"name" %}

{% comment %}
for software in site.data.software
{% endcomment %}
{% for software in sorted_software %}
{% assign i = forloop.index | modulo: 2 %}

<div class="item mb-4 col-12 col-lg-6">
<div class="media border border-bottom-0 rounded-top">
{% if software.logo %}
  <div class="col-4 align-self-center"><img style="padding-top:15px;max-width:100%;height:auto" src="{{ software.logo }}"></div>
  <div class="col-8 media-body">
  <h2 id="{{ software.name | handleize }}">{{ software.name }}</h2>
  <div>{{ software.short-bio }}</div>
{% else %}
  <div class="col-12 media-body">
  <h2 id="{{ software.name | handleize }}">{{ software.name }}</h2>
  <div>{{ software.short-bio }}</div>
{% endif %}
<div>
{% if software.website %}
<small><a class="nodec" href="{{ software.website }}"><span class="fa fa-desktop"></span> Website</a></small> |
{% endif %}
{% if software.repository %}
  <small><a class="nodec" href="{{ software.repository.link | default: software.repository }}"><span class="{{ software.repository.icon | default: "fas fa-code-branch" }}"></span> Repository</a></small> |
{% endif %}
<small><a class="nodec" href="#{{ software.name | handleize }}"><span class="fa fa-link"></span> Permalink</a></small>
</div>
</div>
</div>
<div class="border rounded-bottom border-top-0 pt-3 col-12">
  <p style="text-align:justify;" class="hyphenate">{{ software.bio }}</p>
<div class="pb-4">
  <small>Keywords:
    {% for tag in software.tags %}
    <a href="/publications.html#keyword_{{tag}}" class="nodec badge badge-light">{{ tag | capitalize }}</a>
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
