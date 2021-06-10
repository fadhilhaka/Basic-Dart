# Dart Fundamental

## Comments

Comments merupakan kode yang ditulis dalam suatu program tetapi tidak dijalankan oleh komputer.

Comment akan dilewatkan ketika proses kompilasi, sehingga tidak akan memengaruhi alur program yang kita tulis. Komentar bisa digunakan sebagai dokumentasi yang menjelaskan kode yang kita tulis.

Terdapat tiga jenis komentar yang bisa digunakan pada Dart:

1. Single-line Comment

    ~~~
    // Single line comment
    ~~~

2. Multi-line Comment

    ~~~
    /*
    multi
    line
    comment
    */
    ~~~

3. Documentation Comment

    Comment jenis ini dapat berupa single-line comment atau multi-line comment yang diawali dengan /// atau /*.

    Di dalam documentation comment, kompiler Dart akan mengabaikan semua teks kecuali yang tertutup dalam kurung siku (**[]**). Jika Anda menggunakan IDE lalu menekan **Ctrl** dan mengarahkan ke teks di dalam kurung siku, maka Anda akan dapat klik dan mengarah ke kode referensinya.

    ~~~
    /// Fungsi [main] akan menampilkan 2 output
    /// Output pertama menampilkan teks dan output kedua menampilkan hasil perkalian pada library [Belajar_Dart]
    void main(List<String> arguments) {
      // Mencetak Hello Dart! Dart is great. pada konsol
      print('Hello Dart! Dart is great.');
      // Testing documentation comment with [].
      print('6 * 7 = ${Belajar_Dart.calculate()}');
    }
    
    
    /*
      output:
        Hello Dart! Dart is great.
        6 * 7 = 42
    */
    ~~~

### Variables

~~~
var greetings = 'Hello Dart!';
~~~

Perhatikan tanda sama dengan (**=**) di atas. Simbol tersebut dikenal dengan assignment operator. Kode di atas berarti kita memasukkan nilai ‘Hello Dart!’ ke dalam sebuah kotak atau variabel yang bernama greetings. Proses assignment nilai ke variabel ini disebut inisialisasi.

~~~
var myAge;
myAge = 20;
print(myAge);
~~~

Proses ini disebut dengan deklarasi variabel. Deklarasi variabel akan menyimpan nama dan ruang di dalam memori tanpa memberikan nilai. Anda dapat menginisialisasi nilai setelah deklarasi sesuai dengan kebutuhan Anda.

Setiap deklarasi variabel akan memberikan nilai default berupa null. Ini berarti variabel tersebut belum terinisialisasi atau bisa dibilang variabel Anda tidak memiliki nilai atau null.

### Data Types

Dengan tipe data, komputer dapat menghindari operasi yang tidak mungkin serta bisa menghasilkan bug, misalnya seperti perkalian karakter alfabet atau mengubah angka menjadi kapital.

Dart adalah bahasa yang mendukung type inference.

Ketika variabel dideklarasikan dengan var, Dart akan secara otomatis menentukan tipe datanya.

~~~
var greetings = 'Hello Dart!';  // String
var myAge = 20;                 // integers
~~~

Tipe data variabel tetap bisa dideklarasikan secara eksplisit untuk menghindari kebingungan dan memudahkan proses debugging.

~~~
String greetings = 'Hello Dart!';
int myAge = 20;
~~~

Beberapa tipe data yang didukung oleh Dart antara lain:

| Tipe | Deskripsi | Contoh |
|------|-----------|--------|
| int |	Integer | (bilangan bulat)	5, -7, 0 |
| double |Bilangan desimal | 3.14, 18.0, -12.12 |
| num |	Bilangan bulat dan bilangan desimal	| 5, 3.14, -99.00 |
| bool | Boolean | true, false |
| String | Teks yang terdiri dari 0 atau beberapa karakter | ‘Dicoding’, ‘Y’, ‘’ |
| List | Daftar nilai |	[1, 2, 3], [‘a’, ‘b’, ‘c’] |
| Map |	Pasangan key-value | {“x”: 4, “y”: 10} |
| dynamic |	Tipe apa pun | |

Ketika variabel dideklarasikan tanpa inisialisasi, variabel akan memiliki tipe dynamic.

~~~
var x;  // dynamic
x = 7;
x = 'Dart is great';
print(x);
~~~

Kode di atas tetap bisa berjalan dan menampilkan pesan ‘Dart is great’ tanpa ada masalah. Berbeda jika kita menginisialisasi nilai variabel x secara langsung. Akibatnya, editor akan menampilkan eror karena terjadi perubahan tipe data.

