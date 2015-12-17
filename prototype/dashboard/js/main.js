

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

$('#musicCourse').hover(function() {
    $('#musicIcon', this).stop().animate({"opacity": 0.8});
},function() {
    $('#musicIcon', this).stop().animate({"opacity": 1});
});

$('#religionCourse').hover(function() {
    $('#religionIcon', this).stop().animate({"opacity": 0.8});
},function() {
    $('#religionIcon', this).stop().animate({"opacity": 1});
});

$('#artCourse').hover(function() {
    $('#artIcon', this).stop().animate({"opacity": 0.8});
},function() {
    $('#artIcon', this).stop().animate({"opacity": 1});
});

$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel({interval: false, pause: true});
});


//Fix Navbar when scroll
$(document).ready(function()
{
    var navbar = $('.menu');

    navbar.after('<div id="navbarContainer" style="height: ' + $('.menu').height() + 'px" class="hidden"></div>');
    var container = $('#navbarContainer');


    $(window).on('scroll', function()
    {
        if ($(window).scrollTop() > $('.menu').height())
        {
            navbar.addClass('navbar-fixed-top');
            container.removeClass('hidden');
        }
        else
        {
            navbar.removeClass('navbar-fixed-top');
            container.addClass('hidden');
        }
    });
});
