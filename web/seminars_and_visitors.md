---
layout: default
---

<article id="main"><header class="major container" markdown="1">

# Seminars & Visitors

</header><section class="wrapper style4 card container"><div class="content"><section markdown="1">

The {{ site.group_name }} group organises weekly meetings, frequently in the form of public seminars, with the aim of presenting and discussing ongoing research. Seminars are mainly in the domain (but not limited to) concurrency, logic, programming languages, type theory, proofs, and software engineering.

Unless differently indicated, {{ site.group_short }} seminars are held every Friday at 10:30 in [IMADAs møderum](http://vejviser.sdu.dk/opslag?lid=2319), SDU, Odense. The seminars' schedule is managed by [Luís Cruz-Filipe](/people.html#lfc).

The calendar below reports on the left the schedule of the {{ site.group_short }} seminars and on the right the researchers that visited {{ site.group_short }} group.

<style>
	.interactive {
		cursor: pointer;
	}
</style>

<div class="row">
<div class="col-6">
	<h3>Seminars</h3>
	{% for seminar in site.data.seminars %}
	{% capture this_id %}{{ seminar.date | date: "%y-%m-%d" }}-{{ seminar.title | handleize }}{% endcapture %}
	<div class="seminars">
		<a class="nodec float-right small fa fa-link" id="{{this_id}}" href="#{{ this_id }}"></a>
		<div class="font-weight-bold interactive">{{ seminar.title }}</div>
		<span class="small text-muted">
		{% assign speaker = seminar.speaker %}
		{% for person in site.data.people %}
			{% if person.name == seminar.speaker or person.id == seminar.speaker %}
			{% capture speaker %}<a class="nodec" href="/people.html#{{ person.id}}">{{ person.name }}</a>{% endcapture %}
			{% break %}
			{% endif %}
		{% endfor %}
		<span class="fa fa-user"></span> {{ speaker }} <br>
		{% if seminar.affiliation %}
		<span class="fa fa-address-card"></span> {{ seminar.affiliation }} <br>
		{% endif %}
		<span class="fa fa-calendar"></span> {{ seminar.date | date: "%a %d %b %Y at %H:%M"}} |
		<span class="fa fa-map-marker-alt"></span> 
		{% if seminar.place_link %}
		<a class="nodec" href="{{ seminar.place_link }}">{{ seminar.place }}</a>
		{% else %}
		{{ seminar.place }}
		{% endif %} |
		<span class="fa fa-align-left"></span>
		<a class="interactive" href="#">abstract</a>
		</span>
		<div class="abstract small d-none"><hr>{{ seminar.description | markdownify }}</div>
	</div>
	{% endfor %}
</div>
<div class="col-6">
	<h3>Visitors</h3>
	{% for visitor in site.data.visiting %}
	{% capture this_id %}{{ visitor.from | date: "%y-%m-%d" }}-{{ visitor.name | downcase | replace: " ", "-" | escape }}{% endcapture %}
	<div class="visitors">
		<a class="nodec float-right small fa fa-link" id="{{this_id}}" href="#{{ this_id }}"></a>
		<div class="font-weight-bold interactive">{{ visitor.name }}</div>
		<span class="small text-muted"><span class="fa fa-address-card"></span> {{ visitor.affiliation }} <br>
		{% if visitor.host %}
		<span class="fa fa-user"></span>
		{% for person in site.data.people %}
      {% if person.name == visitor.host or person.id == visitor.host %}
      Host: <a class="nodec" href="/people.html#{{ person.id}}">{{ person.name }}</a>
      {% break %}
      {% endif %}
    {% endfor %}
		<br>
		{% endif %}
		<span class="fa fa-calendar"></span>
		{% if visitor.from != visitor.to %}
			{% capture fromDate %}{{ visitor.from | date: "%d %b" }}{% endcapture %}
			{% assign vf = visitor.from | date: "%Y" %}
			{% assign vt = visitor.to 	| date: "%Y" %}
			{% if vf != vt %}{% capture fromDate %}{{ fromDate }} {{ visitor.from | date: "%y" }}{% endcapture %}{% endif %}
		{{ fromDate }} <span class="fa fa-angle-right"></span>
		{% endif %}
		{{ visitor.to | date: "%d %b %Y"}}</span>
		<div class="abstract small d-none"><hr>{{ visitor.description | markdownify }}</div>
	</div>
	{% endfor %}
</div>
</div>
</section></div></section></article>

<script>
	$(document).ready(function() {
		$( ".interactive" ).on( "click", function( e ){
			$( e.target ).parents(".seminars, .visitors").find( ".abstract" ).toggleClass( "d-none" );
			return false;
		});
	});
</script>