export default class Skill {
  constructor() {
    $(".game.ios_link").hide();
    var country;
    $("#platform_type input").on('change', function() {
      var platform_type = $('input[name="platform"]:checked').val();
      if (platform_type == "Android") {
        $(".game.android_link").show();
        $(".game.ios_link").hide();
        $(".game.web_link").hide();
      }else if (platform_type == "iOS") {
        $(".game.android_link").hide();
        $(".game.ios_link").show();
        $(".game.web_link").hide();
      }else {
        $(".game.android_link").hide();
        $(".game.ios_link").hide();
        $(".game.web_link").show();
      }
    });
  }
}
