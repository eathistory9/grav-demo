---
title: Contact
body_classes: contact
slug: contact-us
---

<a href="/" class="btn-back">← Back to Home</a>

<div class="contact-wrapper">
  <!-- Stânga: Formular + text -->
  <div class="contact-left">
    <h1>Aenean vulputate eleifend tellus</h1>
    <p class="subtitle">Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</p>

    <form id="contactForm" class="contact-form" action="https://formspree.io/f/mkgvelge" method="POST">
      <div id="formMessage"></div>

      <div class="form-row">
        <input type="text" name="name" placeholder="Name" required>
        <input type="email" name="email" placeholder="Email" required>
      </div>
      <textarea name="message" placeholder="Your message..." required></textarea>
      <button type="submit" class="btn-submit">Submit</button>
    </form>
  </div>

  <!-- Dreapta: Contact info -->
  <div class="contact-right">
    <h3>Contact Info</h3>
    <p>✉️ Ataccusamus@elementum.ro</p>
    <p>📞 (570) 595-7321</p>
    <p>📍 Str Ex, Nr. 10, Aenean</p>
  </div>
</div>

<script>
const form = document.getElementById('contactForm');
const msgDiv = document.getElementById('formMessage');

form.addEventListener('submit', async function(e) {
  e.preventDefault();
  const formData = new FormData(form);

  try {
    const response = await fetch(form.action, {
      method: 'POST',
      body: formData,
      headers: { 'Accept': 'application/json' }
    });

    if (response.ok) {
      msgDiv.textContent = "The message was sent successfully!";
      msgDiv.style.opacity = "1";
      form.reset();
      setTimeout(() => { msgDiv.style.opacity = "0"; }, 4000);
    } else {
      const data = await response.json();
      msgDiv.textContent = data?.errors ? data.errors.map(e => e.message).join(", ") : "Oops! Ceva nu a mers.";
      msgDiv.style.opacity = "1";
      setTimeout(() => { msgDiv.style.opacity = "0"; }, 4000);
    }
  } catch (err) {
    msgDiv.textContent = "Oops! Something went wrong.";
    msgDiv.style.opacity = "1";
    setTimeout(() => { msgDiv.style.opacity = "0"; }, 4000);
  }
});
</script>
