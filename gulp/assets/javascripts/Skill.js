export default class Skill {
  constructor() {
    $(".game.ios_link").hide();
    var country;
    $("#platform_type input").on('change', function() {
      var platform_type = $('input[name="platform"]:checked').val();
      if (platform_type == "Android") {
        $(".game.android_link").show().siblings().hide();
      }else if (platform_type == "iOS") {
        $(".game.ios_link").show().siblings().hide();
      }else {
        $(".game.web_link").show().siblings().hide();
      }
    });
  }
}
