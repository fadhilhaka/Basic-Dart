# Futures

## Synchronous vs Asynchronous

Dalam synchronous program, kode program dijalankan secara berurutan dari atas ke bawah.

Artinya jika kita menuliskan dua baris kode maka baris kode kedua tidak bisa dieksekusi sebelum kode baris pertama selesai dieksekusi.

Dalam asynchronous program, jika kita menuliskan dua baris kode, kita dapat membuat baris kode kedua dieksekusi tanpa harus menunggu kode pada baris pertama selesai dieksekusi.

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/2021041119122727d7a6d0ee877dfe37120c7bddbfe095.jpeg)

Umumnya kita memanfaatkan asynchronous pada operasi yang besar dan membutuhkan waktu lama, seperti mengambil data dari internet atau API, menyimpan data ke database, dan membaca data dari sebuah berkas.

## Dart Future

Future adalah sebuah objek yang mewakili nilai potensial atau kesalahan yang akan tersedia pada suatu waktu di masa mendatang.

Anda dapat membayangkan future sebagai sebuah kotak paket. Saat Anda menerima paket tersebut, akan ada tiga kondisi yang mungkin terjadi, antara lain:

* Paket masih tertutup (uncompleted), 
* Paket dibuka lalu berisi barang sesuai pesanan (completed with data), dan 
* Paket dibuka namun terjadi kesalahan atau tidak sesuai (completed with error).

Penerima dari future dapat menentukan callbacks yang akan menangani nilai atau kesalahan tersebut.

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/20200331105254736a05f2a7300670e27c894c7bb37a91.jpeg)

~~~
void main() {
  final myFuture = Future(() {
    print('Creating the future');
    return 12;
  });
  print('main() done');
}
~~~

Jika kode di atas dijalankan, seluruh fungsi **main** akan dieksekusi sebelum fungsi yang ada di dalam **Future()**. Ini disebabkan karena **future** masih berstatus uncompleted. 

~~~
main() done
Creating the future
~~~

### Uncompleted

~~~
Future<String> getOrder() {
  return Future.delayed(Duration(seconds: 3), () {
    return 'Coffee Boba';
  });
}
~~~

Pada **Future** kita bisa menambahkan method **delayed** untuk menunda eksekusi kode di dalam Future. 

Di mana parameter pertama berisi durasi penundaan dan parameter kedua adalah blok kode atau fungsi yang akan dijalankan. 

Pada kasus ini kita menggunakan **delayed** untuk menunda waktu eksekusi seolah kita sedang mengambil data dari internet. Karena nilai yang dikembalikan pada **Future** berupa **String**, kita bisa secara eksplisit menentukan tipe parameter generic **Future<String>**.

### Completed with Data

Setelah **Future** dijalankan, kita memerlukan handler untuk menangani status completed with data. 

Caranya gunakan method **.then()** dari objek **Future**.

~~~
void main() {
  getOrder().then((value) {
    print('You order: $value');
  });
  print('Getting your order...');
}
~~~

Fungsi **getOrder()** akan dijalankan secara asynchronous hingga setelah 3 detik kode Future akan dijalankan dan mengembalikan nilai.

~~~
Getting your order...
You order: Coffee Boba  // Muncul setelah 3 detik
~~~

### Completed with Error

Kita dapat menambahkan method **.catchError()** setelah **.then()**.

~~~
void main() {
  getOrder().then((value) {
    print('You order: $value');
  })
  .catchError((error) {
    print('Sorry. $error');
  });
  print('Getting your order...');
}
 
Future<String> getOrder() {
  return Future.delayed(Duration(seconds: 3), () {
    var isStockAvailable = false;
    if (isStockAvailable) {
      return 'Coffee Boba';
    } else {
      throw 'Our stock is not enough.';
    }
  });
}
~~~

Ada satu method lagi yang bisa kita gunakan yaitu **whenComplete()**. 

Method ini akan dijalankan ketika suatu fungsi **Future** selesai dijalankan, tak peduli apakah menghasilkan nilai atau eror. Ini seperti blok **finally** pada **try-catch-finally**.

~~~
void main() {
  getOrder().then((value) {
    print('You order: $value');
  })
  .catchError((error) {
    print('Sorry. $error');
  })
  .whenComplete(() {
    print('Thank you');
  });
  print('Getting your order...');
}
~~~

## Future with Async-await

Dart memiliki keyword **async** dan **await** yang merupakan sebuah alternatif supaya kita bisa menuliskan proses asynchronous layaknya proses synchronous.

~~~
void main() {
  print('Getting your order...');
  var order = getOrder();
  print('You order: $order');
}
~~~

Ketika kode di atas dijalankan hasilnya tidak akan sesuai yang kita harapkan karena fungsi **getOrder()** merupakan objek **Future**.

~~~
Getting your order...
You order: Instance of 'Future<String>'
~~~

Output ini disebabkan karena fungsi **main()** masih merupakan fungsi synchronous. Untuk mengubahnya menjadi fungsi asynchronous tambahkan keyword **async** sebelum function body.

~~~
void main() async { … }
~~~

Kemudian tambahkan keyword **await** sebelum fungsi yang mengembalikan nilai **Future**.

~~~
var order = await getOrder();
~~~

Dari perubahan di atas yang memanfaatkan async-await kita telah berhasil menuliskan proses asynchronous dengan gaya synchronous.

~~~
void main() async {
  print('Getting your order...');
  try {
    var order = await getOrder();
    print('You order: $order');
  } catch (error) {
    print('Sorry. $error');
  }
}
 
 
/*
  Output :
  Getting your order...
  You order: Coffee Boba
*/
~~~

Method **whenComplete()** bisa digantikan dengan blok **finally**.