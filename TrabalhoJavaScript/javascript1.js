botao = document.getElementById("desenhar")

botao.onclick = function(){
	b1 = document.myForm.b1.value;
	b2 = document.myForm.b2.value;
	b3 = document.myForm.b3.value;
	b4 = document.myForm.b4.value;
	b5 = document.myForm.b5.value;

	largura = document.myForm.largura.value;

	document.myForm.i1.height = b1;
	document.myForm.i1.width = largura;
	document.myForm.i2.height = b2;
	document.myForm.i2.width = largura;
	document.myForm.i3.height = b3;
	document.myForm.i3.width = largura;
	document.myForm.i4.height = b4;
	document.myForm.i4.width = largura;
	document.myForm.i5.height = b5;
	document.myForm.i5.width = largura;

}