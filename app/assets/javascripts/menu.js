window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 80) {
    document.getElementById("navbar").style.height = "40px";
    document.getElementById("navbar").style.padding = "0px";
    document.getElementById("logotext").style.fontSize = "0px";
    document.getElementById("dropdown-toggle").style.height = "50px";
    document.getElementById("dropdown").style.height = "50px";
    document.getElementById("navbar").style.opacity = ".9";
  } else {
    document.getElementById("navbar").style.height = "70px";
    document.getElementById("navbar").style.padding = "10px";
    document.getElementById("logotext").style.fontSize = "1.7em";
    document.getElementById("dropdown-toggle").style.height = "60px";
    document.getElementById("dropdown").style.height = "60px";
    document.getElementById("navbar").style.opacity = "1";
  }
}
