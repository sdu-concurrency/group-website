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

## Talent Fellowship

Do we want to keep this? In case we don't, please remove this section and the related menu item.

## Theses opportunities

### Master projects

{% for mp in site.data.master_projects %}

<div class="card mb-4">
    <div class="card-header alert-info">{{ mp.title }}</div>
  <div class="card-body">
    <p class="small card-text">
    {{ mp.description }}
    </p>  
    {% if mp.link %}
    <span class="small">Please find more details on this project following 
    <a class="card-link" href="{{mp.link}}">this link</a></span>.
    {% endif %}
  </div>
</div>

{% endfor %}

### PhD projects

{% for pp in site.data.phd_projects %}

<div class="card mb-4">
    <div class="card-header alert-success">{{ pp.title }}</div>
  <div class="card-body">
    <p class="small card-text">
    {{ pp.description }}
    </p>  
    {% if pp.link %}
    <span class="small">Please find more details on this project following 
    <a class="card-link" href="{{pp.link}}">this link</a></span>.
    {% endif %}
  </div>
</div>

{% endfor %}

</section></div></section></article>