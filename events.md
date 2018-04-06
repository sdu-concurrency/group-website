---
layout: default
---

<article id="main"><header class="major container" markdown="1">

## Events

</header><section class="wrapper style4"><div class="content"><section markdown="1">

{% for post in site.posts %}
<div class="card wrapper style1">
<div class="card-body">
<h2 class="card-title" ><a href="{{ post.url }}">{{ post.title }}</a></h2>
{{ post.excerpt }}
<a class="float-right nodec" href="{{ post.url }}">
<button class="btn btn-sm btn-primary">Read more</button>
</a>
</div>
</div>
{% endfor %}
</section></div></section></article>