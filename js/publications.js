$(document).ready(function() {
    var basicBtnClasses = "btn btn-xs btn-tag";
    var selectedClass = "btn-primary";
    var unselectedClass = "btn-light";
    var sep = " ";

    var isSelected = function(e) {
        return $(e).attr('class').indexOf(selectedClass) >= 0;
    };

    $(".btn-tag").click(function(e) {
        var updateClass = "";
        if (isSelected(this)) {
            updateClass = unselectedClass;
        } else {
            updateClass = selectedClass;
        }
        $(this).attr('class', basicBtnClasses + sep + updateClass);

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
                console.log("hidden " + $(e).text());
                $(e).find(".badge").each(function(j, ie) {
                    console.log("testing for " + $(ie).text());
                    if (selectedTopics.has($(ie).text())) {
                        $(e).show();
                        return false;
                    }
                });
            }
        }

        $.each($("#papers li"), filterFunction);
    });
});