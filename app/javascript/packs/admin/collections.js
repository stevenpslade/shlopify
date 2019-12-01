setupReader = file => {
  var name = file.name;
  var reader = new FileReader();  
  reader.onload = function(e) {
    let img       = document.createElement('img');
    img.src       = e.target.result;
    img.className = 'block h-full w-full bg-white object-contain border rounded border-gray-300';

    let collectionImageContainer = document.getElementById('collectionImageContainer');
    collectionImageContainer.appendChild(img);
  }

  reader.readAsDataURL(file);
};

document.getElementById('collection_image').onchange = () => {
  document.getElementById('addImageLabel').classList.add('hidden');
  for (var i = 0; i < this.files.length; i++) {
    setupReader(this.files[i]);
  }
};

document.getElementById('removeImage').onclick = () => {
  console.log('clicked');
};