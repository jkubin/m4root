,a:function(){var u=this.parentNode,_,B,D;if(this.B){if(this.B.isConnected)u.removeChild(this.B);else u.appendChild(this.B);return}_=document.createElement("div");B=document.createElement("div");D=document.createElement("div");if(window.getSelection)_.onclick=D.onclick=function(){const z=window.getSelection();const y=document.createRange();y.selectNodeContents(this);z.removeAllRanges();z.addRange(y)};_.appendChild(document.createTextNode(this.title));D.appendChild(document.createTextNode(this.nextSibling.title.split('\n')[1]));B.appendChild(_);B.appendChild(D);u.appendChild(this.B=B)}