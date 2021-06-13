# Paradigma Object Oriented Programming

Terdapat [4 (empat) pilar dalam pemrograman berorientasi objek](https://github.com/fadhilhaka/Basic-SOLID/tree/main/OOP), antara lain: **encapsulation**, **abstraction**, **inheritance**, dan **polymorphism**.

## Class

**Class** merupakan sebuah blueprint untuk membuat objek.

Setiap **class** memiliki attribute dan behaviour. Pada Dart kita mendefinisikan attribute dengan **variabel**, sedangkan behaviour sering direpresentasikan sebagai **function**.

| Animal |   |
|--------|---|
| + String name | - eat() |
| + int age | - sleep() |
| + double weight | - poop() |

Untuk mendefinisikan kelas dalam Dart, cukup gunakan keyword **class** diikuti dengan nama kelas yang akan dibuat. Kemudian kita bisa menambahkan variabel dan fungsi pada kelas tersebut.

~~~
class Animal {
  String name;
  int age;
  double weight;
 
  Animal(this.name, this.age, this.weight);
 
  void eat() {
    print('$name is eating.');
    weight = weight + 0.2;
  }
  
  void sleep() {
    print('$name is sleeping.');
  }
 
 
  void poop() {
    print('$name is pooping.');
    weight = weight - 0.1;
  }
}
~~~

Kemudian untuk membuat sebuah objek dari suatu class, gunakan sintaks berikut:

~~~
// var nameOfObject = NameOfClass(property1, property2);
var dicodingCat = Animal('Gray', 2, 4.2);

void main() {
  var dicodingCat = Animal('Gray', 2, 4.2);
  dicodingCat.eat();
  dicodingCat.poop();
  print(dicodingCat.weight);
}

// output
Gray is eating.
Gray is pooping.
4.300000000000001
~~~

Sebuah objek sama seperti variabel, artinya kita bisa menggunakan **var** untuk menginisialisasikan sebuah objek. Objek yang disimpan ke dalam variabel ini juga dikenal dengan instance atau instance of a class. 

Instance ini menyimpan reference atau alamat memori dari objek. Proses membuat variabel instance seperti di atas disebut instansiasi (instantiation). 

## Properties & Methods

Kita mendeklarasikan property di dalam kelas dengan menentukan tipe datanya atau menginisialisasikan nilainya secara eksplisit.

~~~
class Animal {
  String _name = '';
  int _age;
  double _weight = 0;
}
~~~

OOP memiliki konsep enkapsulasi di mana kita bisa menyembunyikan informasi di dalam objek sehingga status atau data di dalam objek tidak bisa diubah atau bahkan dilihat. Umumnya bahasa pemrograman memiliki visibility modifier untuk menentukan siapa saja yang bisa mengakses property atau method. 

Namun, Dart tidak memiliki keyword visibility modifier seperti private atau public.

Jadikanlah class sebagai library lalu panggilah ia dengan keyword **import**. Untuk membuat class sebagai library Anda cukup membuat berkas baru, sehingga Anda akan memiliki 2 buah berkas.

~~~
// main.dart
import 'Animal.dart';
 
void main() {
  var dicodingCat = Animal('Gray', 2, 4.2);
 
  dicodingCat.eat();
  dicodingCat.poop();
  print(dicodingCat.weight);
}
~~~

~~~
// Animal.dart
class Animal {
  String _name = '';
  int _age;
  double _weight = 0;
 
  Animal(this.name, this.age, this.weight);
 
  void eat() {
    print('$name is eating.');
    weight = weight + 0.2;
  }
 
  void sleep() {
    print('$name is sleeping.');
  }
 
  void poop() {
    print('$name is pooping.');
    weight = weight - 0.1;
  }
}
~~~

Property yang private artinya hanya bisa diakses pada berkas atau library yang sama. Kita akan membutuhkan private property ini di saat kita tidak ingin objek diubah dari luar. Karena Dart tidak memiliki modifier private, sebagai gantinya kita perlu menambahkan underscore (**_**) sebelum nama property.

Setelah menambahkan underscore pada nama variabel, Anda akan mendapatkan eror di berkas **main.dart** ketika mengakses property **weight**.

Kini weight bersifat private dan tidak bisa diakses dari luar berkasnya. Solusinya, Anda bisa menambahkan setter dan getter untuk mendapatkan nilai serta mengubahnya dari luar berkas.

Jika menggunakan IntelliJ IDEA Anda bisa menggunakan shortcut **Alt + Insert** lalu pilih **Getter and Setter**.

~~~
// Setter
set name(String value) {
  _name = value;
}
 
// Getter
double get weight => _weight;
~~~

Selain dengan setter, Anda juga bisa mengubah nilai dengan property dari pemanggilan method. Pada contoh kelas hewan tentunya kita tidak bisa langsung mengubah nilai berat badan, namun kita bisa menambah dan mengubah nilainya melalui proses **eat()** atau **poop()**.

## Constructor

Ketika suatu objek dibuat, semua properti pada kelas tersebut harus memiliki nilai. Kita dapat langsung menginisialisasi pada properti tertentu atau menginisialisasinya melalui constructor. Constructor adalah fungsi spesial dari sebuah kelas yang digunakan untuk membuat objek. 

Beberapa perbedaan antara constructor dan fungsi biasa adalah:

1. Constructor memiliki nama yang sama dengan nama kelas.
2. Constructor tidak memiliki nilai kembalian (return type).
3. Constructor akan secara otomatis dipanggil ketika sebuah objek dibuat.
4. Jika kita tidak mendefinisikan constructor, default constructor tanpa argumen akan dibuat.

Secara default sebuah kelas memiliki constructor yang tidak menerima argumen. Bila kita tidak memasukkan nilai ketika membuat objek, maka nilai default dari properti atau variabel akan digunakan. Anda perlu berhati-hati jika tidak memberikan nilai pada properti, karena akan membuat properti bernilai null sehingga bisa menyebabkan eror.

~~~
var dicodingCat = Animal();
~~~

Dengan membuat constructor, kita tidak hanya bisa menginisialisasikan nilai namun juga menjalankan instruksi tertentu ketika objek dibuat.

~~~
Animal(String name, int age, double weight) {
  this.name = name;
  this.age = age;
  this.weight = weight;
  // other instructions
}
~~~

Keyword **this** di atas menunjuk pada objek yang ada di kelas tersebut. Keyword this ini umumnya digunakan untuk menghindari ambiguitas antara atribut dari class dan parameter yang memiliki nama yang sama.

Jika constructor hanya digunakan untuk menginisialisasi nilai properti, maka kode konstruktor dapat diringkas.

~~~
Animal(this.name, this.age, this.weight);
~~~

### Named Constructor

Pada beberapa kasus kita mungkin akan membutuhkan beberapa constructor untuk skenario yang berbeda-beda. Pada situasi ini kita bisa memanfaatkan named constructor.

Dengan menggunakan named constructor, kita dapat membuat beberapa constructor pada kelas yang sama. Setiap constructor akan memiliki nama yang unik.

~~~
Class Animal {
  ...
  Animal.Name(this._name);
  Animal.Age(this._age);
  Animal.Weight(this._weight);
  ...
}
~~~

## Cascade Notation

Dart juga dilengkapi dengan cascade notation atau cascade operator. 

Operator ini memungkinkan kita untuk melakukan beberapa urutan operasi pada objek yang sama. 

Kita bisa mengakses property dari object dan menjalankan method di dalamnya bersamaan ketika kita menginstansiasi object. Cascade operator dituliskan dengan dua tanda titik (**..** atau **?..**).

~~~
void main() {
  var dicodingCat = Animal('', 2, 4.2)
    ..name = 'Gray'
    ..eat();
}
~~~

Cascade notation juga akan sering kita temui pada **builder pattern** seperti ini:

~~~
final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = '415-555-0100')
    .build();
