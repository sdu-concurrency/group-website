---
layout: default
---
<script src="/js/publications.js" type="text/javascript" charset="utf-8"></script>
<!-- Main -->
<article id="main">

<header class="major container" markdown="1">

## Publications
A descriptive sentence.

</header>

	<section class="wrapper card style4 container">
	{% assign data = site.data.papers %}
		<!-- Content -->
		<div class="row">
			<div class="6u">
				<div>Filter by keywords:</div>
				<div><span class="filters" >
					{{ data | collectTags }}
				</span></div>
			</div>
			<div class="6u">
				<div>Filter by author:</div>
				<span class="filters" >
					{{ data | collectAuthors }}
				</span>
			</div>
			<div class="12u"><hr></div>
			<div class="6u">
				Display: <input id="display_papers" type="checkbox" checked data-toggle="toggle" data-on="All papers" data-off="PLS only" data-onstyle="info" data-offstyle="primary" data-size="small">
		 	</div>
			<div class="6u">
				<div>Filter by publication type:</div>
				<span class="filters" >
					{{ data | collectTypes }}
				</span>
			</div>
			</div>
	</section>

	<section class="wrapper card style4 container">
		<div class="content">
			<div id="papers">
				{% for item in site.data.papers %}

				<div class="pub-year">
					<div style="margin-top: -20px; padding-bottom: 1em;"><span style="font-size: 1.5em; background-color: white; padding-left: 6px; padding-right: 6px;">{{ item.year }}</span></div>
					<ul>
						{% for paper in item.papers %}
						<li>
							<div>
							{% assign id = id | plus: 1 %}
							{{ paper.content }} 
							| <small>
								<a href="#" class="nodec bibitem_preview" id="{{ id }}" ><span class="bib"></span> bibitem</a></small>
							{% for pdf in paper.pdf %}
							| <small><a class="nodec" href="{{ pdf.link }}"><span class="pdf"></span> 
								{% assign name = pdf.name %}
								{% assign size = name | size %}
								{% if size <= 0 %}
								{% assign name = "paper" %}
								{% endif %}
							{{ name }}</a></small>
							{% endfor%}
							| 
							<small><a href="#" class="nodec abstract_preview" id="{{ id }}" ><span class="fa fa-align-left"></span> abstract</a></small>
							</div>
							{% assign g_size = paper.grants | size %}
							{% if g_size > 0 %}
							<div><small><strong>Supporting Grants</strong>: 
							{% for grant in paper.grants %}
							<a class="nodec" href="/grants.html#{{grant}}"><span class="badge badge-info">{{ grant }}</span></a>
							{% endfor%}
							</small></div>
							{% endif%}
							<div style="display: none;" class="card" id="abstract_content_{{ id }}">
								<div style="background-color: #dceaff;" class="card-body"><small>{{ paper.abstract }}</small></div>
							</div>
							<div style="display: none;" class="card" id="bibitem_content_{{ id }}">
								{% assign bibitem = paper.bibitem | formatBibitem %}
								<div style="background-color: #ffffe0;" class="card-body"><pre><code><small>{{ bibitem }}</small></code></pre></div>
							</div>
							{% for tag in paper.tags %}
							<span style="display: none;" class="badge badge-light">{{ tag }}</span>
							{% endfor %}
							{% for author in paper.authors %}
							<span style="display: none;" class="badge badge-light">{{ author }}</span>
							{% endfor %}
							<span style="display: none;" class="badge badge-light">{{ paper.type }}</span>
							{% if paper.non_group %}
							<span style="display: none;" class="non_group" ></span>
							{% endif %}
							
						</li>
						{% endfor %}

					</ul>
				</div>

				{% endfor %}

			</div>
		</div>
	</section>
</article>