---
layout: default
---
<style type="text/css">
  .collapse_icon {
    margin-right : 1ex;
  }
  .collapsed .collapse_icon {
    -webkit-transform: rotate(180deg);
    -moz-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    -o-transform: rotate(180deg);
    transform: rotate(180deg);
  }
</style>
<script type="text/javascript" charset="utf-8">

  var open_tab_imp = function( item, tab ){
    $( '[id*="-item"]')
      .filter("[aria-expanded=true]")
      .filter(":not(" + item + "-item" + ")")
      .each(function(i, e) {
        $( e ).trigger( 'click' );
    });
    // $( tab + "-tab" ).trigger( 'click' );
    tab = tab.substring( 1, tab.length );
    $( "." + tab + "-tab" ).each( function(i, e) {
      $( e ).trigger( 'click' );
    });
    if( $( item + "-item" ).attr( "aria-expanded" ) == "false" ){
      $( item + "-item" ).trigger( 'click' );
    }
    //return false;
  }

  var open_tab = function() {
    item = $( this ).attr( "xlink:href" );
    tab = item.split( "_" )[0];
    open_tab_imp( item, tab );
  };
</script>

<script type="text/javascript" charset="utf-8">
  $( document ).ready( function() {
    $( "svg a" ).each( function( i, el ) {
      $( el ).click( open_tab );
    });
    var hash = window.location.href.substring( window.location.href.indexOf("#") );
    var tab_item = decodeURIComponent( hash );
    var tab = tab_item.split( "_" )[0];
    var item = tab_item;
    open_tab_imp( item, tab );
  });
</script>

<article id="main"><header class="major container" markdown="1">

# Research Areas

</header><section class="wrapper card card-body style4 container"><div class="content"><section markdown="1">
Our research topics span over five different research areas, addressing issues in different societal challenges.

<div class="d-none d-md-block">
<!--
The interrelation between these components is illustrated below.

  <div class="offset-1 col-10 center">{% include research-areas.svg %}</div>
</div>
-->
  <div class="mt-4"></div>

  <div class="d-sm-block d-md-none nav flex-column nav-pills" id="myTab" role="tablist" aria-orientation="vertical">
  {% for item in site.data.research-areas %}
  <a 
  class="{{ item.id }}-tab nav-link {% if forloop.first %}active{% endif %}"
  data-toggle="tab" 
  href="#{{ item.id }}" 
  role="tab" 
  aria-controls="{{ item.id }}" 
  {% if forloop.first %}
    aria-selected="true"
    {% else %}
    aria-selected="false"
  {% endif %}
  >{{ item.title }}</a>
  {% endfor %}
  </div>

  <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
    {% for item in site.data.research-areas %}
    <li class="d-none d-md-block nav-item">
      <a class="{{ item.id }}-tab reset nav-link {% if forloop.first %}active{% endif %}" data-toggle="tab" href="#{{ item.id }}"
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
    <div class="pl-4 border-dark">
      <a class="nodec reset" data-toggle="collapse" href="#{{ item.id }}_{{ element.id }}" aria-expanded="true" id="{{ item.id }}_{{ element.id }}-item" aria-controls="{{ item.id }}_{{ element.id }}">
        <h5 class="card-title "><span class="collapse_icon fas fa-angle-up"></span>{{ element.title }}</h5></a>
        <div class="collapse show" id="{{ item.id }}_{{ element.id }}">
          <div class="card-body">
            <p class="card-text">{{ element.description }}</p>
          </div>
        </div>
      </div>
      {% endfor %}
    </div>
    {% endfor %}
  </div>

</section></div></section></article>