~~~

## Inheritance

Inheritance adalah kemampuan suatu program untuk membuat kelas baru dari kelas yang ada. Konsep inheritance ini bisa dibayangkan layaknya seorang anak mewarisi sifat dari orang tuanya. 

Di dalam OOP kelas yang menurunkan sifat disebut sebagai kelas induk (parent class/superclass) sementara kelas yang mewarisi kelas induknya disebut sebagai kelas anak (child class/subclass).

Untuk menerapkan inheritance gunakan keyword **extends**.

~~~
class ChildClass extends ParentClass { }
~~~

~~~
// Animal.dart
class Animal {
  String _name = '';
  int _age;
  double _weight = 0;
 
  Animal(this._name, this._age, this._weight);
 
  String get name => _name;
  double get weight => _weight;
 
  void eat() {
    print('$_name is eating.');
    _weight = _weight + 0.2;
  }
 
  void sleep() {
    print('$_name is sleeping.');
  }
}
~~~

~~~
// Cat.dart
import 'Animal.dart';
 
class Cat extends Animal {
  String furColor;
 
  Cat(String name, int age, double weight, String furColor) : super(name, age, weight) {
    this.furColor = furColor;
  }
 
  void walk() {
    print('$name is walking');
  }
 
}
~~~

Karena kelas **Cat** adalah turunan dari kelas **Animal**, maka kita bisa mengakses sifat dan perilaku dari **Animal** melalui kelas **Cat**.