~~~
var x = 7;  // int
x = 'Dart is great'; // Kesalahan assignment
print(x);
~~~

### Menerima Input User

Selain menampilkan pesan ke konsol, kita juga dapat menerima input pengguna untuk selanjutnya diproses dan ditampilkan. Ini memungkinkan kita dapat membuat aplikasi yang interaktif dengan pengguna.

Untuk bisa menerima input, kita akan menggunakan statement **stdin.readLineSync()**. Fungsi ini merupakan bagian dari library **dart:io**.

~~~
import 'dart:io';
 
void main() {
  stdout.write('Nama Anda : ');
  String name = stdin.readLineSync();
  stdout.write('Usia Anda : ');
  int age = int.parse(stdin.readLineSync());
  print('Halo $name, usia Anda $age tahun');
}
~~~

Statement print() dan stdout.write() memiliki fungsi yang sama yaitu untuk menampilkan suatu objek ke konsol. Yang membedakan adalah print() akan mencetak baris baru setelah menampilkan sesuatu sehingga selanjutnya Anda perlu memasukkan input pada baris baru. Sementara stdout.write() hanya menampilkan objeknya saja dan ketika ada input atau output baru lagi masih akan ditampilkan di baris yang sama.

int.parse() digunakan untuk mengkonversi tipe data String menjadi int. Input yang diambil dari stdin.readLineSync() akan memiliki tipe data berupa String. Sehingga ketika ingin menyimpan dan mengoperasikan input dalam tipe data lain kita perlu melakukan konversi terlebih dahulu.

### Numbers

Tipe data angka pada Dart dapat disimpan ke dalam dua jenis: **int** dan **double**.

Integers adalah nilai bilangan bulat yang tidak lebih besar dari 64 bit (tergantung platform yang digunakan). Untuk Dart VM variabel integer dapat menyimpan nilai mulai dari -2^63 hingga 2^63 - 1, sementara jika dikompilasi ke JavaScript integer memiliki nilai dari -2^53 sampai 2^53 - 1.

~~~
var number = 2020;
var hex = 0xDEADBEEF;
~~~

Double adalah nilai bilangan desimal. 

~~~
var decimal = 1.2;
var pi = 3.14;
~~~

Sejak versi Dart 2.1, kita bisa menuliskan tipe data double tanpa menuliskan angka di belakang koma secara literal. Sebelum versi tersebut, kita harus menuliskan bilangan desimal secara literal.

~~~
double withoutDecimal = 7; // Sama dengan double withoutDecimal = 7.0
~~~

### Strings

String pada Dart dapat didefinisikan dengan menggunakan tanda petik satu maupun petik dua.

~~~
String singleQuote = 'Ini adalah String';
String doubleQuote = "Ini juga String";
~~~

Backslash (\) dapat digunakan untuk escape string. 

~~~
print('"I think it\'s great!" I answered confidently');
~~~

Backslash sebelum tanda petik ini akan mengatakan kepada Dart bahwa itu hanyalah tanda petik dan tidak boleh ditafsirkan sebagai pembatas string. Selain tanda petik, backslash juga berguna untuk mengabaikan simbol lain yang menimbulkan ambigu di dalam string, contohnya seperti backslash itu sendiri.

~~~
print("Windows path: C:\\Program Files\\Dart");
~~~

Fitur lain dari String adalah String interpolation di mana kita bisa memasukkan nilai dari variabel atau expression ke dalam string. Interpolation ini bisa kita terapkan dengan simbol $.

~~~
var name = 'Messi';
print('Hello $name, nice to meet you.');
print('1 + 1 = ${1 + 1}');
~~~

Huruf ‘r’ sebelum String akan memberitahu Dart untuk menganggap String sebagai raw, yang berarti akan mengabaikan interpolation.

~~~
print(r'Dia baru saja membeli komputer seharga $1,000.00');
~~~

Kita juga bisa menambahkan sebuah Unicode ke dalam String. Pada Dart Unicode ini dikenal dengan runes. Unicode mendefinisikan nilai numerik unik untuk setiap huruf, angka, dan simbol yang digunakan dalam semua sistem penulisan dunia. Cara umum untuk mengekspresikan unicode adalah \uXXXX, di mana XXXX adalah nilai heksadesimal 4 digit. Misalnya karakter hati (♥) adalah \u2665.

~~~
print('Hi \u2665');
 
/*
  output :
    Hi ♥
*/
~~~

### Booleans

