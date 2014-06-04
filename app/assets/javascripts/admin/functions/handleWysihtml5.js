var handleWysihtml5 = function() {
    if (!jQuery().wysihtml5) {
        return;
    }

    if (jQuery('.wysihtml5').size() > 0) {
        jQuery('.wysihtml5').wysihtml5({
            "stylesheets": ["/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
        });
    }
}