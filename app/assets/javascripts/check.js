$(window).on('turbolinks:load', function(){
  $(function(){
    let userstatus = $(".user__login").text()
    if (userstatus == "ログアウト"){
    $('.afterread').on('click', function(){
        $(this).replaceWith(`<i class="fas fa-check"></i>`);
    });
  }
  $('#user_username').focus();
  });
  })