Variabel boolean hanya bisa menyimpan dua nilai, yaitu true dan false.

~~~
bool alwaysTrue = true;
var alwaysFalse = false;
var notTrue = !true;
bool notFalse = !false;
~~~

Tanda ! di atas disebut dengan operator “not” atau “bang”. Operator ini berfungsi untuk menegasikan nilai boolean, sederhananya membalik nilai boolean. Misalnya !true sama saja bernilai false.

### Operators

**Operator Aritmatika**

~~~
var firstNumber = 4;
var secondNumber = 13;
var sum = firstNumber + secondNumber;
print(sum);
 
/*
Output :
  17
 */
~~~

| Operator | Deskripsi |
|----------|-----------|
| + | Penjumlahan |
| - | Pengurangan |
| * | Perkalian |
| / | Pembagian |
| ~/ | Pembagian, mengembalikan nilai int |
| % | Modulo atau sisa hasil bagi |

~~~
print(5 + 2);   // int add = 7
print(5 - 2);   // int subtract = 3
print(5 * 2);   // int multiply = 10
print(5 / 2);   // double divide = 2.5
print(5 ~/ 2);  // int intDivide = 2
print(5 % 2);   // int modulo = 1
~~~

**Operator Perbandingan**

| Operator | Deskripsi |
|----------|-----------|
| == | Sama dengan |
| != | Tidak sama dengan |
| > | Lebih dari |
| < | Kurang dari |
| >= | Lebih dari sama dengan |
| <= | Kurang dari sama dengan |

Operator perbandingan ini akan mengembalikan nilai dalam bentuk boolean.

**Operator Logika**

| Operator | Deskripsi |
|----------|-----------|
| || | OR |
| && | AND |
| ! | NOT |

Kita telah membahas operator NOT atau bang pada materi boolean. Sementara itu operator OR atau AND digunakan untuk menguji logika dari beberapa nilai boolean. Operator AND akan menghasilkan nilai true jika semua operand-nya bernilai true, sedangkan OR jika salah satu saja dari operand bernilai true maka operator akan mengembalikan nilai true.

### Exceptions

Sebuah aplikasi yang sudah berjalan mungkin mengalami eror dan crash. Kondisi eror pada saat aplikasi berjalan (runtime) ini dikenal dengan exception. 

Ketika exception terjadi aplikasi akan dihentikan dan program setelahnya juga tidak akan dieksekusi.

Untuk menangani exception, dapat dengan menggunakan **try** dan **catch**.

~~~
try {
  var a = 7;
  var b = 0;
  print(a ~/ b);
} on IntegerDivisionByZeroException {
  print('Can not divide by zero.');
}
~~~

Pada Dart sendiri telah tersedia beberapa exception seperti IntegerDivisionByZeroException, IOException, FormatException, dsb. 

Untuk menangani exception yang tidak diketahui secara spesifik, kita bisa menggunakan keyword catch setelah blok try.

~~~
try {
  var a = 7;
  var b = 0;
  print(a ~/ b);
} catch(e) {
  print('Exception happened: $e');
}

/*
Exception happened: IntegerDivisionByZeroException
*/
~~~

Kode catch membutuhkan satu parameter yang merupakan objek exception. Kita dapat mencetak exception tersebut ke layar untuk menampilkan exception apa yang terjadi. 

Selain itu, kita juga dapat menambahkan satu parameter lagi di dalam catch yang merupakan objek stack trace. Dari stack trace ini kita bisa melihat detail exception dan di baris mana exception tersebut terjadi.

~~~
try {
  var a = 7;
  var b = 0;
  print(a ~/ b);
} catch(e, s) {
  print('Exception happened: $e');
  print('Stack trace: $s');
}
 
/*
Output :
Exception happened: IntegerDivisionByZeroException
Stack trace: #0      int.~/ (dart:core-patch/integers.dart:24:7)
#1      main (file:///home/dicoding/Playground/dart/Belajar%20Dart/bin/main.dart:25:13)
#2      _startIsolate.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:305:32)
#3      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:174:12)
*/
~~~

### Finally

Selain try, on, dan catch, ada satu blok lagi yang ada dalam mekanisme exception handling, yaitu finally.

Blok finally akan tetap dijalankan tanpa peduli apa pun hasil yang terjadi pada blok try-catch.

~~~
try {
  var a = 7;
  var b = 0;
  print(a ~/ b);
} catch(e, s) {
  print('Exception happened: $e');
  print('Stack trace: $s');
} finally {
  print('This line still executed');
}
~~~

## Functions

