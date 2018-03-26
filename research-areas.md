---
layout: default
---

<script type="text/javascript" charset="utf-8">
  var open_tab = function() {
    item = $( this ).attr( "xlink:href" );
    tab = item.split( "_" )[0];
    console.log( tab );
    console.log( item );
    $( tab + "-tab" ).trigger( 'click' );
    $( item + "-item" ).trigger( 'click' );
    return false;
  };
</script>

<article id="main"><header class="major container" markdown="1">

## Research Areas

Achieving challenging research visions demands expertise in many research fields. Our group fosters collaborations among researchers with varied backgrounds. A positive feedback loop where practical problems inspire theoretical investigation and where formal solutions are applied to solve real-world challenges. 

</header><section class="wrapper card card-body style4 container"><div class="content"><section markdown="1">

  In the table below, we summarise in the top-most row the main research challenges targeted by our group, while in the left-most column we list our main research areas. In the other cells we report the keywords corresponding to the intersection of an area and a research topic. 

  <div class="-1u 10u center">{% include research-areas.svg %}</div>

  <div class="mt-4"></div>

  <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
    {% for item in site.data.research-areas %}
    <li class="nav-item">
      <a class="reset nav-link {% if forloop.first %}active{% endif %}" 
      id="{{ item.id }}-tab" data-toggle="tab" href="#{{ item.id }}" 
      role="tab" aria-controls="{{ item.id }}" 
      {% if forloop.first %}
      aria-selected="true"
      {% else %}
      aria-selected="false"
      {% endif %}
      >{{ item.title }}</a>
    </li>
    {% endfor %}
  </ul>

  <div class="pt-3 border-top-0 card tab-content" id="myTabContent">
    <div class="mt-4"></div>
    {% for item in site.data.research-areas %}
    <div class="tab-pane fade{% if forloop.first %}show active{% endif %}" 
    id="{{ item.id }}" role="tabpanel" aria-labelledby="{{ item.id }}-tab">
    {% for element in item.elements %}
    <div class="pl-4 pb-4 border-dark">
      <a class="nodec reset" data-toggle="collapse" href="#{{ item.id }}_{{ element.id }}" aria-expanded="false" id="{{ item.id }}_{{ element.id }}-item" aria-controls="{{ item.id }}_{{ element.id }}">
        <h5 class="card-title">{{ element.title }}</h5></a>
        <div class="collapse" id="{{ item.id }}_{{ element.id }}">
          <div class="card-body">
            <p class="card-text"><small>{{ element.description }}</small></p>
          </div>
        </div>
      </div>
      {% endfor %}
    </div>
    {% endfor %}
  </div>

</section></div></section></article>

<script type="text/javascript" charset="utf-8">
  $( document ).ready( function() {
    $( "svg a" ).each( function( i, el ) {
      $( el ).click( open_tab );
    });
  });
</script>