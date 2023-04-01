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
        if (num % divisor == 0) 
            return false;
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
function tabelaPrimo(){
    const tabelaHTML = document.createElement("table")
    const corpoTb = document.createElement("tbody")

    //tabelaHTML = "<table><tr><th colspan='50'>Números Primos entre 0 e 200<tr><td>1";
    const limit = 200
    for (dividendo = 2; dividendo <= limit; dividendo++) {
        const linha = document.createElement("tr")
        if (primeNumber(dividendo)) { 
            const celula = document.createElement("td")
            celula.style.color = "red"
            const textoCelula = document.createTextNode(dividendo.toString()) 
            celula.appendChild(textoCelula)
            linha.appendChild(celula)
        }else{
            const celula1 = document.createElement("td")
            const textoCelula1 = document.createTextNode(dividendo.toString())
            celula1.appendChild(textoCelula1)
            linha.appendChild(celula1)
        }
        
        corpoTb.appendChild(linha)       
    }

    tabelaHTML.appendChild(corpoTb)
    
    document.getElementById("ex_10").append(tabelaHTML)
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
    
    var string = document.getElementById("strinvert").value
    var str = string.toString().split('')
    
    const p = document.createElement("p");
    p.innerHTML = ("reverse: "+str.reverse().join(''))
    document.getElementById("ex_12").appendChild(p)
}

function potenciaAleatorio(){
    const n1= Math.floor(Math.random() * 999);
    const n2= Math.floor(Math.random() * 9);
    var result=1
    for(i=0;i<n2;i++){
        result*=n1
    }

    const p = document.createElement("p");
    p.innerHTML = ("potencia de: "+n1+"^"+n2+" = "+result+"&nbsp")
    document.getElementById("ex_13").appendChild(p)
}

function potenciaEncheSaco(){

    const div = document.getElementById("ex_14")

    const p = document.createElement("p");
    const p1 = document.createElement("p");
    const p2 = document.createElement("p");
    const p3 = document.createElement("p");
    const p4 = document.createElement("p");
    const p5 = document.createElement("p");
    const p6 = document.createElement("p");
    const p7 = document.createElement("p");
    const p8 = document.createElement("p");

    p.innerHTML = ("2<sup>0</sup> = 1" + "<br>")
    p1.innerHTML = ("2<sup>1</sup> = " + (2*1) + "<br>")
    p2.innerHTML = ("2<sup>2</sup> = " + (2*2) + "<br>")
    p3.innerHTML = ("2<sup>3</sup> = " + (2*2*2) + "<br>")
    p4.innerHTML = ("2<sup>4</sup> = " + (2*2*2*2) + "<br>")
    p5.innerHTML = ("2<sup>5</sup> = " + (2*2*2*2*2) + "<br>")
    p6.innerHTML = ("2<sup>6</sup> = " + (2*2*2*2*2*2) + "<br>")
    p7.innerHTML = ("2<sup>7</sup> = " + (2*2*2*2*2*2*2) + "<br>")
    p8.innerHTML = ("2<sup>8</sup> = " + (2*2*2*2*2*2*2*2) + "<br>")

    document.getElementById("ex_14").appendChild(p)
    document.getElementById("ex_14").appendChild(p1)
    document.getElementById("ex_14").appendChild(p2)
    document.getElementById("ex_14").appendChild(p3)
    document.getElementById("ex_14").appendChild(p4)
    document.getElementById("ex_14").appendChild(p5)
    document.getElementById("ex_14").appendChild(p6)
    document.getElementById("ex_14").appendChild(p7)
    document.getElementById("ex_14").appendChild(p8)
}

function potenciaSacoEnche(){
    var e = 8
    const b = 2
    var result=1
    
    for (let i = 0; i <= e; i++) {
        if (i==0) {
            const p = document.createElement("p");
            p.innerHTML = ("2<sup>0</sup> = 1" + "<br>")
            document.getElementById("ex_15").appendChild(p)
        }else{
            for (let j = 0; j < i; j++) {
                result*=b
            }
    
            const p = document.createElement("p");
            p.innerHTML = ("2<sup>"+i+"</sup> = " + result)
            document.getElementById("ex_15").appendChild(p)
            result=1
        }    
    }
}

