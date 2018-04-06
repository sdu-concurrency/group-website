---
layout: default
---

<!-- Main -->
<article id="main">
  <style type="text/css">
  .divider {
    border-left: 1px solid #dee2e6;
  }
</style>

<header class="major container" markdown="1">

## Software

</header>

<section class="wrapper card style3 container">
  {% assign size = site.data.software | size %}
  <div class="item-row row">
{% for software in site.data.software %}
{% assign i = forloop.index | modulo: 2 %}

<div class="item col-12 col-lg-6">
<div class="media">
  <img class="col-4 align-self-center" src="{{ software.logo }}">
  <div class="media-body">
  <h2>{{ software.name }}</h2>
  <div>{{ software.short-bio }}</div>
<div class="col-12">
<small><a class="nodec" href="{{ software.website }}"><span class="fa fa-desktop"></span> Website</a></small>
| 
<small><a class="nodec" href="{{ software.github }}"><span class="fab fa-github"></span> Github</a></small>
</div>
</div>
</div>
<hr>
<div class="col-12">
  <p style="text-align:justify;" class="hyphenate"><small>{{ software.bio }}</small></p>
</div>
<div class="col-12">
  <small>Keywords:
    {% for tag in software.tags %}
    <a href="/publications/#keyword_{{tag}}" class="nodec badge badge-light">{{ tag | capitalize }}</a>
  {% endfor %}</small>
</div>
</div>
{% if forloop.index < size %}
{% if i == 0 %}
</div><hr><div class="item-row row">
{% else %}
<div class="col-12 d-lg-none"><hr></div>
{% endif %}
{% else %}
</div>
{% endif %}
{% endfor %}
</section>

</article>

<script>
var res = function(){
  $( ".item-row" ).each( function(i, row) {
    if( $( row ).find( ".item + div" ).is(":visible") ){
      $( row ).find( ".item + div + .item" ).removeClass( "divider" );
    } else {
      $( row ).find( ".item + div + .item" ).addClass( "divider" );
    }
  });
}
$( document ).ready( function() {
  res();
  $( window ).resize( res );
});
</script>
