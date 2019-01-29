---
layout: default
---

<article id="main"><header class="major container" markdown="1">

# Education

</header><section class="wrapper card style4 container"><div class="content"><section markdown="1">

As a research group, we are actively involved in teaching within the Computer Science degrees at the University of Southern Denmark.

## Bachelor

At the undergraduate level, we offer courses within the Computer Science bachelor programme in topics directly related to our research (Concurrent Programming, Programming Languages), as well as the general Introduction to Programming course.

## Master Courses

At the graduate level, we offer a course package on <i>Concurrency  and
Logic</i> within the Master programme in Computer Science. This package
includes 4 courses (40 ECTS) and covers the theoretical and practical
aspects of designing concurrent and distributed systems, specifying and
validating their properties.

<!-- ## Talent Fellowship

TBA -->

## Thesis proposals

Below is a list of the topics we offer for MSc and PhD theses.
Many of our proposals can also be developed in the context of company collaborations.
You are welcome to contact us to know more about these opportunities.

### Topics for MSc theses
{% assign mps = site.data.master_projects | size %}

{% if mps < 1 %}
There are no Master projects available at the moment.
{% endif %}

{% assign id = 0 %}
{% for mp in site.data.master_projects %}
{% capture id %}
{% increment id %}
{% endcapture %}

<div class="card mb-4">
    <div style="cursor: pointer;" class="card-header alert-info" data-toggle="collapse" data-target="#{{ id }}" aria-expanded="false" aria-controls="{{ id }}">{{ mp.title }}</div>
  <div class="card-body collapse" id="{{ id }}">
    <div class="mt-0 card-text">
    {% if mp.image %}
      <div class="col-sm-4 col-md-3 col-lg-2 float-left"><img class="mr-3 mb-1 img-fluid" src="{{mp.image}}"></div>
    {% endif %}
    <p class="text-justify hyphenate">{{ mp.description }}</p>
    {% if mp.link %}
    <a class="card-link" href="{{mp.link}}">More information</a>
    {% endif %}
    </div>
    <span>Contact person:
    {% for person in site.data.people %}
      {% if person.name == mp.contact or person.id == mp.contact %}
        <a class="card-link" href="/people.html#{{ person.id}}">{{ person.name }}</a>
      {% break %}
      {% endif %}
    {% endfor %}
    </span>  
    <!--span>Contact person: {{ site.people | where:"item","item.id == mp.contact || item.name == mp.contact" }} </span>  
    <!--span>Contact person: {{ mp.contact }}</span-->
  </div>
</div>

{% endfor %}

### PhD projects

{% assign pps = site.data.phd_project | size %}

If you are interested in doing a PhD in the {{ site.group_name }} group, please contact us directly.

{% for pp in site.data.phd_projects %}
{% capture id %}
{% increment id %}
{% endcapture %}

<div class="card mb-4">
    <div style="cursor: pointer;" class="card-header alert-info" data-toggle="collapse" data-target="#{{ id }}" aria-expanded="false" aria-controls="{{ id }}">{{ pp.title }}</div>
  <div class="card-body collapse" id="{{ id }}">
    <div class="mt-0 card-text">
    {% if pp.image %}
      <div class="col-sm-4 col-md-3 col-lg-2 float-left"><img class="mr-3 mb-1 img-fluid" src="{{pp.image}}"></div>
    {% endif %}
    <p class="text-justify hyphenate">{{ pp.description }}</p>
    {% if pp.link %}
    <a class="card-link" href="{{pp.link}}">More information</a>
    {% endif %}
    </div>  
    <span>Contact person: {{ pp.contact }}</span>
  </div>
</div>

{% endfor %}

</section></div></section></article>
