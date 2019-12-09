class TagList {
  constructor() {
    this.tagNamesInput = document.getElementById('tag_names_input');
    this.tagNamesEntryInput = document.getElementById('tag_names_entry_input');
    this.tagArray = this.tagNamesInput.value.split(',');

    this.watchInputField();
  }

  assignInputValue = () => {
    this.tagNamesInput.value = this.tagArray.join(',');
  }

  watchInputField = () => {
    this.tagNamesEntryInput.oninput = e => {
      let inputVal = e.target.value;
      let lastChar = inputVal.charAt(inputVal.length - 1);
      if (lastChar === ',') {
        this.addTag(this.cleanTagName(inputVal));
        this.tagNamesEntryInput.value = '';
      }
    }
  }

  addTag = name => {
    if (this.tagArray.indexOf(name) === -1 && name !== '') {
      this.tagArray.push(name);
      this.assignInputValue();
      this.addTagToContainer(name);
    }
  }

  removeFromTagArray = name => {
    let tagIndex = this.tagArray.indexOf(name);
    if (tagIndex) {
      this.tagArray.splice(tagIndex, 1);
      this.assignInputValue();
    }
  }

  cleanTagName = name => {
    // removes white spaces and trailing/leading commas
    return name.replace(/(^,)|(,$)/g, '').trim();
  }

  addTagToContainer = name => {
    let span = document.createElement('span');
    span.className = 'text-gray-700 hover:text-gray-400 bg-gray-200 hover:bg-red-100 rounded px-2 py-1 m-1 shadow hover:shadow-none text-center tracking-wide leading-none text-xs font-semibold cursor-pointer select-none';
    span.innerHTML = "&times; " + name;
    span.onclick = this.removeTag.bind(this);
    span.dataset.tagname = name;

    const tagContainer = document.getElementById('tagContainer');
    tagContainer.appendChild(span);
  }

  removeTag = e => {
    let tagElement = e.target;
    let tagName = tagElement.dataset.tagname;
    this.removeFromTagArray(tagName);
    tagElement.remove();
  }
}

window.tagList = new TagList();