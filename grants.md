---
layout: default
---

<!-- Main -->
<article id="main">
  <style type="text/css">
    .grant+.grant {
      border-left: 1px solid #dee2e6;
    }
  </style>

<header class="major container" markdown="1">

## Grants
A descriptive sentence.

</header>

<section class="wrapper style4 container">

<div class="row">
{% assign size = site.data.grants | size %}
{% for grant in site.data.grants %}
{% assign i = forloop.index | modulo: 2 %}
<div class="grant 6u">
<h2>{{ grant.title }}</h2>
<ul>
<li><strong>Duration</strong>: from {{ grant.period.start }} to {{ grant.period.end }}</li>
<li><strong>Website</strong>: <a href="{{ grant.website }}" title="">{{ grant.website}}</a></li>
<li><strong>Grant number</strong>: {{ grant.number }}</li>
<li><strong>Foundation</strong>: {{ grant.foundation }}</li>
</ul>
<h3>Members</h3>
<div class="row">
{% for participant in grant.participants %}
{% assign j = forloop.index | modulo: 2 %}
<div class="6u">
<div class="row">
<div class="1u"><small><span class="icon fa-user"></span></small></div>
<div class="10u"><small>{{ participant.name }}</small></div>
<div class="1u"><small><span class="icon fa-university"></span></small></div>
<div class="10u"><small>{{ participant.affiliation }}</small></div>
<div class="1u"><small><span class="icon fa-university"></span></small></div>
<div class="10u"><small>{{ participant.role }}</small></div>
</div>
</div>
{% if j == 0 %}</div><div class="row">{% endif %}
{% endfor %}
</div>
</div>
{% if i == 0 %}
</div>{% if forloop.index < size %}<hr>{% endif %}<div class="row">
{% endif %}
{% endfor %}
</div>

</section>

</article>
