function caixaAlerta()
{
    alert("PUTS DEU RUIM!!!!!!!")
}

function maior(){
    var num1 = parseFloat(document.getElementById("numero1").value);
    var num2 = parseFloat(document.getElementById("numero2").value);
    var num3 = parseFloat(document.getElementById("numero3").value);

    var maior = num1;

    if(num2 > maior)
     maior = num2;
    if(num3 > maior)
     maior = num3;

    alert("Maior: "+maior);
   }

function maiorIdade(){
    var num1 = parseInt(document.getElementById("idade").value);

    if(num1<18)
        alert("Menor de idade!")

    alert("Maior de Idade!")
}

function mediaAritimetica(){
    var num1 = parseFloat(document.getElementById("n1").value);
    var num2 = parseFloat(document.getElementById("n2").value);
    var num3 = parseFloat(document.getElementById("n3").value);

    var mediaArt= (num1+num2+num3)/3;

    alert("Media = "+mediaArt);
}

function calcularIMC(){
    var num1 = parseFloat(document.getElementById("peso").value);
    var num2 = parseFloat(document.getElementById("altura").value);
    var imc = num1/(Math.pow(num2,2))

    const p = document.createElement("p");
    
    p.innerHTML = ('IMC = '+imc)

    document.getElementById("ex_06").appendChild(p)
}

function somaMultiplos(){
    var soma = 0;

    for(i=0;i<=1000;i++){
        if(i%3==0 || i%5==0)
        soma += i
    }

    const p = document.createElement("p");
    p.innerHTML = ('Soma multiplo 3 e 5 = '+soma)
    document.getElementById("ex_07").appendChild(p)
}

function fibonacciSoma(){
    const limit = 50000;
    var n1=0 
    var n2=1
    var nt=n1+n2
    var soma=0

    while(nt<=limit){
        if(nt%2 == 0){
            soma+=nt
        }

        n1=n2
        n2=nt
        nt=n1+n2
    }

    const p = document.createElement("p");
    p.innerHTML = ('Soma elementos pares fibonacci = '+soma)
    document.getElementById("ex_08").appendChild(p)
}

function primeNumber(num) {
    for (var divisor = 2; divisor < num; divisor++) 
    if (num % divisor == 0) return false;
    return true;
}

function primoNum(){
    var n1=3
    var i=1
    var result

    while(i<1001){
        if(primeNumber(n1)){
            i+=1
            result=n1
        }

        n1+=1
    }

    const p = document.createElement("p");
    p.innerHTML = ('numero Primo 1001 = '+result)
    document.getElementById("ex_09").appendChild(p)
}
/*preciso terminar */
function tabela_primo(){
    const p = document.createElement("p");
    p.innerHTML = ('nada para ver aqui')
    document.getElementById("ex_10").appendChild(p)
}

function calculaDelta(){
    var a, b, c, delta
    a=2 
    b=8 
    c= -24

    delta = (Math.pow(b,2))-(4*a*c)

    const p = document.createElement("p");
    const p1 = document.createElement("p");
    const p2 = document.createElement("p");
    p.innerHTML = ('Delta ='+b+'^2 - 4*'+a+'*('+c+')')
    document.getElementById("ex_11").appendChild(p)
    p1.innerHTML = ('Delta ='+Math.pow(b,2)+' - ('+4*a*c+')')
    document.getElementById("ex_11").appendChild(p1)
    p2.innerHTML = ('Delta = '+delta)
    document.getElementById("ex_11").appendChild(p2)
}

function invertString(){
    var string = ""
    string = document.getElementById("stringinvert")
    var str = string.split()
    var reverseString = str.reverse()
    var stringinvertida = reverseString.join('')
    
    const p = document.createElement("p");
    p.innerHTML = ("reverse: "+stringinvertida)
    document.getElementById("ex_12").appendChild(p)
}