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
    $(".tags_item").click( function( e ) {
      var filter = $(this).text().trim().toLowerCase(); 
      console.log("tag \"" + filter + "\"" );
      $( ".btn-filter" ).each( function(i, e) {
          if( $.trim( $( e ).ignore(".tot").text().toLowerCase() ) == filter){
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

    var filterPapers = function( e ) {
        var updateClass = "";
        if ( $( this ).is( "button" ) && isSelected( this ) ) {
            updateClass = unselectedClass;
        } else {
            updateClass = selectedClass;
        }
        $( this ).attr( 'class', basicBtnClasses + sep + updateClass );

        selectedTopics = new Set();

        $.each( $( ".filters ." + selectedClass ), function( i, e ) {
            console.log( "adding \"" + $.trim( $( e ).ignore(".tot").text().toLowerCase() ) + "\"" );
            selectedTopics.add( $.trim( $( e ).ignore(".tot").text().toLowerCase() ) );
        });

        var filterFunction;
        if ( selectedTopics.size == 0 ) {
            filterFunction = function(i, e) {
                checkDisplay( e );
            }
        } else {
            filterFunction = function( i, e ) {
                $( e ).hide();
                $( e ).find(".badge").each( function( j, ie ) {
                    if ( selectedTopics.has( $( ie ).text().toLowerCase() ) ) {
                        checkDisplay( e );
                        return false;
                    }
                });
            }
        }

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

});