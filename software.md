---
layout: default
---

<!-- Main -->
<article id="main">
  <style type="text/css">
    .software_row {
      display: flex;
    }
    
    .software {
      flex: 1; /* additionally, equal width */
      padding: 1em;
    }
    
    .software+.software {
      border-left: 1px solid #dee2e6;
    }
  </style>

<header class="major container" markdown="1">

## Software

</header>

<section class="wrapper card style3 container">
{% assign size = site.data.software | size %}
<div class="software_row row">
{% for software in site.data.software %}
{% assign i = forloop.index | modulo: 2 %}

<div class="software 6u">
<div class="media">
<img class="4u align-self-center" src="{{ software.logo }}">
<div class="-1u media-body">
<h5>{{ software.name }}</h5>
<div>{{ software.short-bio }}</div>
<div class="12u">
<small><a class="nodec" href="{{ software.website }}"><span class="fa fa-desktop"></span> Website</a></small>
 | 
<small><a class="nodec" href="{{ software.github }}"><span class="fab fa-github"></span> Github</a></small>
</div>
</div>
</div>

  {% if i == 0 %}
<div style="margin-top:2em;" class="12u">
  {% else %}
<div style="margin-top:2em;" class="11u">
  {% endif %}
<p style="text-align:justify;" class="hyphenate"><small>{{ software.bio }}</small></p>
</div>
<div class="12u">
  <small>Keywords:
{% for tag in software.tags %}
<a href="/publications/#keyword_{{tag}}" class="nodec badge badge-light">{{ tag }}</a>
{% endfor %}</small>
</div>
</div>
{% if forloop.index < size %}
  {% if i == 0 %}
    </div><hr><div class="software_row row">
  {% endif %}
{% else %}
  </div>
{% endif %}
{% endfor %}
</section>

</article>
