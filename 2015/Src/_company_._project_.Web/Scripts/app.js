var _company__project_ = _company__project_ || {};

_company__project_.Example = _company__project_.Example || (function () {
    function init() {
        $("html").removeClass("no-js").addClass("js");
    }
    return {
        init: init
    };
}());

$(document).ready(function () {
    window._company__project_.Example.initExample();
});