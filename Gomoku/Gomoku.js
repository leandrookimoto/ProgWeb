var p1 = new Image();
p1.src =  'Image/P1.png';
var p3 = new Image();
p3.src =  'Image/P3.png';
var p7 = new Image();
p7.src =  'Image/P7.png';
var p9 = new Image();
p9.src =  'Image/P9.png';
p5b =  'P5b.png';
p5p =  'P5p.png';
var peca1 = document.getElementById("peca1");
var peca2 = document.getElementById("peca2");
var imgTable = new Array(16);
var i;
var j;
var suaVez = 0;
var ganhou = false;
var table = document.getElementById("tabuleiro");
var btnIniciar = document.getElementById("iniciar");


table.setAttribute('border-spacing','0');
for (i = 0; i <= 16; i++){
    var tr = document.createElement('tr');
    imgTable[i] = new Array(16);
    for (j = 0; j<=16; j++) {
        var td = document.createElement('td');
        td.setAttribute('rowSpan', '0');
        if (i==0 && j==0) {
            td.appendChild(p1);
        }else if (i==0 && j==16) {
            td.appendChild(p3);
        }else if (i==16 && j==0) {
            td.appendChild(p7);
        }else if (i==16 && j==16) {
            td.appendChild(p9);
        }else if(i==0){
            var p2 = new Image();
            p2.src =  'Image/P2.png';
            td.appendChild(p2);
        }else if(j==0){
            var p4 = new Image();
            p4.src =  'Image/P4.png';
            td.appendChild(p4);
        }else if(i==16){
            var p8 = new Image();
            p8.src =  'Image/P8.png';
            td.appendChild(p8);
        }else if(j==16){
            var p6 = new Image();
            p6.src =  'Image/P6.png';
            td.appendChild(p6);
        }else{
            var p5 = new Image();
            p5.src =  'Image/P5.png';
            var a = document.createElement('a');
            p5.id = i + '-' + j;
            //a.id = i+'-'+j;
            imgTable[i][j] = p5;
            a.onclick=function(element){
                if(!ganhou){
                    var img = document.getElementById(element.target.id);
                    var imgNameIdx = img.src.lastIndexOf("/") + 1;
                    var imgName = img.src.substr(imgNameIdx);
                    var i = parseInt(element.target.id.split("-")[0]);
                    var j = parseInt(element.target.id.split("-")[1]);
                    if (imgName=='P5b.png' || imgName=='P5p.png') {
                        alert("Já existe uma peça aí! ");
                    }else{
                        if(suaVez%2 ==0){
                            peca1.style.backgroundColor="inherit";
                            peca2.style.backgroundColor="#3bb300";
                            peca1.style.opacity="0.5";
                            peca2.style.opacity="1.0";

                            img.src = 'Image/'+p5b;
                            imgTable[i][j] = img;
                            suaVez++;
                            ganhou = pos1(i,j,0,p5b)||pos2(i,j,0,p5b)||pos3(i,j,0,p5b)||pos4(i,j,0,p5b);
                            if(ganhou){
                                alert("BRANCO GANHOU");
                            }

                        }else{
                            peca1.style.backgroundColor="#3bb300";
                            peca2.style.backgroundColor="inherit";
                            peca1.style.opacity="1.0";
                            peca2.style.opacity="0.5";
                            img.src = 'Image/'+p5p;
                            imgTable[i][j] = img;
                            suaVez++;
                            ganhou = pos1(i,j,0,p5p)||pos2(i,j,0,p5p)||pos3(i,j,0,p5p)||pos4(i,j,0,p5p);
                            if(ganhou){
                                alert("PRETO GANHOU");
                            }
                        }
                    }
                }
            }
            a.appendChild(p5)
            td.appendChild(a);
        }


        tr.appendChild(td);
    }

    table.appendChild(tr);
}

btnIniciar.onclick = function(){

    for (i = 1; i <16 ; i++) {
       for(j=1; j<16; j++){
            imgTable[i][j].src='Image/P5.png';
            ganhou=false;
            peca1.style.backgroundColor="#3bb300";
            peca2.style.backgroundColor="inherit";
            peca1.style.opacity="1.0";
            peca2.style.opacity="0.5";
            suaVez=0;
       }
    }

}

function pos1(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count++;
            if (count==5){
                return true;
            }else{
                return false || pos1(k-1,l-1,count,imgAtual);
            }
        }
    }
    return pos9(k+count+1,l+count+1,count,imgAtual);
}

function pos2(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count ++;
            if (count==5){
                return true;
            }else{
                return false || pos2(k-1,l,count,imgAtual);
            }
        }
    }
    return pos8(k+count+1,l,count,imgAtual);
}

function pos3(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count++;
            if (count>=5){
                return true;
            }else{
                return false || pos3(k-1,l+1,count,imgAtual);
            }
        }
    }
    return pos7(k+count+1,l-count-1,count,imgAtual);
}

function pos4(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count++;
            if (count>=5){
                return true;
            }else{
                return false || pos4(k,l-1,count,imgAtual);
            }
        }
    }
    return pos6(k,l+count+1,count,imgAtual);
}

function pos6(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count++;
            if (count>=5){
                return true;
            }else{
                return false || pos6(k,l+1,count,imgAtual);
            }
        }
    }
    return false;
}

function pos7(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count++;
            if (count>=5){
                return true;
            }else{
                return false || pos7(k+1,l-1,count,imgAtual);
            }
        }
    }
    return false;
}

function pos8(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count++;
            if (count>=5){
                return true;
            }else{
                return false || pos8(k+1,l,count,imgAtual);
            }
        }
    }
    return false;
}

function pos9(k, l , count, imgAtual){
    if(k>=1 && k<=15 && l>=1 && l<=15){
        var img = imgTable[k][l];
        var imgNameIdx = img.src.lastIndexOf("/") + 1;
        var imgName = img.src.substr(imgNameIdx);
        if (imgAtual==imgName) {
            count++;
            if (count>=5){
                return true;
            }else{
                return false || pos9(k+1,l+1,count,imgAtual);
            }
        }
    }
    return false;
}
