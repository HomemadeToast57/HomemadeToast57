var cursor = true;
        var speed = 250;
        
        
        
        
        setInterval(() => {
          if(cursor) {
            document.getElementById('cursor').style.opacity = 0;
            cursor = false;
          }else {
            document.getElementById('cursor').style.opacity = 1;
            cursor = true;
          }
        }, speed);


        var i = 0;
        var txt = "Hey I am\nJacob";
        
        var speed = 50;
        function typeWriter() {
          if (i < txt.length) {
            document.getElementById("my-name").innerHTML += txt.charAt(i);
            i++;
            setTimeout(typeWriter, speed);
          } else {
            document.getElementById("my-name").innerHTML += "<span id=\"cursor\"> ⏽</span>"
          }
          
        }

        typeWriter();