function potenciaDenovo() {

    var b = 2
    var e = 8

    for (let i = 0; i <= e; i++) {
        const p = document.createElement("p");
        p.innerHTML = ("2<sup>"+i+"</sup> = " + Math.pow(b,i))
        document.getElementById("ex_16").appendChild(p)
    }
    
}

function somaDiagonal() {
    
    var soma=0
    var ps=0
    var meuArray=[]

    meuArray[0] = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08"
    meuArray[1] = "49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00"
    meuArray[2] = "81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65"
    meuArray[3] = "52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91"
    meuArray[4] = "22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80"
    meuArray[5] = "24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50"
    meuArray[6] = "32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70"
    meuArray[7] = "67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21"
    meuArray[8] = "24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72"
    meuArray[9] = "21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95"
    meuArray[10]= "78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92"
    meuArray[11]= "16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57"
    meuArray[12]= "86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58"
    meuArray[13]= "19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40"
    meuArray[14]= "04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66"
    meuArray[15]= "88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69"
    meuArray[16]= "04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36"
    meuArray[17]= "20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16"
    meuArray[18]= "20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54"
    meuArray[19]= "01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"

    for (i in meuArray) {
        it = meuArray[i][ps] + meuArray[i][ps + 1]
        soma += parseInt(it)
        const p = document.createElement("p");
        p.innerHTML = ((it + ' - ' + soma))
        document.getElementById("ex_17").appendChild(p)
        ps += 3
    }
}

function calculaParesMatriz() {
    var meuArray=[]

    meuArray[0] = '73167176531330624919225119674426574742355349194934'
    meuArray[1] = '96983520312774506326239578318016984801869478851843'
    meuArray[2] = '85861560789112949495459501737958331952853208805511'
    meuArray[3] = '12540698747158523863050715693290963295227443043557'
    meuArray[4] = '66896648950445244523161731856403098711121722383113'
    meuArray[5] = '62229893423380308135336276614282806444486645238749'
    meuArray[6] = '30358907296290491560440772390713810515859307960866'
    meuArray[7] = '70172427121883998797908792274921901699720888093776'
    meuArray[8] = '65727333001053367881220235421809751254540594752243'
    meuArray[9] = '52584907711670556013604839586446706324415722155397'
    meuArray[10]= '53697817977846174064955149290862569321978468622482'
    meuArray[11]= '83972241375657056057490261407972968652414535100474'
    meuArray[12]= '82166370484403199890008895243450658541227588666881'
    meuArray[13]= '16427171479924442928230863465674813919123162824586'
    meuArray[14]= '17866458359124566529476545682848912883142607690042'
    meuArray[15]= '24219022671055626321111109370544217506941658960408'
    meuArray[16]= '07198403850962455444362981230987879927244284909188'
    meuArray[17]= '84580156166097919133875499200524063689912560717606'
    meuArray[18]= '05886116467109405077541002256983155200055935729725'
    meuArray[19]= '71636269561882670428252483600823257530420752963450'

    for (let i = 0; i < meuArray.length; i++) {
        var array = meuArray[i].split('');
        var soma=0
        array.forEach(element => {
            if (element%2 == 0) {
                soma+= parseInt(element)
            }
        })
        const p = document.createElement("p");
        p.innerHTML = (array.join('')+ ' = ' + soma)
        document.getElementById("ex_18").appendChild(p)
    }
    
}

function ordenaCrescente() {
    var arrString = document.getElementById("ordenaInput").value.split('')
    var tmp
    const p = document.createElement("p");
    p.innerHTML = ("Original: "+arrString+"&nbsp")
    document.getElementById("ex_19").appendChild(p)

    for (var i = 0; i < arrString.length - 1; i++) {
        for (var j = i + 1; j < arrString.length; j++) {
          if (arrString[i] > arrString[j]) {
            tmp = arrString[i];
            arrString[i] = arrString[j];
            arrString[j] = tmp;
          }
        }
      }
    
    const p1 = document.createElement("p")
    p1.innerHTML = ("Ordenada: "+arrString)
    document.getElementById("ex_19").appendChild(p1)
}