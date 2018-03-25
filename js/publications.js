$.fn.ignore = function(sel){
  return this.clone().find(sel||">*").remove().end();
};

$(document).ready(function() {
    
    /* ---- ABSTRACT PREVIEW LOGIC ---- */
    
    $(".abstract_preview").click( function( e ) {
        $( "#abstract_content_" + $( this ).attr( "id" ) ).toggle( 100 );
        return false;
    });
    
    /* ---- BIBITEM VIEW LOGIC ---- */

    $(".bibitem_preview").click( function( e ) {
        $( "#bibitem_content_" + $( this ).attr( "id" ) ).toggle( 100 );
        return false;
    });
    
    /* ---- TAGS VIEW LOGIC ---- */

    $(".tags_preview").click( function( e ) {
        $( "#tags_content_" + $( this ).attr( "id" ) ).toggle( 100 );
        return false;
    });
    $(".tags-item").click( function( e ) {
      var filter = $(this).text().trim(); 
      console.log("tag \"" + filter + "\"" );
      $( ".btn-filter" ).each( function(i, e) {
          if( $.trim( $( e ).ignore(".tot").text() ) == filter){
              $( e ).trigger( 'click' );
              return false;
          }
      });
      return false;
    })
    
    /* ---- FILTERS LOGIC ---- */

    var basicBtnClasses = "btn btn-sm";
    var selectedClass = "btn-primary";
    var unselectedClass = "btn-light";
    var tagClass = "tags-item"; // "badge"
    var sep = " ";

    var isSelected = function( e ) {
        return $( e ).attr('class').indexOf( selectedClass ) >= 0;
    };

    var checkDisplay = function( e ){
        var all_papers = $( "#display_papers" ).prop( 'checked' );
        var non_group = $( e ).find( ".non_group" ).length;
        if( !all_papers && non_group ){ $( e ).hide(); } else { $( e ).show(); }
    };

    var filterCollection = function( i, e ){
        var papers = $( e ).find( "li.paper" );
        var items = $( papers ).length;
        var hidden = 0;
        $( papers ).each( function( i, el ) {
            if( $( el ).css( "display" ) == "none" ){
                hidden++;
            }
        });
        if( items == hidden ){
            $( e ).hide();
        } else {
            $( e ).show();
        }
    };

    var selectedTopics = [new Set(), new Set(), new Set()];
    var topicCategory = ["keyword","author","type"];

    var filterPapers = function( e ) {
        if ( $( this ).is( "button" ) ) {
          $( this ).toggleClass(selectedClass).toggleClass(unselectedClass);
          for(i = 0; i < 3; i++){
            if ( $( this ).hasClass(topicCategory[i])){
                var topic = $.trim($( this ).ignore(".tot").text());
                if ( $(this).hasClass(selectedClass)){
                  selectedTopics[i].add(topic);
                  console.log( "add \"" + topic + "\" to \"" + topicCategory[i] + "s\"" );
                }else{
                  selectedTopics[i].delete(topic);
                  console.log( "del \"" + topic + "\" from \"" + topicCategory[i] + "s\"");
                }
                break;
            }}
        }
        
        var filterCategory = function (i,e){
          var found = false;
          if (selectedTopics[i].size == 0){
            found =  true;
          } else {
            var sel = "." + tagClass + "." + topicCategory[i];
            var selected = selectedTopics[i];
            $( e ).find(sel).each( function( j, je ) {
                found = selected.has( $( je ).text() );
                return !found; //break
              });
          };
          return found;
        };
         
        var filterFunction = function(i,e){
          if (filterCategory(0,e) && filterCategory(1,e) && filterCategory(2,e)) {
            checkDisplay(e);
          }else{
            $( e ).hide();
          }
        };

        $.each( $( "#papers li.paper" ), filterFunction );
        $.each( $( ".pub-year" ), filterCollection );
    };

    $( ".btn-filter" ).click( filterPapers );
    $( "#display_papers" ).change( filterPapers );

    /* ---- FILTER FROM ADDRESS ---- */

    var hash = window.location.href.substring(window.location.href.indexOf("#")+1);
    var filter = decodeURIComponent( hash )
    if( filter.length > 0 ){
        if( filter.indexOf( "keyword_" ) > -1 ){
            filter = filter.substring( 8 );
        } else if( filter.indexOf( "author_" ) > -1 ){
            filter = filter.substring( 7 );
        }
        filter = filter.toLowerCase();
        $( ".btn-filter" ).each( function(i, e) {
            if( $( e ).ignore(".tot").text().toLowerCase() == filter){
                $( e ).trigger( 'click' );
                return false;
            }
        });
    }
    
    var collectBibtex = function(){
      var text = "";
      $("li.paper").filter(":visible").each(function(i,e){
        text += $(this).find(".bibitem_content").text();
      });
      return text;
    }
        
    $("#copy-bibtex").click( function(e){
      var icon = $(this).children("span");
      icon.attr("class","fa fa-clock");
      var text = collectBibtex();
      // copyToClipboard
      const el = document.createElement('textarea');
      el.value = text;
      el.setAttribute('readonly', '');
      el.style.position = 'absolute';
      el.style.left = '-9999px';
      document.body.appendChild(el);
      const selected =
        document.getSelection().rangeCount > 0 
          ? document.getSelection().getRangeAt(0)
          : false;
      el.select();
      document.execCommand('copy');
      document.body.removeChild(el);
      if (selected) {
        document.getSelection().removeAllRanges();
        document.getSelection().addRange(selected);
      }
      // end copyToClipboard
      icon.attr("class","fa fa-check");
      setTimeout(function() {
        icon.attr("class","fa fa-clipboard-list");
      }, 250);
      return false;
    }).children("span").attr("class","fa fa-clipboard-list");
    
    $("#download-bibtex").click( function(e){
      var icon = $(this).children("span");
      icon.attr("class","fa fa-clock");
      var text = collectBibtex();
      // download
      var element = document.createElement('a');
      element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
      element.setAttribute('download', "bibliography.bib");
      element.style.display = 'none';
      document.body.appendChild(element);
      element.click();
      document.body.removeChild(element);
      //end download
      icon.attr("class","fa fa-check");
      setTimeout(function() {
        icon.attr("class","fa fa-download");
      }, 250);
      return false;
    }).children("span").attr("class","fa fa-download");
});