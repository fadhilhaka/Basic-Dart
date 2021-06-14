# Functional Programming

Functional programming adalah paradigma pemrograman di mana proses komputasi didasarkan pada fungsi matematika murni.

Functional programming (FP) ditulis dengan gaya deklaratif yang berfokus pada “what to solve” dibandingkan “how to solve” pada gaya imperatif.

## Pure Functions

Pure functions berarti sebuah fungsi bergantung pada argumen atau parameter yang dimasukkan ke dalamnya.

Sehingga pemanggilan fungsi dengan nilai argumen yang sama akan selalu memberikan hasil yang sama pula.

~~~
int sum(int num1, int num2) {
  return num1 + num2;
}
~~~

### Anonymous Functions

Pada Dart kita bisa membuat fungsi yang tidak bernama alias nameless atau anonymous. Anonymous function ini juga dikenal dengan nama lambda.

Untuk membuat lambda atau anonymous function kita cukup menuliskan tanda kurung untuk menerima parameter dan body function-nya.

Kita bisa menggunakan keyword **var** atau secara eksplisit menggunakan tipe data **Function**.

~~~
void main() {
  var sum = (int num1, int num2) {
    return num1 + num2;
  };
 
  Function printLambda = () {
    print('This is lambda function');
  };
}
~~~

Selain itu lambda juga mendukung function expression untuk membuat kode fungsi menjadi lebih ringkas dengan memanfaatkan fat arrow (=>).

~~~
var sum = (int num1, int num2) => num1 + num2;
Function printLambda = () => print('This is lambda function');
~~~

## Recursion

Pada functional programming tidak ada konsep perulangan seperti for atau while. Iterasi pada functional programming dilakukan melalui rekursi atau pemanggilan fungsi dari fungsi itu sendiri, hingga mencapai kasus dasar.

~~~
int fibonacci(n) {
  if (n <= 0) {
    return 0;
  } else if(n == 1) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}
~~~

## Immutable Variables

Variabel pada functional programming bersifat immutable, artinya kita tidak bisa mengubah sebuah variabel ketika sudah diinisialisasi.

Alih-alih mengubah nilai variabel, kita bisa membuat variabel baru untuk menyimpan data. Mekanisme ini bertujuan agar kode kita menjadi lebih aman karena state dari aplikasi tidak akan berubah sepanjang aplikasi berjalan.

## Functions are first-class citizen and can be higher-order

Maksud dari function merupakan first-class citizen adalah bahwa function berlaku sama seperti komponen pemrograman yang lain. Sebuah fungsi bisa dimasukkan ke variabel menjadi parameter dalam suatu fungsi dan juga menjadi nilai kembalian pada fungsi.

Higher order functions adalah fungsi yang mengambil fungsi lain sebagai argumen dan juga dapat mengembalikan fungsi.

### Higher-Order Functions

Kita bisa memanfaatkan lambda untuk membuat higher-order function. Higher order function adalah fungsi yang menggunakan fungsi lainnya sebagai parameter, menjadi tipe kembalian, atau keduanya.

~~~
void myHigherOrderFunction(String message, Function myFunction) {
  print(message);
  print(myFunction(3, 4));
}

// Opsi 1
Function sum = (int num1, int num2) => num1 + num2;
myHigherOrderFunction('Hello', sum);
 
 
// Opsi 2
myHigherOrderFunction('Hello', (num1, num2) => num1 + num2);
~~~

Namun deklarasi higher order function ini bisa menjadi sedikit tricky. Karena kita tidak menentukan spesifikasi dari fungsi seperti jumlah parameter atau nilai kembaliannya, maka semua jenis fungsi akan bisa dijalankan termasuk bila parameter dari fungsi yang dibutuhkan tidak lengkap, hingga menyebabkan crash.

Untuk mengatasinya kita bisa lebih spesifik menentukan seperti apa fungsi yang valid untuk menjadi parameter.

~~~
void myHigherOrderFunction(String message, int Function(int num1, int num2) myFunction) { }
~~~

Pada fungsi di atas kita perlu memasukkan fungsi dengan dua parameter dan nilai kembali berupa int sebagai parameter.

## Closures

Suatu fungsi dapat dibuat dalam lingkup global atau di dalam fungsi lain. Suatu fungsi yang dapat mengakses variabel di dalam lexical scope-nya disebut dengan closure.

Lexical scope berarti bahwa pada sebuah fungsi bersarang (nested functions), fungsi yang berada di dalam memiliki akses ke variabel di lingkup induknya.

~~~
void main() {
  var closureExample = calculate(2);
  closureExample();
  closureExample();
}
 
Function calculate(base) {
  var count = 1;
 
  return () => print("Value is ${base + count++}");
}

// output
Value is 3
Value is 4
~~~

Karena variabel **count** berada pada scope **calculate**, maka umumnya variabel tersebut akan hilang atau dihapus ketika fungsinya selesai dijalankan. 

Namun pada kasus di atas fungsi lambda atau **closureExample** masih memiliki referensi atau akses ke variabel **count** sehingga bisa diubah.

Variabel pada mekanisme di atas telah tertutup (close covered), yang berarti variabel tersebut berada di dalam closure.