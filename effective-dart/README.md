# Effective Dart

Pada dasarnya sebagai seorang programmer, khususnya yang bekerja dalam sebuah tim, mayoritas waktu kita akan digunakan untuk membaca kode daripada menulisnya. Untuk itulah ada coding convention. 

Coding convention adalah panduan untuk bahasa pemrograman tertentu yang merekomendasikan gaya pemrograman, praktik, dan metode untuk setiap aspek program yang ditulis dalam bahasa tersebut. 

Konvensi ini biasanya meliputi indentasi, komentar, deklarasi, penamaan, arsitektur, dll.

Code convention sangat penting bagi programmer karena beberapa alasan berikut:

* 40% - 80% biaya dari sebuah perangkat lunak digunakan untuk pemeliharaan (maintenance).
* Sangat jarang suatu perangkat lunak dipelihara seterusnya oleh penulis aslinya.
* Code convention meningkatkan keterbacaan kode, memungkinkan programmer untuk memahami kode baru dengan lebih cepat dan menyeluruh.
* Source code lebih tertata rapi dan bersih sebagai sebuah produk.

Dart juga telah mengembangkan coding convention yang bertujuan supaya kita bisa menulis kode yang konsisten, kuat, dan cepat. Convention Dart ini dikenal dengan Effective Dart.

Effective Dart dibuat untuk mewujudkan dua hal:

1. Be consistent (Konsisten). Ketika membahas tentang formatting akan banyak argumen subjektif tentang mana yang lebih baik. Namun konsistensi tentunya akan sangat membantu secara objektif.
2. Be brief (Ringkas). Dart dirancang supaya familiar dengan bahasa pemrograman lain seperti C, Java, JavaScript, dll. Namun Dart ditambah dengan fitur-fitur lain yang belum ditawarkan bahasa lain.

## Guidelines

* Style guide. 
  
  Mendefinisikan aturan untuk meletakkan dan mengatur kode. Panduan ini juga menentukan bagaimana format penamaan sebuah identifier, apakah menggunakan camelCase, _underscore, dll.

* Documentation guide. 
  
  Panduan ini terkait tentang apa yang boleh dan tidak ada di dalam komentar. Baik itu komentar dokumentasi atau komentar biasa.

* Usage guide. 
  
  Panduan ini mengajarkan bagaimana memanfaatkan fitur bahasa secara terbaik untuk menerapkan perilaku. Penggunaan statement atau expression akan dibahas di sini.

* Design guide. 
  
  Ini adalah panduan dengan cakupan terluas namun paling tidak mengikat. Panduan ini mencakup bagaimana mendesain API library yang konsisten dan bisa digunakan.

Effective Dart memiliki banyak rules. Masing-masing aturan akan diawali dengan kata kunci untuk menentukan bagaimana sifat dari aturan tersebut. 
Lima kata kunci tersebut, antara lain:

1. DO. Ketika aturan diawali dengan DO maka praktik tersebut harus selalu diikuti.
2. DON’T. Sebaliknya, aturan yang diawali dengan DON’T bukan merupakan hal yang baik untuk diterapkan.
3. PREFER. Ini adalah praktik yang harus diikuti. Namun, mungkin ada keadaan di mana lebih masuk akal untuk melakukan sebaliknya. Pastikan Anda memahami konsekuensi ketika Anda mengabaikan aturan ini.
4. AVOID. Ini adalah kebalikan dari PREFER. Panduan ini menjelaskan hal-hal yang tidak boleh dilakukan, namun kemungkinan ada alasan bagus untuk melakukannya pada beberapa kejadian.
5. CONSIDER. Panduan ini adalah praktik yang bisa Anda ikuti atau tidak Anda ikuti, tergantung pada keadaan dan preferensi Anda sendiri.

### DO name types using UpperCamelCase.

Class, enum, typedef, dan type parameter harus menggunakan huruf kapital pada huruf pertama dari setiap kata termasuk kata pertama.