Functions pada Dart digunakan untuk menghasilkan output berdasarkan input tertentu yang diberikan, selain itu juga sebagai blok kode atau prosedur yang dapat digunakan kembali.

Setiap fungsi Dart selalu mengembalikan nilai. Namun ada satu tipe data khusus yang bisa kita lihat pada fungsi main yaitu return type **void**. Keyword void berarti fungsi tersebut tidak menghasilkan output atau nilai kembali.

### Function Parameters

Pada beberapa kasus fungsi bisa memerlukan input data untuk diproses. Input data ini kita kenal sebagai parameter. Untuk menambahkan parameter ke dalam fungsi, kita bisa memasukkannya ke dalam tanda kurung. Sebuah fungsi bisa menerima nol, satu, atau beberapa parameter.

~~~
void main() {
  greet('Dicoding', 2015);  // output : Halo Dicoding! Tahun ini Anda berusia 6 tahun
}
 
void greet(String name, bornYear) {
  var age = 2021 - bornYear;
  print('Halo $name! Tahun ini Anda berusia $age tahun');
}
~~~

Sebuah fungsi juga bisa menghasilkan output atau mengembalikan nilai. Fungsi yang mengembalikan nilai ditandai dengan definisi return type selain void dan memiliki keyword return. 

~~~
void main() {
  var firstNumber = 7;
  var secondNumber = 10;
  print('Rata-rata dari $firstNumber & $secondNumber adalah ${average(firstNumber, secondNumber)}');
}
 
double average(num num1, num num2) {
  return (num1 + num2) / 2;
}
~~~

Jika fungsi hanya memiliki satu baris kode atau instruksi di dalamnya, maka bisa disingkat dengan anotasi **=>**. Ini juga dikenal dengan nama **arrow syntax**.

~~~
double average(num num1, num num2) => (num1 + num2) / 2;
void greeting() => print('Hello');
~~~

### Optional Parameters

Dart mendukung optional parameter, di mana kita tidak wajib mengisi parameter yang diminta oleh fungsi. Untuk bisa membuat parameter menjadi opsional, kita perlu memasukkannya ke dalam kurung siku.

~~~
void greetNewUser([String name, int age, bool isVerified])
~~~

Cara ini disebut dengan **positional optional parameters**.

Setiap parameter yang tidak dimasukkan akan memiliki nilai null. Dengan cara ini, urutan parameter masih perlu diperhatikan sehingga jika kita hanya ingin mengisi parameter terakhir, kita perlu mengisi parameter sebelumnya dengan null.

Untuk mengatasi masalah di atas kita bisa memanfaatkan **named optional parameters**. Pada opsi ini kita menggunakan kurung kurawal pada parameter.

~~~
void greetNewUser({String name, int age, bool isVerified})
~~~

Dengan cara ini Anda bisa memasukkan parameter tanpa mempedulikan urutan parameter dengan menyebutkan nama parameternya.

Terkadang null bukanlah pilihan yang kita inginkan ketika menggunakan optional parameter. Sebagai solusi, kita bisa menggunakan **default value parameter**. Kita akan memberikan nilai default pada parameter lalu nilai ini akan digunakan jika kita tidak memasukkan parameternya.

~~~
void greetNewUser({String name = "Dicoding", int age = 5, bool isVerified = false})
~~~

## Variable Scope

~~~
void main() {
  var price = 300000;
  var discount = 0;
  if (isAvailableForDiscount) {
    discount = 50000;
  }
  print('You need to pay: ${price - discount}');
}
~~~

Pada kode di atas variabel discount masih bisa diakses dari dalam kode if karena masih berada di dalam satu scope fungsi main(). Bagaimana jika Anda ingin memisahkan kode di atas menjadi dua fungsi untuk menghitung diskonnya?

~~~
void main() {
  var price = 300000;
  var discount = checkDiscount(price);
  print('You need to pay: ${price - discount}');
}
 
num checkDiscount(num price) {
  num discount = 0;
  if (price >= 100000) {
    discount = 10 / 100 * price;
  }
 
  return discount;
}
~~~

Variabel discount dideklarasikan pada fungsi checkDiscount() sehingga memiliki scope pada fungsi tersebut dan menyebabkan eror pada fungsi main(). Maka untuk mengatasinya kita tetap perlu membuat variabel di kedua fungsi.

Selain berada dalam lingkup fungsi, suatu variabel juga bisa menjadi variabel global, yaitu variabel yang dideklarasikan di luar blok kode apa pun.

~~~
var price = 300000;
 
