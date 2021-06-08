# Intro to Dart

[Dart](https://dart.dev/) adalah bahasa pemrograman yang open source dan general purpose. Dart dikembangkan oleh Google dan ditujukan untuk membuat aplikasi multiplatform seperti mobile, desktop, dan web.

Dart awalnya dikenalkan pada GOTO conference pada tahun 2011. Project ini didirikan oleh Lars Bak dan Kasper Lund dari Google, sampai akhirnya versi Dart 1.0 dirilis pada 14 November 2013. Bulan Agustus 2018, Dart 2.0 dirilis dengan perubahan bahasa seperti perubahan type system. 

Jauh sebelum ada Flutter, Dart awalnya digunakan untuk membuat web yang ada di Google. Tujuan awal pembuatan Dart adalah untuk menggantikan JavaScript yang dinilai memiliki banyak kelemahan.

Dalam buku “The Pragmatic Programmer” disebutkan bahwa untuk menjadi professional software developer kita perlu belajar setidaknya satu bahasa baru setiap tahunnya.

1. Dart adalah bahasa pemrograman yang fleksibel.
   
   Dart bisa berjalan di mana pun baik itu Android, iOS, maupun web. Sebagai developer, tentunya sebuah keuntungan jika bisa menuliskan kode dan bisa berjalan di mana saja.

2. Dart adalah project open-source.
   
   Dart dibuat oleh Google, lalu bersama dengan komunitas developer Dart mengembangkan teknologi dan fitur-fitur menarik yang bisa ditambahkan pada Dart. Jika Anda menemukan bug atau masalah pada Dart, Anda dapat melaporkannya atau bahkan memperbaikinya sendiri. Selain itu Anda tidak perlu khawatir dalam masalah lisensi ketika menggunakan bahasa Dart. Anda dapat ikut berkontribusi pada bahasa Dart pada repositori berikut: https://github.com/dart-lang.

3. Dart digunakan oleh Flutter.
   
   Sejak kemunculan Flutter, Dart kembali menjadi perhatian. Saat ini ada banyak perusahaan yang menggunakan Flutter pada aplikasinya. Flutter bisa dibilang merupakan proyek yang revolusioner dari Google untuk mengembangkan aplikasi multiplatform dengan tampilan UI yang menarik. Untuk itu, jika Anda tertarik mengembangkan aplikasi dengan Flutter, maka menguasai Dart adalah hal yang fundamental.

4. Dart memiliki dukungan tools yang lengkap.
   
   Hampir setiap teks editor atau IDE memiliki dukungan besar untuk Dart. Anda dapat menggunakan IDE seperti IntelliJ IDEA, Webstorm, Android Studio maupun editor sederhana seperti VS Code, Sublime text, Atom, atau yang lainnya sesuai kenyamanan Anda.

5. Dart mudah dipelajari dan bagus sebagai first language.
   
   Anda akan bisa memahami Dart dengan cepat khususnya jika sudah familiar dengan bahasa pemrograman populer lain seperti Java, Python, JavaScript, dll. Bahkan jika Anda baru memulai pemrograman, Dart adalah bahasa yang bagus. Anda tidak perlu menginstal apapun, cukup memanfaatkan online compiler dari Dart, Anda sudah bisa menulis dan menjalankan aplikasi Dart. Selain itu, dokumentasi dan tutorial Dart yang disediakan Google cukup mudah untuk diikuti, ditambah dengan sintaks yang sederhana, dan komunitas yang bersahabat dalam membantu kita mempelajari Dart.

Dart sebagai bahasa memiliki beberapa karakteristik berikut:

* Statically typed
  
  Artinya kita perlu mendefinisikan variabel sebelum bisa menggunakannya. Potongan kode berikut adalah contoh deklarasi variabel pada Dart.

  ~~~
  var name = 'Dicoding';
  String language = 'Dart';
  ~~~

* Type inference
  
  Pada Dart kita tidak perlu mendefinisikan tipe data variabel secara eksplisit. Ini disebabkan karena Dart juga mendukung type inference, di mana tipe data akan secara otomatis terdeteksi ketika suatu variabel diinisialisasi.

  Sebagai contoh variabel name di atas akan terdeteksi sebagai String.

* String expressions
  
  ~~~
  print('Hello $name. Welcome to $language!');
  ~~~

  Kode di atas juga menunjukkan kalau Dart memiliki fitur String interpolation. Ini adalah fitur di mana kita bisa menyisipkan variabel ke dalam sebuah objek String tanpa concatenation (penggabungan objek String menggunakan +). Dengan fitur ini, tentunya kita menjadi lebih mudah dalam membuat objek String yang dinamis.

* Multi-paradigm: OOP & Functional

## Dart Platform

Teknologi compiler yang fleksibel memungkinkan kode Dart dapat dijalankan dengan cara yang berbeda, tergantung target platform yang dituju.

* Dart Native : Ditujukan untuk program yang menargetkan perangkat seluler, desktop, server, dan lainnya. Dart Native mencakup Dart VM dengan kompilasi JIT (just-in-time) dan kompiler AOT (ahead-of-time) untuk menghasilkan kode mesin.

* Dart Web : Ditujukan untuk program yang menargetkan web. Dart Web menyertakan kompiler development (dartdevc) dan kompiler production (dart2js).

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/20200326114404edc61578dd2d6f34684b82f687e9af21.jpeg)

### Dart Native (VM JIT dan AOT)

Dart Native memungkinkan kode Dart dijalankan dan dikompilasi dengan kode mesin ARM atau X64 native untuk aplikasi mobile, desktop, dan server.

Dart VM dilengkapi dengan just-in-time compiler (JIT) yang mendukung interpretasi murni dan optimasi runtime. Lalu apa keuntungan dari menggunakan JIT? Compiler bertugas untuk mengubah bahasa high-level yang kita tulis menjadi bahasa low-level yang dimengerti oleh mesin. JIT compiler akan mengubah bahasa pemrograman yang kita tulis menjadi intermediate language atau bytecode seperti pada Java, selanjutnya instruksi ke mesin akan dilakukan hanya ketika dibutuhkan, sehingga disebut just-in-time. Metode ini akan membuat proses iterasi program menjadi lebih efisien.

Saat aplikasi siap digunakan untuk production, Anda dapat memanfaatkan Dart AOT compiler. AOT compilation akan mengubah bahasa high-level atau intermediate-level menjadi kode mesin pada mesin atau server sebelum aplikasi dijalankan. Kompilasi AOT akan menghasilkan rendering aplikasi yang lebih cepat dan ukuran yang lebih kecil karena kode telah dikompilasi sebelum aplikasi dijalankan.

### Dart Web (JavaScript)

Dart Web memungkinkan kode Dart dijalankan pada platform web yang didukung oleh JavaScript. Dengan Dart Web, kode Dart akan dikompilasi ke kode JavaScript sehingga nantinya bisa berjalan di browser.

Dart Web menggunakan Dart dev compiler (dartdevc), compiler yang mengonversi kode Dart menjadi JavaScript. Alih-alih menggunakan dartdevc secara langsung, Anda dapat menggunakan webdev, yakni alat yang mendukung tugas inti developer seperti menjalankan, membangun, dan debugging.

Untuk mengoptimalkan kode pada lingkungan production, terdapat dart2js compiler yang dapat mengompilasi kode Dart dengan cepat dan ringkas. Dart2js menggunakan teknik yang bisa mengeliminasi kode yang tidak perlu.