~~~
abstract class Animal {}
abstract class Mammal extends Animal {}
mixin Flyable {}
class Cat extends Mammal with Walkable {}
~~~

### DON’T use prefix letters.

Karena Dart dapat memberitahu Anda tipe, cakupan, dan properti lain pada sebuah deklarasi, maka tidak ada alasan untuk menambahkan prefix pada sebuah identifier.

~~~
var instance;  // good
var mInstance;  // bad
~~~

### PREFER starting function or method comments with third-person verbs.

Sebuah komentar dokumentasi harus fokus menjelaskan apa yang dilakukan kode tersebut. Menambahkan kata kerja dari sudut pandang orang ketiga di awal komentar adalah salah satu cara melakukannya.

~~~
// Returns `true` if [username] and [password] inputs are valid.
bool isValid(String username, String password) { }
~~~

### PREFER a noun phrase for a non-boolean property or variable.

Seorang developer yang membaca kode kita akan fokus pada apa yang ada pada property. Jika mereka lebih peduli tentang bagaimana suatu property ditentukan, maka lebih baik dibuat menjadi method dengan nama menggunakan kata kerja.

~~~
// Good
cat.furColor;
calculator.firstNumber;
list.length;
 
// Bad
list.deleteItems;
~~~

Sementara untuk variabel atau property booleans PREFER gunakan kata kerja non-imperative, seperti:

~~~
list.isEmpty
dialog.isOpen
~~~

### DO use ?? to convert null to a boolean value.

Aturan ini berlaku ketika sebuah expression dapat mengevaluasi nilai true, false, atau null dan Anda perlu meneruskan hasilnya ke sesuatu yang tidak menerima nilai null.

~~~
if(stock?.isEnough ?? false) {
  print('Making you a cup of coffee...');
}
~~~

### AVOID using curly braces in interpolation when not needed.

Seperti yang kita tahu, Dart dilengkapi dengan fitur string interpolation untuk menggabungkan nilai string dengan nilai lain secara lebih mudah.

~~~
print('Hi, $name, You are ${thisYear - birthYear} years old.');
~~~

### PREFER async/await over using raw futures.

Kode asynchronous bisa jadi sangat sulit untuk dibaca dan di-debug, bahkan ketika menggunakan abstraksi yang bagus seperti Future.

Sintaks async-await memungkinkan Anda menuliskan kode asynchronous dengan gaya synchronous sehingga memudahkan membaca kode.

~~~
// raw future
void main() {
  getOrder().then((value) {
    print('You order: $value');
  })
  .catchError((error) {
    print('Sorry. $error');
  });
  print('Getting your order...');
}
 
 
// async-await
void main() async {
  print('Getting your order...');
  try {
    var order = await getOrder();
    print('You order: $order');
  } catch (error) {
    print('Sorry. $error');
  }
}
~~~

### CONSIDER making the code read like a sentence.

Penamaan dalam kode baik itu nama variabel, fungsi, maupun lainnya adalah hal yang sangat penting namun juga tidak mudah. Sebagai solusi kita bisa membayangkannya seolah sedang membuat kalimat.

~~~
// “If store is open ...”
If (store.isOpen)
 
// Bad example
// Ambigu apakah memerintahkan toko untuk tutup atau mendapatkan status dari toko
If (store.close)
~~~

### CONSIDER using function type syntax for parameters.

Dart memiliki sintaks khusus untuk mendefinisikan parameter yang tipenya adalah fungsi. Caranya yaitu dengan menuliskan tipe kembalian sebelum nama parameter kemudian parameter dari fungsi setelahnya.

~~~
List filter(bool predicate(item)) { }
~~~

Sejak Dart versi 2, terdapat notasi umum untuk tipe fungsi sehingga bisa digunakan untuk parameter berupa fungsi.

~~~
List filter(Function predicate) { }  // function type syntax
~~~

[Effective Dart](https://dart.dev/guides/language/effective-dart)