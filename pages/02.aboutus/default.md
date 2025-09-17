---
title: 'About Us'
body_classes: about
slug: about-us
---

<div class="about-wrapper">
  <!-- Coloana stânga: text -->
  <div class="about-text">
    <h1>About Us</h1>
    <p>
     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. 
Aenean commodo ligula eget dolor. Aenean massa. 
Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.
 Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, 
 arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. 
 Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.
  Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. 
  Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum.
   Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. 
   Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. 
   Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus.
      <!-- continuă textul descriptiv aici -->
    </p>
  </div>

  <!-- Coloana dreapta: slideshow -->
  <div class="about-image">
    <div class="slideshow">
      <img id="slideshow-img" src="user/pages/02.aboutus/images/about1.jpg" alt="Foto echipă">
      <button class="prev">&#10094;</button>
      <button class="next">&#10095;</button>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
  const images = [
    "user/pages/02.aboutus/images/about1.jpg",
    "user/pages/02.aboutus/images/about2.jpg",
    "user/pages/02.aboutus/images/about3.jpg"
  ];
  let index = 0;
  const imgElement = document.getElementById("slideshow-img");
  const prevBtn = document.querySelector(".prev");
  const nextBtn = document.querySelector(".next");

  function showImage(i) {
    index = (i + images.length) % images.length;
    imgElement.style.opacity = 0;
    setTimeout(() => {
      imgElement.src = images[index];
      imgElement.style.opacity = 1;
    }, 300);
  }

  prevBtn.addEventListener("click", () => showImage(index - 1));
  nextBtn.addEventListener("click", () => showImage(index + 1));

  showImage(0);
});
</script>

<a href="/" class="btn-back">← Back to Home</a>
