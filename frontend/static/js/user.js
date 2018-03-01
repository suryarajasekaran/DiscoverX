document.getElementById("submit").onclick = function () {
        var firstname = document.getElementById("firstname").value;
        var lastname = document.getElementById("lastname").value;
        $.ajax({
                url: "http://0.0.0.0:7771/user",
                type: "POST",
                data: JSON.stringify({
                    "firstname": firstname,
                    "lastname" : lastname,
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                xhrFields: {
                   withCredentials: true
                },
                crossDomain: true,
                cache: false,
                success: function() {
                    // Success message
                },
                error: function() {
                    // Fail message
                },
            });
        };


