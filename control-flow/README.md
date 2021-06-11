# Control Flow

## If-else

Ekspresi **if** akan menguji suatu kondisi. Jika hasil ekspresi tersebut bernilai true, maka blok kode di dalamnya akan dijalankan. Sebaliknya, jika bernilai false maka proses yang ditentukan akan dilewatkan.

Anda juga dapat mengecek beberapa kondisi sekaligus dengan menggabungkan **else** dan **if**.

~~~
void main() {
  stdout.write('Inputkan nilai Anda (1-100) : ');
  var score = num.parse(stdin.readLineSync());
  
  print('Nilai Anda: ${calculateScore(score)}');
}
 
String calculateScore(num score) {
  if (score > 90) {
    return 'A';
  } else if (score > 80) {
    return 'B';
  } else if (score > 70) {
    return 'C';
  } else if (score > 60) {
    return 'D';
  } else {
    return 'E';
  }
}
~~~

Fitur menarik lain dari Dart adalah **conditional expressions**. Dengan ini kita bisa menuliskan **if-else** statement hanya dalam satu baris.

~~~
// condition ? true expression : false expression
 
var shopStatus = now > openHours ? "Hello, we're open" : "Sorry, we've closed";
~~~

Selain itu Dart juga mendukung **conditional expressions** seperti berikut:

~~~
// expression1 ?? expression2
var buyer = name ?? 'user';
~~~

Pada kode di atas jika variabel name tidak bernilai **null**, maka buyer akan menyimpan nilai dari name. Namun jika tidak, buyer akan berisi **‘user’**.

## For Loops

Dart memiliki banyak opsi untuk melakukan perulangan kode, salah satunya adalah for. For cocok digunakan pada kondisi perulangan di mana kita membutuhkan variabel indeks dan tahu berapa kali perulangan yang kita butuhkan.

~~~
for (int i = 1; i <= 100; i++) {
  print(i);
}
~~~

Lebih ringkas bukan? Terdapat tiga bagian utama dalam sintaks for di atas:

1. Variabel index yang seringkali diberi nama i yang berarti index. Pada variabel ini kita menginisialisasi nilai awal dari perulangan yang kita lakukan.
2. Operasi perbandingan. Pada bagian ini komputer akan melakukan pengecekan kondisi apakah perulangan masih perlu dilakukan. Jika bernilai **true** maka kode di dalam blok **for** akan dijalankan.
3. Increment/decrement. Di sini kita melakukan penambahan atau pengurangan variabel index. Jadi pada contoh di atas variabel indeks akan ditambah dengan 1 di setiap akhir perulangan.

~~~
for (int i = 1; i <= 10; i++) {
    print(*)
}
~~~

## While and Do-while

Metode lain untuk melakukan perulangan adalah dengan **while**. Sama seperti **for**, instruksi while mengevaluasi ekspresi boolean dan menjalankan kode di dalam blok **while** ketika bernilai **true**.

~~~
var i = 1;
 
while (i <= 100) {
  print(i);
  i++;
}
~~~

Bisa dilihat pada kode di atas bahwa perulangan dengan while tidak memiliki ketergantungan dengan variabel index seperti pada for loop. Karena itu, meskipun while dapat melakukan perulangan yang sama dengan for, while lebih cocok digunakan pada kasus di mana kita tidak tahu pasti berapa banyak perulangan yang diperlukan.

Bentuk lain dari while adalah perulangan do-while.

~~~
do {
  print(i);
  i++;
} while (i <= 100);
~~~

Kondisi pada **while** akan dievaluasi sebelum blok kode di dalamnya dijalankan, sedangkan **do-while** akan mengevaluasi boolean expression setelah blok kodenya dijalankan. Ini artinya kode di dalam **do-while** akan dijalankan setidaknya satu kali.

~~~
String username;
bool notValid = false;
 
