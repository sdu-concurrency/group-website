---
layout: default
---
<script src="/js/publications.js" type="text/javascript" charset="utf-8"></script>
<style>
.paper-title{
	font-weight: 700;
}
.paper {
	font-size: 11pt;
	line-height: 1.4;
	list-style: none;
}
ul {
	margin-left: -2em;
}
#keyword_filters {
  position: relative;
  overflow: hidden;
}
#keyword_filters.closed {
  position: relative;
  height: 1.5em;
  overflow: hidden;
}
#keyword_filters.closed:after {
  content: "";
  position: absolute;
  z-index: 1;
  bottom: 0;
  left: 0;
  pointer-events: none;
  background-image: linear-gradient(to bottom, rgba(255,255,255,0), rgba(255,255,255, 1) 90%);
  width: 100%;
  height: 1em;
}
#keyword_filters_btn {
	cursor: pointer;
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
		<div>
			<div>
				<span id="paperToggle" data-toggle="tooltip" data-placement="auto" title="" data-original-title="Slide this button to filter the papers below. The default, '{{site.group_short}} only', displays the subset of papers written by the members of {{site.group_short}} since its foundation and within its context. Toggling the button to 'All papers' displays all the papers published by the members, both within and outside of the scope of {{site.group_short}}.">
				All papers or {{ site.group_short }} only?: <input id="display_papers" type="checkbox" data-toggle="toggle" data-on="All papers " data-off="{{ site.group_short }} only" data-onstyle="info" data-offstyle="primary" data-size="small">
		 		</span>
		 	</div>
		</div>
		<hr />
		<script>
			
		</script>
		<div class="row">
			<div>Filter by keyword:</div>
			<div class="col-11 closed" id="keyword_filters">{{ data | collectTags }}</div>
			<div class="col-1"><span onclick="toggleKeywordFilter();" id="keyword_filters_btn" class="text-info fa fa-2x fa-angle-down" aria-hidden="true"></span></div>
		</div>
		<hr />
		<div>
			<div>Filter by author:</div>
			<span class="filters" >
				{{ data | collectAuthors }}
			</span>
		</div>
		<hr />
		<div>
			<div>Filter by publication type:</div>
			<span class="filters" >
				{{ data | collectTypes }}
			</span>
		</div>
		<hr />
		<div>
		  {{ view-download }}
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
						<li class="paper mb-4">
							<div>
							{% assign id = id | plus: 1 %}
							{% capture paper_id %}paper_{{paper.id | handleize }}{% endcapture %}
							<div id="paper_id" class="paper">
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
							| <small><a href="#{{paper_id}}" class="nodec permalink" id="{{ id }}" ><span class="fa fa-link"></span> permalink</a></small>
							{%- if paper.doi -%}
							<div class="float-sm-right d-none d-sm-block">
							<div data-badge-type="4" data-doi="{{ paper.doi }}" data-condensed="true" data-hide-no-mentions="true" data-hide-less-than="1" class="altmetric-embed"></div></div>
							{%- elsif paper.arxiv -%}
							<div class="float-sm-right d-none d-sm-block">
							<div data-badge-type="4" data-arxiv-id="{{ paper.arxiv }}" data-condensed="true" data-hide-no-mentions="true" data-hide-less-than="1" class="altmetric-embed"></div></div>
							{%- endif -%}
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
<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script>