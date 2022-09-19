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

At the graduate level, we coordinate a course package on <i>Cybersecurity and
Cloud Computing</i> within the Master programme in Computer Science at SDU, which includes 7 courses (55 ECTS). It covers the theoretical and practical
aspects of designing concurrent and distributed systems, specifying and
validating their properties; and the fundamentals of cybersecurity and
cryptography.

We also collaborate on the package on <i>Data Science and Artificial
Intelligence</i> with 2 courses (20 ECTS) on optimization and knowledge
representation.

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
