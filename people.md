---
layout: default
---

<!-- Main -->
<article id="main">

<header class="major container" markdown="1">

## People
A descriptive sentence.

</header>

	<!-- One -->
	<section class="wrapper style4 container">

		<div class="row">
			{% for person in site.data.people %}

			<div class="6u">
				<div class="row">
				<div class="5u">
					<img class="img-thumbnail" src="{{person.photo}}" alt="">
				</div>
				<div class="7u">
					<div><strong>{{ person.name }}</strong></div>
					<div>{{ person.role }}</div>
				</div>
				</div>
				<div class="12u">
					<h4>Short Bio</h4>
					<p>{{ person.bio }}</p>
				</div>
			</div>
			{% endfor %}
		</div>

	</section>

</article>
