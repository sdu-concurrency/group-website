---
layout: default
---

<!-- Main -->
<article id="main">
  <style type="text/css">
    .grants_row {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
    }
    .grant{
      display: flex;
      flex-direction: column;
    }
    .grant+.grant {
      border-left: 1px solid #dee2e6;
    }
  </style>

<header class="major container" markdown="1">

## Grants
A descriptive sentence.

</header>

<section class="wrapper card style4 container">

<div class="row">
{% assign size = site.data.grants | size %}
{% for grant in site.data.grants %}
{% assign i = forloop.index | modulo: 2 %}
<div class="grant 6u">
<h2 id="{{ grant.id }}">{{ grant.title }}</h2>
<ul>
<li><strong>Duration</strong>: from {{ grant.period.start }} to {{ grant.period.end }}</li>
<li><strong>Website</strong>: <a href="{{ grant.website }}" title="">{{ grant.website}}</a></li>
<li><strong>Grant number</strong>: {{ grant.number }}</li>
<li><strong>Foundation</strong>: {{ grant.foundation }}</li>
<li><strong>Amount</strong>: {{ grant.amount }}</li>
</ul>
<h3>Members</h3>
<div 
  {% if i == 1 %} 
  style="margin-left: -11%; margin-right: 11%;"
  {% endif %} 
class="row">
{% for participant in grant.participants %}
{% assign j = forloop.index | modulo: 2 %}
<div class="6u">
<span class="border p-2 d-inline-block rounded">
<table>
  <tbody>
    <tr>
      <td style="width:2em;"><span class="fa fa-user"></span> </td>
      <td><small>{{ participant.name }}</small></td>
    </tr>
    <tr>
      <td><span class="fa fa-university"></span> </td>
      <td><small>{{ participant.affiliation }}</small></td>
    </tr>
    <tr>
      <td><span class="fa fa-list-ul"></span> </td>
      <td><small>{{ participant.role }}</small></td>
    </tr>
  </tbody>
</table>
</span>
</div>
{% if j == 0 %}</div><div 
{% if i == 1 %} 
style="margin-left: -11%; margin-right: 11%;" 
{% endif %} 
class="row">{% endif %}
{% endfor %}
</div>
</div>
{% if i == 0 %}
</div>
{% if forloop.index < size %}<hr>{% endif %}
<div class="row">
{% endif %}
{% endfor %}
</div>

</section>

</article>
