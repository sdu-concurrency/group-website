---
layout: default
---

<article id="main"><header class="major container" markdown="1">

## Seminars and Visitors

</header><section class="wrapper style4 card container"><div class="content"><section markdown="1">

The {{ site.group_name }} group organises weekly public seminars with the aim of presenting and discussing ongoing research. Seminars are mainly around (but not limited to) the domains of concurrency, logic, programming languages, type theory, proofs, and software engineering.

Unless differently indicated, {{ site.group_short }} seminars are held every Friday at 10:30 in [IMADAs møderum](http://vejviser.sdu.dk/opslag?lid=2319), SDU, Odense. The seminar's schedule is managed by [Luís Cruz-Filipe](/people.html#lfc).

## Seminars and Visitors

The calendar below reports on the left the schedule of the {{ site.group_short }} seminars and on the right the researchers that visited {{ site.group_short }} group.

<style>
	.interactive {
		cursor: pointer;
	}
</style>

<div class="row">
<div class="col-6">
	{% for seminar in site.data.seminars %}
	<div class="seminars">
		<div class="font-weight-bold interactive">{{ seminar.title }}</div>
		<span class="small text-muted"><span class="fa fa-user"></span> {{ seminar.speaker }} <br>
		<span class="fa fa-calendar"></span> {{ seminar.date }}</span>
		<div class="abstract small d-none"><hr>{{ seminar.description | markdownify }}</div>
	</div>
	{% endfor %}
</div>
<div class="col-6">
	{% for visitor in site.data.visiting %}
	<div class="visitors">
		<div>{{ visitor.name }}</div>
		<span class="small text-muted">
		{{ visitor.from }} <span class="fa fa-angle-right"></span>
		{{ visitor.to }}</span>
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