$(window).on('turbolinks:load', function(){
  $(function(){
    $(".content__title--link, .content__summary--link").on('click', function(){
      let takeshi = $(this).attr('id')
      console.log(takeshi)
      $.ajax({
        // リクエストを送信する先のURL
        url: '/infos/see',
        // HTTP通信の種類を記述する
        type: 'GET',
        // サーバに送信する値
        data: { id: takeshi },
        // サーバから返されるデータの型
        dataType: 'json'
      })
      });
    });
  })