### Inheritance constructor

Karena kelas **Animal** memiliki constructor untuk menginisialisasi properti di dalamnya, maka semua kelas turunannya juga perlu mengimplementasikan constructor tersebut. 

Oleh sebab itu ketika membuat kelas **Cat** tanpa mendefinisikan constructor kita akan mendapatkan eror.

~~~
Cat(String name, int age, double weight) : super(name, age, weight);
~~~

Keyword **super** di atas akan diarahkan ke constructor dari kelas Animal.

Jika ingin menginisialisasikan nilai **furColor** melalui constructor, maka kita bisa menambahkan parameter di dalam constructor.

~~~
Cat(String name, int age, double weight, String furColor) : super(name, age, weight) {
  this.furColor = furColor;
}

// cara ringkas
Cat(String name, int age, double weight, this.furColor) : super(name, age, weight);
~~~

## Abstract Class

Sesuai namanya, abstract merupakan gambaran umum dari sebuah kelas. Ia tidak dapat direalisasikan dalam sebuah objek.

Untuk menjadikan sebuah kelas menjadi abstract, kita hanya perlu menambah keyword **abstract** sebelum penulisan kelas.

~~~
abstract class Animal {
  String name;
  int age;
  double weight;
 
  // ...
}
~~~

Dengan begitu kelas Animal tidak dapat diinisialisasikan menjadi sebuah objek.

~~~
var dicodingCat = Animal('Gray', 2, 4.2); 
// Error: The class 'Animal' is abstract and can't be instantiated.
~~~

## Implicit Interface

Selain abstract class, cara lain yang bisa kita gunakan untuk menerapkan abstraksi dalam OOP adalah dengan interface.

Interface atau antarmuka merupakan set instruksi yang bisa diimplementasi oleh objek. Secara umum, interface berfungsi sebagai penghubung antara sesuatu yang abstrak dengan sesuatu yang nyata.

Dart tidak memiliki keyword atau syntax untuk mendeklarasikan interface seperti bahasa pemrograman OOP lainnya. Setiap class di dalam Dart dapat bertindak sebagai interface. 

Maka dari itu interface pada Dart dikenal sebagai **implicit interface**.

Untuk mengimplementasikan interface, gunakan keyword **implements**.

Kita bisa mengimplementasikan beberapa interface sekaligus pada satu kelas.

~~~
class ClassName implements InterfaceName
~~~

Setelah kelas mengimplementasikan interface, maka kelas tersebut wajib mengimplementasikan semua metode yang ada di dalam interface.

