---
layout: default
---

<article id="main"><header class="major container" markdown="1">

# Communities

</header><section class="wrapper card style4 container"><div class="content"><section markdown="1">

{% assign x = "a"%}

{% graphviz %}
digraph {
  node [shape=circle, style=filled];
  S [fillcolor=green];
  A [fillcolor=yellow];
  B [fillcolor=yellow];
  C [fillcolor=yellow];
  D [shape=doublecircle, fillcolor=green];
  S -> A [label={{x}}];
  S -> B [label=b];
  A -> D [label=c];
  B -> D [label=d];
}
{% endgraphviz %}

</section></div></section></article>