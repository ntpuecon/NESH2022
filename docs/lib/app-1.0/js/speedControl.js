$(function(){
   $("#play_arrow").click(function(){
     if(currentPlayStatus==="play") return;
     currentPlayStatus="play";
      tintId=setInterval(function(){greetingGallery.next()},2000);
      $("#play_arrow").toggle();
      $("#stop").toggle();
    });
  $("#stop").click(function(){
    if(currentPlayStatus==="stop") return;
    currentPlayStatus="stop";
    clearInterval(tintId);
    tintId=null;
    $("#play_arrow").toggle();
    $("#stop").toggle();
  });

  $("div.speedcontainer-speedadjustment-plus").click(function(){
    decreaseCarouselSpeed();
  });

  $("div.speedcontainer-speedadjustment-minus").click(function(){
    increaseCarouselSpeed();
  });
  /*$(".carousel").click(function(){
  if(tintId!=null){
  clearInterval(tintId);
    tintId=null;
    $("#play_arrow").toggle();
    $("#stop").toggle();
  }
  }); */
speedControlDown = function () {
    var div = $(".speedcontainer-speedadjustment");

    var height = div.height();

    div.css({
        overflow: "hidden",
        marginTop: 0,
        height: height
    }).animate({
        marginTop: height,
        height: 0
    }, 500, function () {
        $(this).css({
            display: "none",
            overflow: "",
            height: "",
            marginTop: ""
        });
    });
};
currentPlayStatus="stop";
speedControlUp = function () {
    var div = $(".speedcontainer-speedadjustment:not(:visible)");

    var height = div.css({
        display: "block"
    }).height();

    div.css({
        overflow: "hidden",
        marginTop: height,
        height: 0
    }).animate({
        marginTop: 0,
        height: height
    }, 500, function () {
        $(this).css({
            display: "",
            overflow: "",
            height: "",
            marginTop: ""
        });
    });}

speedControlToggle = function(){
        if(currentSpeedToggle === 0){
          currentSpeedToggle=1 } else {
            currentSpeedToggle=0
          }
        speed_toggleFunctions[currentSpeedToggle]()
}
speed_toggleFunctions = [speedControlUp, speedControlDown];
currentSpeedToggle=1;

  speedControlDown();


  $(".speedcontainer-iconspeed").click(
    speedControlToggle
  );


})

speed = [500, 1000, 1500, 2000, 3000, 4000, 5000, 6000, 7000];
currentspeedchoice = 3;
increaseCarouselSpeed = function(){
  if(currentspeedchoice >=8) return;
  currentspeedchoice+=1;
  currentspeed=speed[currentspeedchoice];
  clearInterval(tintId);
  tintId=null;
  tintId=setInterval(function(){greetingGallery.next()},currentspeed);
};
decreaseCarouselSpeed = function(){
  if(currentspeedchoice <=0) return;
  currentspeedchoice-=1;
  currentspeed=speed[currentspeedchoice];
  clearInterval(tintId);
  tintId=null;
  tintId=setInterval(function(){greetingGallery.next()},currentspeed);
}
