$(function(){
  topHeight= $(".topdrawer").height();
  $(".topdrawer").css("bottom",-topHeight+'px');
  btmHeight= $(".bottomdrawer").height();
  $(".drawer").height(topHeight+btmHeight);
  console.log(btmHeight)

  animateSetups = [{bottom: '-'+topHeight+"px"},{bottom: (btmHeight)+"px"}];

  $(".bottomdrawer").click(() => {
  if(t1){
          clearTimeout(t1);
          t1=null;
        }
  toggleDrawer()
});
})

drawerStatus=1;
t1=null;

toggleDrawer = function(){
 $(".topdrawer").animate(
  animateSetups[drawerStatus],300, ()=>{
    // current open
    if(drawerStatus===1){
     drawerStatus=0

    } else {
      // current close
      drawerStatus=1;
t1=setTimeout(function(){
            if(drawerStatus===1){
              closeDrawer();
            }
          }, 3000);
    }
    console.log(drawerStatus);
  });
}
closeDrawer = function(){
  $(".topdrawer").animate(
  animateSetups[0],300)
}
