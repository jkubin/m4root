init:function(b,c,u,I,f,g){var d,e,h,k,l,m=[],o,p=[],i,r,s,t,x,y,z,C,D,E,G;for(E of c){y=E.y=E.firstElementChild,s=y.innerHTML.split('\n').length,D=y.nextElementSibling;G=document.createElement("pre");G.className=I;if(D&&D.tagName=="CODE")D.firstChild.onclick=this.a;for(i=0;i<s;i++){e=document.createElement("div");if(i&1)e.className=f;G.appendChild(e)}E.insertBefore(G,y)}for(k of b){C=Object.keys(k.dataset);for(i of C){E=c[i];if(!E.n)E.n=[];E.n.push({v:k,J:k.dataset[i]})}k.onmouseover=function(){var h;if(this.o)for(h of this.o)h.v.classList.add(h.J);if(this.m)for(h of this.m)h.v.classList.add(...h.J)};k.onmouseout=function(){var h;if(this.o)for(h of this.o)h.v.classList.remove(h.J);if(this.m)for(h of this.m)h.v.classList.remove(...h.J)}}for(E of c){if(!E.n)continue;G=E.firstElementChild;for(h of E.n){h.J=h.J.replace(/[A-Z]|[a-z]+|#[\da-f]{3,6}|\d+-\d+/g,'"$&"').replace(/^:/,'"":');h.J=/:/.test(h.J)?"{"+h.J+"}":'{"":['+h.J+']}';x=JSON.parse(h.J,function(q,J){if(/^[A-Z]$/.test(J)){m.push(u+J);return undefined}if(/^\d+-\d+$/.test(J)){l=J.split('-');r=parseInt(l[1]);for(i=l[0]-1;i<r;i++)p.push(i);return undefined}if(Number.isInteger(J))return J>0?J-1:undefined;if(Array.isArray(J)){J=J.filter(function(){return true}).concat(p);p=[];return J.length?J:undefined}if(typeof J==='object')return J;return undefined});if(m.length){if(!h.v.m)h.v.m=[];h.v.m.push({v:E.y,J:m});m=[]}o=Object.keys(x);if(o.length){if(!h.v.o)h.v.o=[];for(d of o){t=x[d];z=d?u+d:g;for(i of t)h.v.o.push({v:G.children[i],J:z})}}}}}