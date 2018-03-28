---
layout: default
---

<article id="main"><header class="major container" markdown="1">

## Events

</header><section class="wrapper style4 container"><div class="content"><section markdown="1">

<ul class="posts">
  {% for post in site.posts %}
<li class="wrapper style1">
<h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
<div class="card">
{{ post.excerpt }}
<div>
<a class="float-right nodec" href="{{ post.url }}">
<button class="btn btn-sm btn-primary">Read more</button>
</a>
</div>
</div>
<section class="special">
<ul class="buttons">
<li></li>
</ul>
</section>
</li>
{% endfor %}
</ul>
</section></div></section></article>