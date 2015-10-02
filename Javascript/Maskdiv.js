function OpenModelPopup(i) {
    var sHTML;
    if (i == 'test') { sHTML = document.forms[0].txtHTMLEmbedTag.value; }
    else { sHTML = i; }
    document.getElementById('ModalPopupDiv').style.visibility = 'visible';
    document.getElementById('ModalPopupDiv').style.display = '';
    document.getElementById('ModalPopupDiv').style.top = Math.round((document.documentElement.clientHeight / 2) + document.documentElement.scrollTop) - 100 + 'px';
    document.getElementById('ModalPopupDiv').style.left = '220px';

    document.getElementById('MaskedDiv').style.display = '';
    document.getElementById('MaskedDiv').style.visibility = 'visible';
    document.getElementById('MaskedDiv').style.top = '20px';
    document.getElementById('MaskedDiv').style.left = '10px';
    document.getElementById('MaskedDiv').style.width = document.documentElement.clientWidth + 'px';
    document.getElementById('MaskedDiv').style.height = document.documentElement.clientHeight + 'px';
    //var ImgPath = '/ImgMaskedDiv/' + i.title;
    //document.getElementById('imgMaskShow').src = ImgPath;
    document.getElementById('imgMaskShow').innerHTML = sHTML;
}
function CloseModelPopup() {
    document.getElementById('MaskedDiv').style.display = 'none';
    document.getElementById('ModalPopupDiv').style.display = 'none';
}
    