do {
  stdout.write('Masukkan nama Anda (min. 6 karakter): ');
  username = stdin.readLineSync();
 
  if (username.length < 6 ) {
    notValid = true;
    print('Username Anda tidak valid');
  } else {
    notValid = false;
    print('Username Anda: $username');
  }
} while (notValid);
~~~

Pada contoh di atas jika **username** yang dimasukkan oleh user kurang dari 6 karakter, maka input tersebut tidak valid dan user akan diminta lagi untuk memasukkan **username**.

### Infinite Loops

Infinite loop atau endless loop adalah kondisi di mana program kita stucked di dalam perulangan. Ia akan berjalan terus hingga menyebabkan crash pada aplikasi dan komputer kecuali ada intervensi secara eksternal, seperti mematikan aplikasi.

~~~
var i = 1;
 
while (i < 5) {
  print(i);
}
~~~

Variabel i selalu bernilai 1, sehingga kondisi i < 5 akan selalu bernilai true dan akibatnya aplikasi akan terus mencetak 1 ke konsol sehingga mengalami crash.

## Break and Continue

Kita bisa menggunakan **break** untuk menghentikan dan keluar dari proses iterasi.

~~~
void main() {
  // 20 bilangan prima pertama
  var primeNumbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71];
  stdout.write('Masukkan bilangan prima : ');
  var searchNumber = int.parse(stdin.readLineSync());
 
  for (int i = 0; i < primeNumbers.length; i++) {
    if (searchNumber == primeNumbers[i]) {
      print('$searchNumber adalah bilangan prima ke-${i+1}');
      break;
    }
    print('$searchNumber != ${primeNumbers[i]}');
  }
}
~~~

Ketika kode di atas dijalankan, proses iterasi akan dihentikan ketika angka yang diinputkan pengguna sama dengan bilangan prima yang dicari.

Keyword lain yang berguna pada proses perulangan adalah **continue**. Dengan **continue** kita bisa melewatkan proses iterasi dan lanjut ke proses iterasi berikutnya.

~~~
void breakContinue() {
  for (int i = 1; i <= 10; i++) {
    if (i % 3 == 0) {
      continue;
    }
    print(i);
  }
}
 
/*
output :
  1
  2
  4
  5
  7
  8
  10
*/
~~~

## Switch-case

Dart mendukung statement switch untuk melakukan pengecekan banyak kondisi dengan lebih mudah dan ringkas.

~~~
switch (variable/expression) {
  case value1:
    // do something
    break;
  case value2:
    // do something
    break;
  ...
  ...
  default:
    // do something else
}
~~~

Tanda kurung setelah keyword **switch** berisi variabel atau ekspresi yang akan dievaluasi. Kemudian untuk setiap kondisi yang mungkin terjadi kita masukkan keyword **case** diikuti dengan nilai yang valid.

Jika kondisi pada **case** sama dengan variabel pada **switch**, maka blok kode setelah titik dua (:) akan dijalankan.

Keyword **break** digunakan untuk keluar dari proses **switch**. 

Terdapat satu **case** bernama **default** yang memiliki fungsi yang sama dengan keyword **else** pada control flow **if-else**. Jika tidak ada nilai yang sama dengan variabel pada **switch** maka blok kode ini akan dijalankan.

~~~
stdout.write('Masukkan angka pertama : ');
var firstNumber = num.parse(stdin.readLineSync());
stdout.write('Masukkan operator [ + | - | * | / ] : ');
var operator = stdin.readLineSync();
stdout.write('Masukkan angka kedua : ');
var secondNumber = num.parse(stdin.readLineSync());
 
switch (operator) {
  case '+':
    print('$firstNumber $operator $secondNumber = ${firstNumber + secondNumber}');
    break;
  case '-':
    print('$firstNumber $operator $secondNumber = ${firstNumber - secondNumber}');
    break;
  case '*':
    print('$firstNumber $operator $secondNumber = ${firstNumber * secondNumber}');
    break;
  case '/':
    print('$firstNumber $operator $secondNumber = ${firstNumber / secondNumber}');
    break;
  default:
    print('Operator tidak ditemukan');
}
~~~