const initCopy = () => {
  const button = document.querySelector("#copy-button");
  const copyText = document.querySelector("#url-input");

  const copy = button.addEventListener('click', (event) => {
    copyText.select();
    copyText.setSelectionRange(0, 99999); /*For mobile devices*/
    document.execCommand("copy");
    alert("Copied the text: " + copyText.value);
  });
};

export { initCopy };
