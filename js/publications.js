$(document).ready(function() {

    /* ---- ABSTRACT PREVIEW LOGIC ---- */
    
    $(".abstract_preview").click( function( e ) {
        $( "#abstract_content_" + $( this ).attr( "id" ) ).toggle( 100 );
        return false;
    });
    
    /* ---- BIBITEM VIEW LOGIC ---- */

    $(".bibitem_preview").click( function( e ) {
        $( "#bibitem_content_" + $( this ).attr( "id" ) ).toggle( 100 );
        console.log( "clicked" );
        return false;
    });

    /* ---- FILTERS LOGIC ---- */

    var basicBtnClasses = "btn btn-sm";
    var selectedClass = "btn-primary";
    var unselectedClass = "btn-light";
    var sep = " ";

    var isSelected = function( e ) {
        return $( e ).attr('class').indexOf( selectedClass ) >= 0;
    };

    var filterPapers = function( e ) {
        var updateClass = "";
        if ( isSelected( this ) ) {
            updateClass = unselectedClass;
        } else {
            updateClass = selectedClass;
        }
        $( this ).attr( 'class', basicBtnClasses + sep + updateClass );

        selectedTopics = new Set();

        $.each($("." + selectedClass), function(i, e) {
            selectedTopics.add($(e).text());
        });

        var filterFunction;
        if (selectedTopics.size == 0) {
            filterFunction = function(i, e) {
                $(e).show();
            }
        } else {
            filterFunction = function(i, e) {
                $(e).hide();
                $(e).find(".badge").each(function(j, ie) {
                    if (selectedTopics.has($(ie).text())) {
                        $(e).show();
                        return false;
                    }
                });
            }
        }

        $.each($("#papers li"), filterFunction);
    }

    $(".btn-filter").click( filterPapers );

    /* ---- FILTER FROM ADDRESS ---- */

    var hash = window.location.href.substring(window.location.href.indexOf("#")+1);
    var filter = decodeURIComponent( hash )
    if( filter.length > 0 ){
        if( filter.indexOf( "keyword_" ) > -1 ){
            filter = filter.substring( 8 );
        } else if( filter.indexOf( "author_" ) > -1 ){
            filter = filter.substring( 7 );
        }
        $( ".btn-filter" ).each( function(i, e) {
            if( $( e ).text().toLowerCase() == filter ){
                $( e ).trigger( 'click' );
                return false;
            }
        });
    }

});