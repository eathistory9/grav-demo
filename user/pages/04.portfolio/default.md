---
title: 'Portfolio'
body_classes: portfolio
slug: portfolio
---

<section id="body-wrapper" class="section">
  <div class="top-text">
    <section class="container grid-lg">
      <h1>Nam quam nunc.</h1>
      <p>Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus.</p>
    </section>
  </div>

  <div class="carousel-container">
    <div class="carousel" id="carousel">
      <button id="prevBtn">&#10094;</button>
      <div class="carousel-track" id="carouselTrack">
        <div class="carousel-card active">
          <video controls muted poster="user/pages/04.portfolio/images/thumb1.jpg" src="user/pages/04.portfolio/video/nunta2.mp4"></video>
        </div>
        <div class="carousel-card">
          <video controls muted poster="user/pages/04.portfolio/images/thumb2.jpg" src="user/pages/04.portfolio/video/nunta3.mp4"></video>
        </div>
        <div class="carousel-card">
          <video controls muted poster="user/pages/04.portfolio/images/thumb3.jpg" src="user/pages/04.portfolio/video/nunta4.mp4"></video>
        </div>
      </div>
      <button id="nextBtn">&#10095;</button>
    </div>
  </div>

</section>

<a href="/" class="btn-back">← Back to Home</a>

<script>
window.addEventListener('load', function() {
  const carousel = document.getElementById('carousel');
  const track = document.getElementById('carouselTrack');
  const cards = Array.from(track.children);
  let currentIndex = 0;

  function getCardMargins(card) {
    const s = getComputedStyle(card);
    return { left: parseFloat(s.marginLeft) || 0, right: parseFloat(s.marginRight) || 0 };
  }

  function getCardFullWidth(i) {
    const card = cards[i];
    const m = getCardMargins(card);
    return card.offsetWidth + m.left + m.right;
  }

  function computeOffsetForIndex(i) {
    let leftBefore = 0;
    for(let j=0;j<i;j++) leftBefore += getCardFullWidth(j);
    const card = cards[i];
    const cardLeft = leftBefore + getCardMargins(card).left;
    return (carousel.offsetWidth/2) - (cardLeft + card.offsetWidth/2);
  }

  function updateCarousel() {
    const offset = computeOffsetForIndex(currentIndex);
    track.style.transform = `translateX(${offset}px)`;
    cards.forEach((card, idx) => {
      card.classList.toggle('active', idx === currentIndex);
      const v = card.querySelector('video');
      if(v) {
        if(idx === currentIndex) v.play().catch(()=>{});
        else { v.pause(); v.currentTime=0; }
      }
    });
  }

  function nextVideo() { currentIndex = (currentIndex+1)%cards.length; updateCarousel(); }
  function prevVideo() { currentIndex = (currentIndex===0)?cards.length-1:currentIndex-1; updateCarousel(); }

  document.getElementById('prevBtn').addEventListener('click', prevVideo);
  document.getElementById('nextBtn').addEventListener('click', nextVideo);

  window.addEventListener('keydown', e => { if(e.key==='ArrowLeft') prevVideo(); if(e.key==='ArrowRight') nextVideo(); });
  window.addEventListener('resize', ()=>{ clearTimeout(window.__carouselResizeTimer); window.__carouselResizeTimer=setTimeout(updateCarousel,120); });

  // ✅ Centrare sigură a primului video la încărcare
  function ensureCentered() {
    const firstCardWidth = cards[0].offsetWidth;
    if(firstCardWidth > 0) {
      updateCarousel(); // cardurile au dimensiuni, centram
    } else {
      requestAnimationFrame(ensureCentered); // retry
    }
  }
  ensureCentered();
});
</script>
<a href="/" class="btn-back">← Back to Home</a>