~~~
class Flyable {
  void fly() { }
}
~~~

Kita dapat membiarkan body dari method **fly()** tetap kosong karena fungsi implementasinya akan dilakukan oleh **class**.

~~~
class Bird extends Animal implements Flyable {
  String featherColor;
 
  Bird(String name, int age, double weight, this.featherColor) : super(name, age, weight);

  @override
  void fly() {
    print('$name is flying');
  }
}
~~~

Keyword atau anotasi **@override** menunjukkan fungsi tersebut mengesampingkan fungsi yang ada di interface atau kelas induknya, lalu menggunakan fungsi yang ada dalam kelas itu sendiri sebagai gantinya.

## Enumerated Types

Enum mewakili kumpulan konstan yang membuat kode kita lebih jelas dan mudah dibaca.

~~~
enum Rainbow {
  red, orange, yellow, green, blue, indigo, violet
}
 
enum Status {
  Todo, In_Progress, In_Review, Done
}
~~~

Enum pada Dart memiliki beberapa property bawaan yang dapat kita gunakan untuk menampilkan seluruh nilai dalam bentuk list serta menampilkan item dan indeks dari item tersebut.

~~~
print(Rainbow.values);
print(Rainbow.blue);
print(Rainbow.orange.index);

// output
[Rainbow.red, Rainbow.orange, Rainbow.yellow, Rainbow.green, Rainbow.blue, Rainbow.indigo, Rainbow.violet]
Rainbow.blue
1
~~~

Kita juga bisa menggunakan enum ke dalam switch statements.

~~~
var taskStatus = Status.In_Progress;
 
switch(taskStatus) {
  case Status.Todo:
    print('Task is still in To do');
    break;
  case Status.In_Progress:
    print('Task is in progress');
    break;
  case Status.In_Review:
    print('Task is currently under review');
    break;
  case Status.Done:
    print('Task is done');
    break;
}
~~~

## Mixins

Mixin adalah cara menggunakan kembali kode kelas dalam banyak hirarki kelas.

