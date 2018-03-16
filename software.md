---
layout: default
---

<!-- Main -->
<article id="main">
  <style type="text/css">
    .topic {
      .border-right: 1px lightgrey solid;
    }
  </style>

<header class="major container" markdown="1">

## Software
A descriptive sentence.

</header>

<section class="wrapper style4 container">

<div class="row">
{% for software in site.data.software %}

<div class="6u">
<div class="row">
<div class="5u align-middle">
<img class="img-thumbnail" src="{{ software.logo }}" alt="">
</div>
<div class="7u">
<div class="row">
<div class="12u"><strong>{{ software.name }}</strong></div>
<div class="12u">{{ software.short-bio }}</div>
<div class="6u">
    <a href="{{ software.website }}"><span class="icon fa-desktop"></span> Website</a>
</div>
<div class="6u">
    <a href="{{ software.github }}"><span class="icon fa-graduation-cap"></span> Github</a>
</div>
</div>
</div>
</div>
<div class="12u">
<h4>Description</h4>
<p><small>{{ software.bio }}</small></p>
</div>
<div class="12u">
  <small>Keywords:
{% for tag in software.tags %}
<a href="/publications/#keyword_{{tag}}" class="nodec badge badge-light">{{ tag }}</a>
{% endfor %}</small>
</div>
</div>
{% endfor %}
</div>

</section>

</article>
