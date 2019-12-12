setupReader = file => {
  var name = file.name;
  var reader = new FileReader();  
  reader.onload = function(e) {
    let img   = document.createElement('img');
    img.src   = e.target.result;
    img.width = '160';

    let div       = document.createElement('div');
    div.className = 'p-2';
    div.appendChild(img);

    let imagePreviewContainer = document.getElementById('imagePreviewContainer');
    imagePreviewContainer.appendChild(div);
  }

  reader.readAsDataURL(file);
}

document.getElementById('product_images').onchange = (e) => {
  let imagePreviewContainer = document.getElementById('imagePreviewContainer');
  imagePreviewContainer.innerHTML = '';
  imagePreviewContainer.classList.remove('hidden');
  for (var i = 0; i < e.target.files.length; i++) {
    setupReader(e.target.files[i]);
  }
};


document.body.addEventListener('ajax:success', function(event) {
  event.target.parentNode.remove();
});