![](https://d17ivq9b7rppb3.cloudfront.net/original/academy/2020033014380076bdb1948132ea1cb67128f6bbd8cb85.jpeg)

Kita memiliki superclass **Animal** dengan tiga subclass. Di bawahnya ada beberapa kelas turunan yang memiliki perilaku berbeda-beda.

Beberapa hewan memiliki perilaku yang sama, seperti Cat dan Duck sama-sama bisa berjalan. Kita bisa saja membuat kelas seperti **Walkable**, **Swimmable**, dan **Flyable**.

Sayangnya, Dart tidak mendukung multiple inheritance, sehingga sebuah kelas hanya bisa mewarisi (inherit) satu kelas induk.

Kita bisa saja membuat interface lalu mengimplementasikannya ke ke kelas **Cat** atau **Duck**. Namun, implementasi interface mengharuskan kita untuk meng-override method dan membuat implementasi fungsi di masing-masing kelas.

~~~
mixin Flyable {
  void fly() {
    print("I'm flying");
  }
}
 
mixin Walkable {
  void walk() {
    print("I'm walking");
  }
}
 
mixin Swimmable {
  void swim() {
    print("I'm swimming");
  }
}
~~~

Kelas mixin dapat didefinisikan dengan keyword class seperti kelas pada umumnya. 

Setelah membuat kelas seperti di atas kita bisa menambahkan sebagai mixin dengan keyword **with** dan diikuti dengan satu atau beberapa kelas mixin.

~~~
class Cat extends Mammal with Walkable { }
 
class Duck extends Bird with Walkable, Flyable, Swimmable { }
~~~

Dengan mixin ini memungkinkan objek **cat** untuk memanggil metode **walk()**. Sementara objek duck bisa memanggil metode **walk()**, **fly()**, dan **swim()**.

~~~
void main() {
  var donald = Duck();
  var garfield = Cat();
 
  garfield.walk();
 
  donald.walk();
  donald.swim();
}
~~~

Jika diperhatikan mixin ini memang mirip dengan multiple inheritance. Namun kelas mixin ini tidak termasuk ke dalam hirarki parent-child atau inheritance.

Oleh sebab itu mixin memungkinkan kita terhindar dari masalah yang sering terjadi pada multiple inheritance yang dikenal dengan [diamond problem](https://en.wikipedia.org/wiki/Multiple_inheritance#The_diamond_problem), yaitu ada dua parent class yang memiliki method dengan nama yang sama sehingga child class-nya ambigu dalam menjalankan method yang mana.

Ketika mencampur (mixing) kelas, kelas yang digunakan sebagai mixin tidak paralel namun saling bertumpuk. Itulah mengapa kelas atau method pada mixin tidak ambigu satu sama lain. Karena itu jugalah, urutan menjadi hal yang penting dalam menerapkan mixin.

~~~
mixin Dancer implements Performer {
  @override
  void perform() {
    print('Dancing');
  }
}
 
mixin Singer implements Performer {
  @override
  void perform() {
    print('Singing');
  }
}
 
class Musician extends Performer with Dancer, Singer {
  void showTime() {
    perform();
  }
}
~~~

~~~
void main() {
  var arielNoah = Musician();
  arielNoah.perform();
}
~~~

Kelas mixin bersifat stack atau bertumpuk. Kelas-kelas ini berurutan dari yang paling umum hingga paling spesifik. Sehingga sesuai urutan mixin di atas kelas Musician akan menampilkan method dari Singer karena berada di urutan terakhir atau paling spesifik.

## Extension Methods

Pada versi 2.7 Dart mengenalkan fitur baru yaitu extension methods. Tujuan dari fitur ini adalah supaya kita bisa membuat fungsionalitas tambahan dari library yang sudah ada.

Ketika Anda menggunakan library, baik itu library bawaan Dart atau pun library milik orang lain, ada kemungkinan library tersebut kurang lengkap sehingga kita perlu menambahkan beberapa fungsionalitas. Namun akan jadi PR kita untuk mengubah library yang sudah ada. Dengan extension method, kita dapat membuat fungsi atau method tambahan lalu menggunakannya sesuai dengan kebutuhan aplikasi kita.

Contoh sederhananya, kita memiliki variabel list integer.

~~~
var unsortedNumbers = [2, 5, 3, 1, 4];
~~~

Kita memiliki kebutuhan untuk mengurutkan nilai di dalam list tersebut namun **List** pada Dart tidak memiliki fungsi untuk mengurutkannya (Dart memiliki fungsi **sort()** namun bersifat mentransformasi list dan tidak mengembalikan nilai). Kita bisa membuat extension method dari objek **List** dengan sintaks seperti berikut:

~~~
/* extension <extension name> on <type> {
  (<member definition>)*
} */
 
extension Sorting on List<int> {
  List<int> sortAsc() {
    var list = this;
    var length = this.length;
 
 
    for (int i = 0; i < length - 1; i++) {
      int min = i;
      for (int j = i + 1; j < length; j++) {
        if (list[j] < list[min]) {
          min = j;
        }
      }
 
 
      int tmp = list[min];
      list[min] = list[i];
      list[i] = tmp;
    }
 
 
    return list;
  }
}
~~~

Pada extension method di atas kita telah membuat method atau fungsi untuk mengurutkan data di dalam list menggunakan [selection sort algorithm](https://www.tutorialspoint.com/data_structures_algorithms/selection_sort_algorithm.htm). Selanjutnya kita bisa memanggil method ini dari objek list.

~~~
void main() {
  var unsortedNumbers = [2, 5, 3, 1, 4];
  print(unsortedNumbers);
  var sortedNumbers = unsortedNumbers.sortAsc();
  print(sortedNumbers);
 
 
  /*
  Output: [2, 5, 3, 1, 4]
          [1, 2, 3, 4, 5]
   */
}
~~~