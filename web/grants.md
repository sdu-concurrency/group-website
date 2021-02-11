---
layout: default
---

<!-- Main -->
<article id="main">
<header class="major container" markdown="1">

# Grants

</header>

<section class="wrapper card style4 container">

<div class="item-row row">

{% for grant in site.data.grants %}

<div class="item mb-4 col-12 col-lg-6">
<div class="card">
<div class="card-body">
<h2 class="card-title" id="{{ grant.id }}">{{ grant.title }}</h2>

<ul>
<li><strong>Duration</strong>: from {{ grant.period.start }} to {{ grant.period.end }}</li>
{% if grant.website %}
<li><strong>Website</strong>: <a href="{{ grant.website }}" title="">{{ grant.website }}</a></li>
{% endif %}
{% if grant.number %}
<li><strong>Grant number</strong>: {{ grant.number }}</li>
{% endif %}
<li><strong>Foundation</strong>: {{ grant.foundation }}</li>
<li><strong>Amount</strong>: {{ grant.amount }}</li>
</ul>

<h3>Members</h3>
<div class="container">
<div class="inner-item-row row">
{% for participant in grant.participants %}
<div class="inner-item col-12 col-sm-6">
<div class="col-12 p-2 mb-2 d-inline-block">
<table>
  <tbody>
    <tr>
      <td class="pr-2"><span class="fa fa-user"></span> </td>
      <td><small>{{ participant.name }}</small></td>
    </tr>
    {% if participant.affiliation %}
    <tr style="background-color: #d3d3d333;">
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
</div>
</div>
{% endfor %}
</div>
</div>
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
jQuery(document).ready(function($) {
  $('.inner-item-row').masonry({
    itemSelector : '.inner-item'
  });  
});
</script>
