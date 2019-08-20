window.onscroll = function() {scrollFunction()};

if($(window).width() >= 1081){
  function scrollFunction() {
    if (document.body.scrollTop > 10 || document.documentElement.scrollTop > 10) {
      document.getElementById("navbar").style.height = "40px";
      document.getElementById("navbar").style.padding = "0px";
      document.getElementById("logotext").style.fontSize = "0px";
      document.getElementById("dropdown-toggle").style.height = "50px";
      document.getElementById("dropdown").style.height = "50px";
      document.getElementById("navbar").style.opacity = ".9";
      document.getElementById("logoimage").style.maxHeight = "32px";
      document.getElementById("logoimage").style.marginTop = "10px";
      document.getElementById("alpha-menu").style.marginLeft = "-10px";
    } else {
      document.getElementById("navbar").style.height = "70px";
      document.getElementById("navbar").style.padding = "10px";
      document.getElementById("logotext").style.fontSize = "1.7em";
      document.getElementById("dropdown-toggle").style.height = "60px";
      document.getElementById("dropdown").style.height = "60px";
      document.getElementById("navbar").style.opacity = "1";
      document.getElementById("logoimage").style.maxHeight = "40px";
      document.getElementById("logoimage").style.marginTop = "5px";
      document.getElementById("alpha-menu").style.marginLeft = "0px";
    }
  }
}

;
