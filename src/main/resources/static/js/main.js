(function () {
  // ---------- Day / Night theme ----------
  var body = document.body;
  var saved = localStorage.getItem('cp-theme');
  var prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
  var hour = new Date().getHours();
  var defaultDark = prefersDark || hour >= 19 || hour < 6;

  function applyTheme(isDark) {
    body.classList.toggle('dark', isDark);
    var btn = document.getElementById('themeToggle');
    if (btn) btn.setAttribute('aria-label', isDark ? 'Switch to day mode' : 'Switch to night mode');
  }

  applyTheme(saved === null ? defaultDark : saved === 'dark');

  document.addEventListener('click', function (e) {
    var btn = e.target.closest('#themeToggle');
    if (!btn) return;
    var isDark = !body.classList.contains('dark');
    applyTheme(isDark);
    localStorage.setItem('cp-theme', isDark ? 'dark' : 'light');
  });

  // ---------- Twinkling stars (only rendered once, CSS handles visibility) ----------
  var starsLayer = document.querySelector('.stars');
  if (starsLayer && !starsLayer.dataset.filled) {
    starsLayer.dataset.filled = '1';
    var count = 60;
    for (var i = 0; i < count; i++) {
      var s = document.createElement('span');
      s.style.top = Math.random() * 100 + '%';
      s.style.left = Math.random() * 100 + '%';
      s.style.animationDelay = (Math.random() * 3) + 's';
      s.style.opacity = (0.3 + Math.random() * 0.7).toFixed(2);
      starsLayer.appendChild(s);
    }
  }

  // ---------- Scroll reveal ----------
  var revealEls = document.querySelectorAll('.reveal');
  if ('IntersectionObserver' in window && revealEls.length) {
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('in-view');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12 });
    revealEls.forEach(function (el) { observer.observe(el); });
  } else {
    revealEls.forEach(function (el) { el.classList.add('in-view'); });
  }

  // ---------- Navbar shadow on scroll ----------
  var nav = document.querySelector('.navbar');
  if (nav) {
    window.addEventListener('scroll', function () {
      nav.style.boxShadow = window.scrollY > 10
        ? '0 4px 18px rgba(0,0,0,0.25)'
        : '0 2px 10px rgba(0,0,0,0.15)';
    });
  }
  // ---------- Quantity steppers (menu Add to Cart forms) ----------
  document.addEventListener('click', function (e) {
    var minus = e.target.closest('.qty-minus');
    var plus = e.target.closest('.qty-plus');
    if (!minus && !plus) return;
    var stepper = (minus || plus).closest('.qty-stepper');
    var input = stepper.querySelector('.qty-input');
    var val = parseInt(input.value, 10) || 1;
    var min = parseInt(input.min, 10) || 1;
    var max = parseInt(input.max, 10) || 99;
    if (minus) val = Math.max(min, val - 1);
    if (plus) val = Math.min(max, val + 1);
    input.value = val;
  });

})();
