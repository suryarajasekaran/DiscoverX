document.getElementById("submit").onclick = function () {
        var username = document.getElementById("UserName").value;
        var agentname = document.getElementById("AgentName").value;
         var title = document.getElementById("TicketTitle").value;
          var desc = document.getElementById("TicketDescription").value;
           var status = document.getElementById("TicketStatus").value;
        $.ajax({
                url: "/u/user",
                type: "POST",
                data: JSON.stringify({
                    "UserName": username,
                    "AgentName" : agentname,
                    "TicketTitle" : title,
                    "TicketDescription" : desc,
                     "TicketStatus" : status,
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


