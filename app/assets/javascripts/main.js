$(function(){

  function changeTEXT(texts){
    $('.card-title').text(texts['title']);
    $('.text-body').text(texts['body']);
    $('.btn').text(texts['btn']);
    $('.nav-element').text(texts['btn']);
    $('#service-name').text(texts['main'])
  }

  function changeCOLOR(colors){
    $('nav').removeClass()
    $('nav').addClass(colors['main_class'])
    $('#post_btn').removeClass('waves-effect waves-light green btn')
    $('#post_btn').addClass('waves-effect waves-light black btn')
    $('.card-content.black-text').css({'background-color': colors['main']})
    $('.card-action').children('a').removeClass()
    $('.card-action').children('a').addClass(`waves-effect waves-light ${colors['main_class']} btn`)
    $('.card-action').css({'background-color': colors['action_back']})
  }

  function changeTEXTCOL(colors){
    $('.nav-element').css({'color': colors['nav']});
    $('.card-action').children('a').css({'color': colors['action_btn']})
  }

  function changeHTML(mode){
    if (mode === "mode-g") {
      var texts = {main: "I am Groot", title: "I am Groot", body: "I am Groot", btn: "I am Groot"}
      var colors = {main: "#43a047", action_back: "#f4ff81", main_class: "green darken-1"}
      var text_colors = {nav: "white", body: "black", action_btn: "white"}
    } else if (mode === "mode-p"){
      var texts = {main: "ピカチュウ", title: "ピカー、チュウー！", body: "ピカピカピカ・・ピカピッカー！", btn: "ピカピ"}
      var colors = {main: "#ffff00", action_back: "black", main_class: "yellow accent-2"}
      var text_colors = {nav: "black", body: "white", action_btn: "black"}
    }

    changeTEXT(texts);
    changeCOLOR(colors);
    changeTEXTCOL(text_colors);
  }

  $(document).on('click', '.mode-btn', function(e){
    e.preventDefault();
    var mode_name = $(this).attr('id')
    var current_mode = sessionStorage.getItem("mode")

    // 現在が通常モードの場合
    if (current_mode === null) {
      var storage = sessionStorage;
      storage.setItem("mode", mode_name);
      changeHTML(storage.mode);

    // 現在のモードではない、もう一方のモードのボタンが押された場合
    } else if (current_mode != mode_name) {
      storage = sessionStorage
      storage.mode = mode_name
      changeHTML(storage.mode);

    // 現在のモードを解除するボタンが押された場合
    } else if(current_mode === mode_name) {
      sessionStorage.clear();
      location.reload();
    }
  });

  // ページ遷移時にモード表示を維持する
  $(document).ready(function(){
      var mode = sessionStorage.mode
      if (mode !== null) {
        changeHTML(mode);
      }
    })
});
