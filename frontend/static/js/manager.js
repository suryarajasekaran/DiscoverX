//document.getElementById("submitMan").onclick = function () {

        $.ajax({
                url: "/m/manager",
                type: "GET",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                xhrFields: {
                   withCredentials: true
                },
                crossDomain: true,
                cache: false,
                success: function(result) {
        console.log(result);
        var dataset = result;
        //document.getElementById("UserName").innerHTML = JSON.stringify(result);
           var results = document.getElementById("results");
           for(var i = 0; i < dataset.length; i++) {
                        var opt = document.createElement('option');
                        opt.innerHTML = "Ticket "+ (i+1)  + " :&emsp;Username : &emsp;" +dataset[i].UserName + "&emsp;Agent Name :  &emsp;" + dataset[i].AgentName + "&emsp;Ticket Title :  &emsp;" + dataset[i].TicketTitle + "&emsp;Ticket Description : &emsp;"  +dataset[i].TicketDescription +"&emsp;Ticket Status : &emsp;" + dataset[i].TicketStatus;
                        opt.value = dataset[i].UserName + "&emsp;|&emsp;" + dataset[i].AgentName + "&emsp;|&emsp;" + dataset[i].TicketTitle + "&emsp;|&emsp;"  +dataset[i].TicketDescription +"&emsp;|&emsp;" + dataset[i].TicketStatus;
                        results.appendChild(opt);
                    }
    },
                error: function() {
                    // Fail message
                },
            });

