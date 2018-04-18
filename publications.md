---
layout: default
---
<script src="/js/publications.js" type="text/javascript" charset="utf-8"></script>
<style>
.paper-title{
	font-weight: 500;
}
.paper {
	font-size: 11pt;
	line-height: 1.4;
	list-style: none;
}

ul {
	margin-left: -2em;
}
</style>

{% assign view-download = "<div> Export this view as BibTex: <button class='download-bibtex btn btn-sm btn-light'><span class='fa fa-download'></span> Download</button> <button class='copy-bibtex btn btn-sm btn-light'><span class='fa fa-clipboard-list'></span> Copy</button></div>" %}

<!-- Main -->
<article id="main">

<header class="major container" markdown="1">

# Publications

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
				<div class="12u"><div>Filter by author:</div>
				<span class="filters" >
					{{ data | collectAuthors }}
				</span></div>
				<hr>
				<div class="12u">
					<div>Filter by publication type:</div>
				<span class="filters" >
					{{ data | collectTypes }}
				</span></div>
				<hr>
				<div class="12u">
				Display: <input id="display_papers" type="checkbox" checked data-toggle="toggle" data-on="All papers " data-off="{{ site.group_short }} only" data-onstyle="info" data-offstyle="primary" data-size="small">
		 	 </div>
		 	</div>
		 </div>
	 	 <hr>
		 {{ view-download }}
	</section>


	<section class="wrapper card style4 container">
		<div class="content">
			<div id="papers">
				{% for item in site.data.papers %}

				<div class="pub-year">
					<div style="margin-top: -20px; padding-bottom: 1em;"><span style="font-size: 1.5em; background-color: white; padding-left: 6px; padding-right: 6px;">{{ item.year }}</span></div>
					<ul>
						{% for paper in item.papers %}
						<li class="paper mb-4">
							<div>
							{% assign id = id | plus: 1 %}
							<div id="paper_{{paper.id}}" class="paper">
							{{ paper.content }}
							</div>
							<div>
							<small><a href="#" class="nodec tags_preview" id="{{ id }}" ><span class="fa fa-tags"></span> tags</a></small>
							| <small><a href="#" class="nodec bibitem_preview" id="{{ id }}" ><span class="fa fa-quote-right"></span> bibitem</a></small>
							| <small><a href="#" class="nodec abstract_preview" id="{{ id }}" ><span class="fa fa-align-left"></span> abstract</a></small>
							{% for link in paper.links %}
							| <small><a class="nodec" href="{{ link.link }}">
								{% assign name = link.name | default: "paper" %}
								{% assign icon = link.icon | default: "fa fa-file-pdf"%}
								<span class="{{icon}}"></span> {{ name }}</a></small>
							{% endfor%}
							</div>
							</div>
							{% assign g_size = paper.grants | size %}
							{% if g_size > 0 %}
							<div><small><strong>Supporting Grants</strong>: 
							{% for grant in paper.grants %}
							<a class="nodec" href="/grants.html#{{grant}}"><span class="badge badge-info">{{ grant }}</span></a>
							{% endfor%}
							</small></div>
							{% endif%}
							<div style="display: none;" class="card" id="tags_content_{{ id }}">
								<div class="card-body">
									<ul style="margin:0">
										<li><small><strong>Publication type:</strong> <a href="#" class="nodec tags-item type">{{ paper.type }}</a></small></li>
										<li><small><strong>Keywords:</strong>
											{% for tag in paper.tags %}
												<a href="#" class="nodec tags-item keyword">{{ tag }}</a>;
											{% endfor %}</small></li>
										<li><small><strong>{{ site.group_short }} Authors:</strong>
											{% for author in paper.authors %}
											<a href="#" class="nodec tags-item author">{{ author }}</a>;
											{% endfor %}</small></li>
										</ul></div></div>
							<div style="display: none;" class="card" id="abstract_content_{{ id }}">
								<div style="background-color: #dceaff;" class="card-body">{{ paper.abstract }}</div>
							</div>
							<div style="display: none;" class="card" id="bibitem_content_{{ id }}">
								{% assign bibitem = paper.bibitem | formatBibitem %}
								<div style="background-color: #ffffe0;" class="card-body bibitem_content"><pre><code>{{ bibitem }}</code></pre></div>
							</div>
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
	
	<section class="wrapper card style4 container">
	{{ view-download }}
	</section>

</article>