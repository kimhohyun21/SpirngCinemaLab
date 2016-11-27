/**
 * custom javascript
 */

/* jQuery Alert 창 */
jQuery.jQueryAlert = function (msg) {
    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    $("body").append($messageBox);

    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        autoOpen: true,
        modal: true,
        resizable:false, 
		width: 400,
        buttons: {
            OK: function () {
                $(this).dialog("close");
            }
        }
    });
};   