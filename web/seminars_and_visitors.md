---
layout: default
---

<article id="main"><header class="major container" markdown="1">

# Seminars & Visitors

</header><section class="wrapper style4 card container"><div class="content"><section markdown="1">

The {{ site.group_name }} group organises weekly meetings, frequently in the form of public seminars, with the aim of presenting and discussing ongoing research. Seminars are mainly in the domain (but not limited to) concurrency, logic, programming languages, type theory, proofs, and software engineering.

Unless differently indicated, {{ site.group_short }} seminars are held every Friday at 10:30 in [IMADAs møderum](http://vejviser.sdu.dk/opslag?lid=2319), SDU, Odense. The seminars' schedule is managed by [Luís Cruz-Filipe](/people.html#lfc) and is also available as an [ics feed](/calendars/seminars.ics).

The calendar below reports on the left the schedule of the {{ site.group_short }} seminars and on the right the researchers that visited {{ site.group_short }} group.

<style>
	.interactive {cursor: pointer;}
	.tag {white-space: nowrap; padding-right:1ex;}
</style>

<div class="row">
<div class="col-md-6 col-xs-12 order-md-2">
	<h2>Visitors</h2>
	{% for visitor in site.data.visiting %}
	{% capture this_id %}{{ visitor.from | date: "%y-%m-%d" }}-{{ visitor.name | downcase | replace: " ", "-" | escape }}{% endcapture %}
	<div class="visitors" style="overflow:auto">
		{% if visitor.picture -%}
			<img class="img-thumbnail float-sm-right" style="max-height: 6em; max-width: 7em;" src="{{visitor.picture}}">
		{%- endif %}
		<div class="font-weight-bold {% if visitor.description %}interactive{% endif %}">{{ visitor.name }}</div>
		<div class="small text-muted">
		<span class="fa fa-address-card"></span> {{ visitor.affiliation }} <br>
			<span class="fa fa-calendar"></span>
		{%- if visitor.from != visitor.to %}
			{%- capture fromDate %}{{ visitor.from | date: "%d %b" }}{% endcapture %}
			{%- assign vf = visitor.from | date: "%Y" %}
			{%- assign vt = visitor.to 	| date: "%Y" %}
			{%- if vf != vt %}{% capture fromDate %}{{ fromDate }} {{ visitor.from | date: "%Y" }}{% endcapture %}{% endif %}
			{{ fromDate }} <span class="fa fa-angle-right"></span>
		{%- endif %}
		{{ visitor.to | date: "%d %b %Y"}}
		{%- if visitor.office %}
		<span class="tag">
			<span class="fa fa-map-marker-alt"></span>
			{%- if visitor.office.link %}
			<a class="nodec" href="{{ visitor.office.link }}">{{ visitor.office.label }}</a>
			{%- else %}
			{{ visitor.office }}
			{%- endif %}
			</span>
		{%- endif %}
		{%- assign hosts = visitor.hosts | default: visitor.host -%}
		{%- if hosts.size > 0 %}
		<br> 
		<span class="tag">
			<span class="fa fa-user"></span>
			{%- for host in hosts -%}
				{%- assign h = host %}
				{%- for person in site.data.people -%}
					{%- if person.name == host -%}
					{%- capture h %}
				<a class="nodec" href="/people.html#{{ person.id}}">{{ person.name }}</a>
					{%- endcapture -%}
					{%- break %}
					{%- endif %}
				{%- endfor %}
				{{ h }}
				{%- if forloop.rindex > 1 -%}
					, 
				{%- endif -%}
			{%- endfor %}
		</span>
		{%- endif %}
		<br> 
		<span class="tag">
			<span class="fa fa-link"></span>
			<a class="nodec" id="{{this_id}}" href="#{{ this_id }}">Permalink</a>
		</span>
		</div>
		{% if visitor.description -%}
		<div class="abstract small d-none"><hr>{{ visitor.description | markdownify }}</div>
		{%- endif %}
	</div>
	{% endfor %}
</div>
<div class="col-md-6 order-md-1 col-xs-12">
	<h2>Seminars</h2>
	{% for seminar in site.data.seminars %}
	{% capture this_id %}{{ seminar.date | date: "%y-%m-%d" }}-{{ seminar.title | handleize }}{% endcapture %}
	<div class="seminars">
		<div class="font-weight-bold interactive">{{ seminar.title }}</div>
		<div class="small text-muted">
		{%- if seminar.speaker.website %}
			{%- capture speaker %}<a class="nodec" href="{{seminar.speaker.website}}">{{ seminar.speaker.name }}</a>{% endcapture %}
		{%- else %}
			{%- assign speaker = seminar.speaker.name %}
		{%- endif %}
		{%- for person in site.data.people %}
			{%- if person.name == seminar.speaker.name or person.id == seminar.speaker.id %}
			{%- capture speaker %}<a class="nodec" href="/people.html#{{ person.id}}">{{ person.name }}</a>{% endcapture %}
			{%- break %}
			{%- endif %}
		{%- endfor %}
		<span class="tag">
		<span class="fa fa-user"></span> {{ speaker }} 
		</span><br>
		{% if seminar.speaker.affiliation %}
		<span class="fa fa-address-card"></span> 
		{{ seminar.speaker.affiliation }} 
		<br>
		{% endif %}
		<span class="tag">
			<span class="fa fa-calendar"></span>
			<a class="nodec" href="/calendars/seminars.ics">{{ seminar.date | date: "%a %d %b %Y at %H:%M"}}</a>
		</span>
		<span class="tag">
			<span class="fa fa-map-marker-alt"></span>
			{%- if seminar.place.link %}
			<a class="nodec" href="{{ seminar.place.link }}">{{ seminar.place.label }}</a>
			{%- else %}
			{{ seminar.place }}
			{%- endif %}
		</span>
		<span class="tag">
			<span class="fa fa-align-left"></span>
			<a class="interactive" href="#">Abstract</a>
		</span>
		<span class="tag">
			<span class="fa fa-link"></span>
			<a class="nodec" id="{{this_id}}" href="#{{ this_id }}">Permalink</a>
		</span>
		</div>
		<div class="abstract small d-none"><hr>{{ seminar.description | markdownify }}</div> 
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