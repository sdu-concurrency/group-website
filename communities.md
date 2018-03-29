---
layout: default
---

<style>

.node {
  cursor: pointer;
}

.node circle {
  fill: #fff;
  stroke: steelblue;
  stroke-width: 1.5px;
}

.node text {
  font-size: 14px;
}

.link {
  fill: none;
  stroke: #ccc;
  stroke-width: 1.5px;
}

.myTooltip div {
  z-index: 1070;
  display: block;
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  font-style: normal;
  font-weight: 400;
  line-height: 1.5;
  text-align: left;
  text-align: start;
  text-decoration: none;
  text-shadow: none;
  text-transform: none;
  letter-spacing: normal;
  word-break: normal;
  word-spacing: normal;
  white-space: normal;
  line-break: auto;
  font-size: 0.875rem;
  word-wrap: break-word;
  opacity: 1;
  max-width: 200px;
  padding: 0.25rem 0.5rem;
  color: #fff;
  text-align: center;
  background-color: #000;
  border-radius: 0.25rem;
}

</style>

<script src="//d3js.org/d3.v3.min.js"></script>

<article id="main"><header class="major container" markdown="1">

## Communities

</header><section class="wrapper card style4 container"><div class="content"><section markdown="1">


  The graph below represents the interactions that members of the {{ site.group_short }} have with industrial and public organisations, other academic groups and individuals, open-source communities, and interest groups.

  To explore a node, click on it.

  <div id="image"></div>

</section></div></section></article>

<script>
  var margin = {top: 20, right: 120, bottom: 20, left: 20},
  width = 960 - margin.right - margin.left,
  height = 800 - margin.top - margin.bottom;

  var i = 0,
  duration = 750,
  root;

  var tree = d3.layout.tree()
  .size([height, width]);

  var diagonal = d3.svg.diagonal()
  .projection(function(d) { return [d.y, d.x]; });

  var svg = d3.select("#image").append("svg")
  .attr("width", width + margin.right + margin.left)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  d3.json("communities.json", function(error, flare) {
    if (error) throw error;

    root = flare;
    root.x0 = height / 2;
    root.y0 = 0;

    function collapse(d) {
      if (d.children) {
        d._children = d.children;
        d._children.forEach(collapse);
        d.children = null;
      }
    }

    root.children.forEach(collapse);
    update(root);
  });

  d3.select(self.frameElement).style("height", "800px");

  function update(source) {

    // Compute the new tree layout.
    var nodes = tree.nodes(root).reverse(),
    links = tree.links(nodes);

    // Normalize for fixed-depth.
    nodes.forEach(function(d) { d.y = d.depth * 180; });

    // Update the nodes…
    var node = svg.selectAll("g.node")
    .data(nodes, function(d) { return d.id || (d.id = ++i); });

    // Enter any new nodes at the parent's previous position.
    var nodeEnter = node.enter().append("g")
    .attr("class", "node")
    .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
    .on("click", click);

    nodeEnter.append("circle")
    .attr("r", 1e-6)
    .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

    var adjustTextX = function( a, n ){
      if( a != undefined ){
        return a;
      } else {
        var length = 0;
        if( n.indexOf( "<br>" ) > -1 ){
          $.each( n.split( "<br>" ), function(i, el) {
          if( length < el.length ){
            length = el.length;
          }
          });  
        } else {
          length = n.length;
        }
        return -length*5.6;
      }
    }

    var adjustWidth = function( n ){
      name = n.name;
      var length=0;
      if( name.indexOf( "<br>" ) > -1 ){
        $.each( name.split( "<br>" ), function(i, el) {
        if( length < el.length ){
          length = el.length;
        }
      });  
      } else {
        length = name.length;
      }
      return length*12;
    }

    var text = nodeEnter.append("svg:foreignObject")
    .attr("x", function(d) { return d.children || d._children ? 
      adjustTextX( d.adjustX, d.name ) : 10; 
    })
    .attr( "y", function(d) { return d.children || d._children ? 
      ".65em" : -14;
    })
    .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
    .attr( 'width', adjustWidth )
    .on("mouseover", function(d) {
          var g = d3.select(this.parentNode); // The node
          // The class is used to remove the additional text later
          var info = g.append('svg:foreignObject')
             .attr( 'width', '100%' )
             .attr( 'height', '100%' )
             .classed( "myTooltip", true )
             .attr( 'x', 20 )
             .attr( 'y', 10 )
             .append( 'xhtml:div' )
             .text( 'More info' );
    })
    .on("mouseout", function() {
          // Remove the info text on mouse out.
          d3.select(this.parentNode)
            .select( 'foreignObject.myTooltip' ).remove();
    })
    .html( function( d ){ return "<div style=\"text-align:center;\">" + d.name + "</div>" } );
    //.style("fill-opacity", 1e-6);

    // Transition nodes to their new position.
    var nodeUpdate = node.transition()
    .duration(duration)
    .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

    nodeUpdate.select("circle")
    .attr("r", 4.5)
    .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

    nodeUpdate.select("text")
    .style("fill-opacity", 1);

    // Transition exiting nodes to the parent's new position.
    var nodeExit = node.exit().transition()
    .duration(duration)
    .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
    .remove();

    nodeExit.select("circle")
    .attr("r", 1e-6);

    nodeExit.select("text")
    .style("fill-opacity", 1e-6);

    // Update the links…
    var link = svg.selectAll("path.link")
    .data(links, function(d) { return d.target.id; });

    // Enter any new links at the parent's previous position.
    link.enter().insert("path", "g")
    .attr("class", "link")
    .attr("d", function(d) {
      var o = {x: source.x0, y: source.y0};
      return diagonal({source: o, target: o});
    });

    // Transition links to their new position.
    link.transition()
    .duration(duration)
    .attr("d", diagonal);

    // Transition exiting nodes to the parent's new position.
    link.exit().transition()
    .duration(duration)
    .attr("d", function(d) {
      var o = {x: source.x, y: source.y};
      return diagonal({source: o, target: o});
    })
    .remove();

    // Stash the old positions for transition.
    nodes.forEach(function(d) {
      d.x0 = d.x;
      d.y0 = d.y;
    });
  }

  // Toggle children on click.
  function click(d) {
    if (d.children) {
      d._children = d.children;
      d.children = null;
    } else {
      d.children = d._children;
      d._children = null;
    }
    update(d);
  }
</script>