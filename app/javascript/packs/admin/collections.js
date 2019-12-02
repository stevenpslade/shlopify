setupReader = file => {
  var reader = new FileReader();  
  reader.onload = function(e) {
    let img       = document.createElement('img');
    img.src       = e.target.result;
    img.id        = 'collectionImage';
    img.className = 'block h-full w-full bg-white object-contain border rounded border-gray-300';

    let collectionImageContainer = document.getElementById('collectionImageContainer');
    collectionImageContainer.appendChild(img);
  }

  reader.readAsDataURL(file);
};

document.getElementById('collection_image').onchange = e => {
  document.getElementById('addImageLabel').classList.add('hidden');
  for (var i = 0; i < e.target.files.length; i++) {
    setupReader(e.target.files[i]);
  }

  document.getElementById('removeImage').classList.remove('hidden');
};

document.getElementById('removeImage').onclick = e => {
  document.getElementById('collection_image').value = '';
  document.getElementById('collectionImage').remove();
  document.getElementById('addImageLabel').classList.remove('hidden');
  e.target.classList.add('hidden');
};