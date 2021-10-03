/*본문 더 보기
$(document).ready(function() {
  $(".toggle").click(function() {
    var elem = $(".toggle").text();
    if (elem == "Read More") {
      //Stuff to do when btn is in the read more state
      $(".toggle").text("Read Less");
      $("#text").slideDown();
    } else {
      //Stuff to do when btn is in the read less state
      $(".toggle").text("Read More");
      $("#text").slideUp();
    }
  });
});*/

/*본문 스크롤시 나타나기*/
function isElementUnderBottom(elem, triggerDiff) {
  const { top } = elem.getBoundingClientRect();
  const { innerHeight } = window;
  return top > innerHeight + (triggerDiff || 0);
}

function handleScroll() {
  const elems = document.querySelectorAll('#up-on-scroll');
  elems.forEach(elem => {
    if (isElementUnderBottom(elem, -20)) {
      elem.style.opacity = "0";
      elem.style.transform = 'translateY(70px)';
    } else {
      elem.style.opacity = "1";
      elem.style.transform = 'translateY(0px)';
    }
  });
}

window.addEventListener('scroll', handleScroll);