void main() {
  var discount = checkDiscount(price);
  print('You need to pay: ${price - discount}');
}
~~~

Variabel juga dapat memiliki scope yang sespesifik mungkin hingga ke level control flow.

~~~
num checkDiscount(num price) {
  num discount = 0;
  if (!discountApplied) { // Error
    if (price >= 100000) {
      discount = 10 / 100 * price;
      var discountApplied = true;
    }
  }
 
  return discount;
}
~~~

## Constants & Final

Constants adalah tempat menyimpan nilai yang tidak akan berubah selama program berjalan.

Variabel konstan didefinisikan menggunakan keyword const.

~~~
const pi = 3.14;
~~~

Type inference dari Dart akan secara otomatis mendeteksi tipe data dari const pi di atas sebagai double, namun Anda dapat menentukan tipe data secara eksplisit.

~~~
const num pi = 3.14;
~~~

Selain const, opsi lain untuk menghindari perubahan nilai variabel setelah diinisialisasi adalah final.

Variabel yang dideklarasikan sebagai const bersifat compile-time constants, artinya nilai tersebut harus sudah diketahui sebelum program dijalankan.

Sedangkan final, nilainya masih bisa diinisialisasi ketika runtime atau ketika aplikasi berjalan.

~~~
final firstName = stdin.readLineSync();
final lastName = stdin.readLineSync();
 
//  lastName = 'Dart'; Tidak bisa mengubah nilai
 
print('Hello $firstName $lastName');
~~~

Kita masih bisa menerima input dan menyimpannya pada variabel firstName dan lastname, namun nilai variabel tersebut tidak bisa diubah setelah diinisialisasi.

Variabel yang nilainya tidak bisa berubah dikenal dengan immutable variable. Mutability ini memungkinkan kita terhindar dari bug yang tidak terduga karena terjadi perubahan nilai. Maka dari itu jika Anda yakin bahwa variabel Anda nilainya tetap, gunakanlah const atau final.

Selalu gunakan const karena compile-time constant memiliki performa yang lebih baik dan menggunakan memori lebih sedikit. Jika tidak memungkinkan untuk menggunakan const, gunakan final untuk melindungi variabel agar tidak berubah.

## Null Safety

Sejak versi 2.12, Dart menghadirkan fitur Null Safety.

Pada kenyataannya suatu variabel juga bisa tidak memiliki nilai. Nilai “tidak ada” pada Dart ini dikenal dengan nilai null. Nilai null bisa terjadi karena kita belum menginisialisasi nilai atau memang secara eksplisit menentukan nilai null pada variabel.

~~~
String favoriteFood = null;
~~~

Nilai null bisa menyebabkan suatu program mengalami kesalahan yang dikenal dengan Null Pointer Exception (NPE). 

Namun, nilai null tidak sepenuhnya buruk. Akan tetap ada kasus tertentu di mana kita membutuhkan nilai null. Contohnya seperti variabel favoriteFood di atas karena tidak semua orang memiliki makanan favorit.

Null safety adalah jawaban dari kasus di atas. 

Untuk menggunakan fitur null safety, kita perlu menggunakan versi Dart 2.12. Anda dapat menentukan versi Dart yang digunakan dengan mengubah berkas pubspec.yaml yang terdapat dalam project. Pastikan minimal versi sdk yang digunakan adalah versi 2.12.0.

~~~
environment:
  sdk: '>=2.12.0 <3.0.0'
~~~

Dengan null safety, secara default sebuah variabel tidak bisa memiliki nilai null, kecuali kita mendeklarasikannya secara eksplisit.

~~~
int age = null;               // Compile error
String? favoriteFood = null; 
~~~

Tanda tanya (**?**) di atas menunjukkan bahwa variabel favoriteFood boleh memiliki nilai null (nullable). Sementara variabel age harus memiliki nilai angka dan tidak boleh null (non-nullable).

Null safety sangat berguna untuk membuat kode menjadi lebih aman karena proses yang melibatkan nilai null dapat dibatasi dan ditemukan lebih awal.

Jika kita memiliki fungsi dengan parameter non-nullable, maka argumen nullable akan terdeteksi sebagai error.

Untuk mengakses atau menangani variabel null seperti di atas, ada beberapa cara yang bisa kita lakukan. Pertama, ubah parameter agar dapat menerima nilai null lalu lakukan pengecekan nilai null.

Cara kedua yang bisa kita lakukan adalah menggunakan bang operator (**!**). Dengan operator ini kita memberitahu compiler dan memberikan jaminan bahwa variabel tidak akan bernilai null.