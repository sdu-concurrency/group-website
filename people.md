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

## People

</header>

<section class="wrapper card style4 container">

<div class="row">
{% for person in site.data.people %}

<div class="6u">
<div class="row">
<div class="5u">
<img style="max-height: 10em;" class="img-thumbnail" src="{{person.photo}}" alt="">
</div>
<div class="7u">
<div class="row">
<div id="{{person.id}}" class="12u"><strong>{{ person.name }}</strong></div>
<div class="12u">{{ person.role }}</div>
{%if person.website %}
<div class="6u">
    <small><a class="nodec" href="{{ person.website }}"><span class="fa fa-desktop"></span> Website</a></small>
</div>
{% endif %}
{%if person.email %}
<div class="6u">
    <small><a class="nodec" href="mailto:{{ person.email }}"><span class="fas fa-envelope"></span> E-mail</a></small>
</div>
{% endif %}
{%if person.phone %}
<div class="6u">
    <small><a class="nodec" href="tel:{{ person.phone }}"><span class="fas fa-phone"></span> {{ person.phone }}</a></small>
</div>
{% endif %}
<div class="6u">
    <small><a class="nodec" href="/publications#author_{{ person.name }}"><span class="fa fa-list-ul"></span> {{ site.group_short }} Pubs</a></small>
</div>
{%if person.orcid %}
<div class="6u">
    <small><a class="nodec" href="https://orcid.org/{{ person.orcid }}"><span class="ai ai-orcid"></span> ORCID</a></small>
</div>
{% endif %}
{%if person.dblp %}
<div class="6u">
    <small><a class="nodec" href="https://dblp.uni-trier.de/pers/hd/{{ person.dblp }}"><span class="ai ai-dblp"></span> DBLP</a></small>
</div>
{% endif %}
{%if person.google_scholar %}
<div class="6u">
    <small><a class="nodec" href="https://scholar.google.com/citations?user={{ person.google_scholar }}"><span class="ai ai-google-scholar"></span> Scholar</a></small>
</div>
{% endif %}
{%if person.github %}
<div class="6u">
    <small><a class="nodec" href="https://github.com/{{ person.github }}"><span class="icon fa-github"></span> Github</a></small>
</div>
{% endif %}
</div>
</div>
</div>
<div style="margin-top:1em;" class="-1u 9u">
<p style="text-align: justify;" class="hyphenate"><small>{{ person.bio }}</small></p>
</div>
<div style="margin-top:-1em; margin-bottom:2em;" class="12u">
  <small>Research Topics:
{% for topic in person.research_topics %}
<a class="nodec" href="/publications/#keyword_{{topic}}" class="nodec badge badge-light">{{ topic }}</a>
{% endfor %}</small>
</div>
</div>
{% assign index = forloop.index | modulo: 2 %}
{% if index == 0 %}
</div><div class="row">
{% endif %}
{% endfor %}
</div>

</section>

</article>
