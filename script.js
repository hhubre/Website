// Minimal interactivity: handle pseudo-contact form and show a small confirmation
function handleForm(e){
  e.preventDefault();
  const form = e.currentTarget;
  const data = new FormData(form);
  const name = data.get('name')||'ami';
  // show a light inline confirmation
  const hint = document.createElement('div');
  hint.textContent = `Merci ${name} — message reçu (exemple) !`;
  hint.style.marginTop = '10px';
  hint.style.color = '#9ee7f6';
  form.appendChild(hint);
  form.reset();
  return false;
}

// Expose the function so the inline `onsubmit` can call it in the HTML file
window.handleForm = handleForm;
