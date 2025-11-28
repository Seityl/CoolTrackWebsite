// Header sticky and pin/unpin behavior
(function() {
  const header = document.querySelector(".header-nav");
  if (!header) return;
  
  let lastScroll = 0;
  let ticking = false;
  
  function updateHeader() {
    const currentScroll = window.pageYOffset || document.documentElement.scrollTop;
    
    // Add sticky class when scrolled
    header.classList.toggle("header-sticky-top", currentScroll >= 50);
    
    // Pin/unpin based on scroll direction
    if (currentScroll > 300) {
      header.classList.toggle("header-unpinned", currentScroll > lastScroll);
    }
    
    lastScroll = currentScroll;
    ticking = false;
  }
  
  window.addEventListener('scroll', function() {
    if (!ticking) {
      window.requestAnimationFrame(updateHeader);
      ticking = true;
    }
  }, { passive: true });
})();

// Preloader helpers: hide safely and add fallbacks
(function() {
  function hidePreloader() {
    try {
      const preloader = document.querySelector('.preloader');
      if (!preloader) return;
      
      // Use CSS transition for smooth animation
      preloader.classList.add('preloader-hide');
      
      // Remove from DOM after animation completes
      setTimeout(function() {
        if (preloader && preloader.parentNode) {
          preloader.parentNode.removeChild(preloader);
        }
      }, 700);
    } catch (e) {
      // Preloader is non-critical, silently fail
      console.error && console.error('Preloader hide error:', e);
    }
  }
  
  // Hide on DOMContentLoaded (faster than window.onload)
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', hidePreloader);
  } else {
    hidePreloader();
  }
  
  // Safety fallback: hide after 4s if something blocks load events
  setTimeout(hidePreloader, 4000);
  
  // Also hide on window load
  window.addEventListener('load', function() {
    setTimeout(hidePreloader, 150);
  });
})();

// Initialize components on window load
window.addEventListener('load', function() {
  // AOS init - animate on scroll
  setTimeout(function() {
    if (typeof AOS !== 'undefined') {
      AOS.init({
        duration: 600,
        once: true,
      });
    }
  }, 50);

  // video embed
  var videoPlay = document.querySelectorAll(".video-play-btn");
  videoPlay.forEach(function (video) {
    var thumbnail = video.nextElementSibling;
    var thumbWidth = thumbnail ? thumbnail.width : 640;
    video.addEventListener("click", function () {
      var videoEl =
        '<div class="ratio ratio-16x9 mx-auto bg-dark overflow-hidden" style="max-width:' +
        thumbWidth +
        'px"><iframe src="' +
        this.getAttribute("data-src") +
        "?autoplay=1&amp;modestbranding=1&amp;showinfo=0" +
        '" allowscriptaccess="always" allow="autoplay" allowfullscreen loading="lazy"></iframe></div>';
      this.parentNode.innerHTML = videoEl;
    });
  });

  // rellax parallax effect
  if (typeof Rellax !== 'undefined' && document.querySelectorAll("[data-rellax-speed]").length) {
    new Rellax("[data-rellax-speed]");
  }

  // brand-carousel - only init if element exists
  var brandCarousel = document.querySelector(".brand-carousel");
  if (brandCarousel && typeof Swiper !== 'undefined') {
    new Swiper(".brand-carousel", {
      spaceBetween: 0,
      speed: 1000,
      loop: true,
      autoplay: {
        delay: 3000,
        disableOnInteraction: false,
      },
      breakpoints: {
        0: {
          slidesPerView: 2,
          spaceBetween: 0,
        },
        640: {
          slidesPerView: 3,
          spaceBetween: 0,
        },
        767: {
          slidesPerView: 3,
          spaceBetween: 0,
        },
        991: {
          slidesPerView: 5,
          spaceBetween: 0,
        },
      },
    });
  }

  // featuresCarousel - only init if element exists
  var featuresCarousel = document.querySelector(".features-carousel");
  if (featuresCarousel && typeof Swiper !== 'undefined') {
    new Swiper(".features-carousel", {
      spaceBetween: 0,
      speed: 600,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },
      breakpoints: {
        0: {
          slidesPerView: 1,
          spaceBetween: 0,
        },
        575: {
          slidesPerView: 1,
          spaceBetween: 0,
        },
        767: {
          slidesPerView: 2,
          spaceBetween: 0,
        },
        991: {
          slidesPerView: 3,
          spaceBetween: 0,
        },
      },
      pagination: {
        el: ".swiper-pagination",
        dynamicBullets: true,
        clickable: true,
      },
    });
  }

  // testimonialsCarousel - only init if element exists
  var testimonialCarousel = document.querySelector(".testimonial-carousel");
  if (testimonialCarousel && typeof Swiper !== 'undefined') {
    new Swiper(".testimonial-carousel", {
      spaceBetween: 0,
      speed: 600,
      loop: true,
      autoplay: {
        delay: 7000,
        disableOnInteraction: false,
      },
      slidesPerView: 1,
      pagination: {
        el: ".swiper-pagination",
        dynamicBullets: true,
        clickable: true,
      },
    });
  }
});

// Form validation and popup initialization
(function() {
  // Form validation on submit
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName("needs-validation");
    Array.prototype.forEach.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add("was-validated");
      }, false);
    });
  }, false);

  // Premium popup (if enabled)
  const buyPremiumPopup = document.querySelector('.buyPremium');
  const overlay = document.querySelector('.overlay');
  const closeBtn = document.querySelector('.buyPremium .close');
  
  if (buyPremiumPopup && overlay && closeBtn) {
    let popupShown = false;
    let lastPopupTime = 0;
    let scrollTicking = false;

    function showPopup() {
      const currentTime = Date.now();
      if (!popupShown && (currentTime - lastPopupTime) >= 30000) {
        buyPremiumPopup.classList.add('show');
        overlay.classList.add('fade', 'show');
        popupShown = true;
        lastPopupTime = currentTime;
      }
    }

    function hidePopup() {
      buyPremiumPopup.classList.remove('show');
      overlay.classList.remove('fade', 'show');
      popupShown = false;
    }

    // Check scroll position with throttling
    window.addEventListener('scroll', function() {
      if (!scrollTicking && !popupShown && window.scrollY > 1000) {
        window.requestAnimationFrame(function() {
          showPopup();
          scrollTicking = false;
        });
        scrollTicking = true;
      }
    }, { passive: true });

    // Close button click event
    closeBtn.addEventListener('click', hidePopup);

    // Click overlay to close popup
    overlay.addEventListener('click', hidePopup);
  }
})();
