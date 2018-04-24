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

# People

</header>

<section class="wrapper card style4 container">

<div class="row">
{% for person in site.data.people %}

<div class="col-sm-12 col-lg-6">
<div class="row">
<div class="text-center col-sm-5">
<img style="max-height: 8em;" class="img-thumbnail" src="{{person.photo}}" alt="">
</div>
<div class="col-sm-7">
<div class="row">
<div id="{{person.id}}" class="col-sm-12"><strong>{{ person.name }}</strong></div>
<div class="col-sm-12">{{ person.role }}</div>
{%if person.website %}
<div class="col-sm-6">
    <small><a class="nodec" href="{{ person.website }}"><span class="fa fa-desktop"></span> Website</a></small>
</div>
{% endif %}
{%if person.email %}
<div class="col-sm-6">
    <small><a class="nodec" href="mailto:{{ person.email }}"><span class="fas fa-envelope"></span> E-mail</a></small>
</div>
{% endif %}
{%if person.phone %}
<div class="col-sm-6">
    <small><a class="nodec" href="tel:{{ person.phone }}"><span class="fas fa-phone"></span> Phone</a></small>
</div>
{% endif %}
<div class="col-sm-6">
    <small><a class="nodec" href="/publications.html#author_{{ person.name }}"><span class="fa fa-list-ul"></span> {{ site.group_short }} Pubs</a></small>
</div>
{%if person.orcid %}
<div class="col-sm-6">
    <small><a class="nodec" href="https://orcid.org/{{ person.orcid }}"><span class="ai ai-orcid"></span> ORCID</a></small>
</div>
{% endif %}
{%if person.dblp %}
<div class="col-sm-6">
    <small><a class="nodec" href="https://dblp.uni-trier.de/pers/hd/{{ person.dblp }}"><span class="ai ai-dblp"></span> DBLP</a></small>
</div>
{% endif %}
{%if person.google_scholar %}
<div class="col-sm-6">
    <small><a class="nodec" href="https://scholar.google.com/citations?user={{ person.google_scholar }}"><span class="ai ai-google-scholar"></span> Scholar</a></small>
</div>
{% endif %}
{%if person.github %}
<div class="col-sm-6">
    <small><a class="nodec" href="https://github.com/{{ person.github }}"><span class="icon fa-github"></span> Github</a></small>
</div>
{% endif %}
</div>
</div>
</div>
<div style="margin-top:1em;" class="-col-sm-1 col-sm-9">
<p style="text-align: justify;" class="hyphenate"><small>{{ person.bio }}</small></p>
</div>
<div style="margin-top:-1em; margin-bottom:2em;" class="col-sm-12">
  <small>Research Topics:
{% for topic in person.research_topics %}
<a class="nodec" href="/publications/#keyword_{{topic}}" class="nodec badge badge-light">{{ topic | capitalize }}</a>
{% endfor %}</small>
</div>
</div>
{% assign index = forloop.index | modulo: 2 %}
{% if index == 0 %}
</div><div class="row">
{% endif %}
{% endfor %}
</div>

<hr>

<h2 id="career">Open Positions</h2>

<span class="text-muted">No open positions are available at the moment.</span>

</section>

</article>
