window.onload = function () {
    var links = document.querySelectorAll(".app-link");

    //    for (var i = 0; i < links.length; i++) {
    //        links[i].setAttribute('target', '_blank');
    //    }

    // assign keyboard digits to apps
    document.onkeypress = function (event) {
        var keyCodeOne = 49; // match the '1'
        var keyCode = event.which | event.keyCode;
        if (keyCode >= keyCodeOne && keyCode < keyCodeOne + links.length) {
            var i = keyCode - keyCodeOne;
            links[i].click();
        }
    };
}
