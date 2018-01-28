function send_docs(e){
  var reader = new FileReader()
  // The js is the same as the following jquery line, just for reference
  // var files = document.getElementById('picture').files;
  var files = $("#picture").get(0).files;
  var name = $("#name").val();
  var reader = new FileReader();
  reader.readAsDataURL(files[0]);

  reader.onload = function () {
    base64string = reader.result
    console.log(base64string);
    info = {cat:{
             name: name,
             picture: base64string
           }};

    $.ajax({
        url: "http://localhost:3000/cats/",
        type: "POST",
        dataType: "JSON",
        data: info,
        success: function (response) {
          // You can see the full response object in
          // Chrome developer tools, console
          // console.log(response)
          alert("Name: " + response.name + " ID:" + response.id );
        }
    });

  };

};
