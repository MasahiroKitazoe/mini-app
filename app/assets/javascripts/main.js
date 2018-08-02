$(function(){

  function changeHTML(){
    var text = "We are Groot"
    $('.card-title').text(text);
    $('.text-body').text(text);
  }

  function stopMODE(){

  }


  $(document).on('click', '#mode-change', function(e){
    e.preventDefault();
    if (sessionStorage.getItem("mode") === null) {
    var storage = sessionStorage;
    storage.setItem("mode", "groot");
    changeHTML();
    } else {
      sessionStorage.clear();
      stopMODE();
    }
  });
});
