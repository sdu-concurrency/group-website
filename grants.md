---
layout: default
---

<style>.divider {
    border-left: 1px solid #dee2e6;
  }
</style>

<!-- Main -->
<article id="main">
<header class="major container" markdown="1">

# Grants

</header>

<section class="wrapper card style4 container">

<div class="item-row row">
{% assign size = site.data.grants | size %}
{% for grant in site.data.grants %}
{% assign i = forloop.index | modulo: 2 %}
<div class="item col-sm-12 col-lg-6">
<h2 id="{{ grant.id }}">{{ grant.title }}</h2>
<ul>
<li><strong>Duration</strong>: from {{ grant.period.start }} to {{ grant.period.end }}</li>
{% if grant.website %}
<li><strong>Website</strong>: <a href="{{ grant.website }}" title="">{{ grant.website}}</a></li>
{% endif %}
{% if grant.number %}
<li><strong>Grant number</strong>: {{ grant.number }}</li>
{% endif %}
<li><strong>Foundation</strong>: {{ grant.foundation }}</li>
<li><strong>Amount</strong>: {{ grant.amount }}</li>
</ul>
<h3>Members</h3>
<div class="container">
<div class="row">
{% for participant in grant.participants %}
{% assign j = forloop.index | modulo: 2 %}
<div class="col-sm-12 col-lg-6">
<span class="border p-2 d-inline-block rounded">
<table>
  <tbody>
    <tr>
      <td style="width:2em;"><span class="fa fa-user"></span> </td>
      <td><small>{{ participant.name }}</small></td>
    </tr>
    {% if participant.affiliation %}
    <tr>
      <td><span class="fa fa-university"></span> </td>
      <td><small>{{ participant.affiliation }}</small></td>
    </tr>
    {% endif %}
    <tr>
      <td><span class="fa fa-list-ul"></span> </td>
      <td><small>{{ participant.role }}</small></td>
    </tr>
  </tbody>
</table>
</span>
</div>
{% if j == 0 %}</div><div class="row">{% endif %}
{% endfor %}
</div>
</div>
</div>
{% if i == 0 %}
</div>
{% if forloop.index < size %}<hr>{% endif %}
<div class="item-row row">
{% else %}
{% if forloop.index < size %}
<div class="col-sm-12 d-lg-none"><hr></div>
{% endif %}
{% endif %}
{% endfor %}
</div>

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
