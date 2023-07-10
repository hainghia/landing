function showUrl(element) {
    let url = element.getAttribute('href');
    let codeElement = document.getElementById('urlCode');
    codeElement.innerText = url;
    codeElement.style.display = 'inline-block';
}

function hideUrl(element) {
    let codeElement = document.getElementById('urlCode');
    codeElement.style.display = 'none';
}