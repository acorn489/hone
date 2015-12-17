

$('#mathCourse').hover(function() {
    $('#mathIcon', this).stop().animate({"opacity": 0.8});
},function() {
    $('#mathIcon', this).stop().animate({"opacity": 1});
});

$('#englishCourse').hover(function() {
    $('#englishIcon', this).stop().animate({"opacity": 0.8});
},function() {
    $('#englishIcon', this).stop().animate({"opacity": 1});
});
