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
A descriptive sentence.

</header>

<section class="wrapper style4 container">

<div class="row">
{% for person in site.data.people %}

<div class="6u">
<div class="row">
<div class="5u">
<img class="img-thumbnail" src="{{person.photo}}" alt="">
</div>
<div class="7u">
<div class="row">
<div class="12u"><strong>{{ person.name }}</strong></div>
<div class="12u">{{ person.role }}</div>
{%if person.website %}
<div class="6u">
    <a href="{{ person.website }}"><span class="icon fa-desktop"></span> Website</a>
</div>
{% endif %}
{%if person.orcid %}
<div class="6u">
    <a href="{{ person.orcid }}"><span class="icon fa-graduation-cap"></span> ORCID</a>
</div>
{% endif %}
{%if person.dblp %}
<div class="6u">
    <a href="{{ person.dblp }}"><span class="icon fa-list-ul"></span> DBLP</a>
</div>
{% endif %}
{%if person.google_scholar %}
<div class="6u">
    <a href="{{ person.google_scholar }}"><span class="icon fa-google"></span> Scholar</a>
</div>
{% endif %}
{%if person.github %}
<div class="6u">
    <a href="{{ person.github }}"><span class="icon fa-github"></span> Github</a>
</div>
{% endif %}
</div>
</div>
</div>
<div class="12u">
<h4>Short Bio</h4>
<p>{{ person.bio }}</p>
</div>
<div class="12u">
  <small>Research Topics:
{% for topic in person.research_topics %}
<a href="/publications/#keyword_{{topic}}" class="nodec badge badge-light">{{ topic }}</a>
{% endfor %}</small>
</div>
</div>
{% endfor %}
</div>

</section>

</article>
