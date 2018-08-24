---
layout: default
---

<article id="main"><header class="major container" markdown="1">

## Seminars and Visitors

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
	{% capture this_id %}{{ seminar.date | date: "%y-%m-%d" }}-{{ seminar.title | downcase | replace: " ", "-" | escape }}{% endcapture %}
	<div {% if seminar.seminar %}
		class="seminars"
		{% else %}
		class="mb-3 pl-3 border-left"
		{% endif %}>
		<div
		{% if seminar.seminar %}
		class="font-weight-bold interactive"><a class="float-right small fa fa-link" id="{{this_id}}" href="#{{ this_id }}"></a>
		{% else %}
		class="small">
		{% endif %}
		{% if seminar.seminar %}
		Seminar:
		{% endif%}
		{{ seminar.title }}
		</div>
		<span class="small text-muted"><span class="fa fa-user"></span> {{ seminar.speaker }} <br>
		<span class="fa fa-calendar"></span> {{ seminar.date }}</span>
		{% if seminar.seminar %}
		<div class="abstract small d-none"><hr>{{ seminar.description | markdownify }}</div>
		{% endif %}
	</div>
	{% endfor %}
</div>
<div class="col-6">
	<h3>Visitors</h3>
	{% for visitor in site.data.visiting %}
	<div class="visitors">
		<div class="font-weight-bold interactive">{{ visitor.name }}</div>
		<span class="small text-muted"><span class="fa fa-address-card"></span> {{ visitor.affiliation }}</span>
		<br>
		<span class="small text-muted">
		{{ visitor.from }} <span class="fa fa-angle-right"></span>
		{{ visitor.to }}</span>
		<div class="abstract small d-none"><hr>{{ visitor.description | markdownify }}</div>
	</div>
	{% endfor %}
</div>
</div>
</section></div></section></article>

<script>
	$(document).ready(function() {
		$( ".interactive" ).on( "click", function( e ){
			$( e.target ).parent().find( ".abstract" ).toggleClass( "d-none" );
		});
	});
</script>