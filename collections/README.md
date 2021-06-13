# Collections

## List

List sesuai namanya dapat menampung banyak data ke dalam satu objek.

~~~
List<int> numberList = [1, 2, 3, 4, 5];

var numberList = [1, 2, 3, 4, 5];
var stringList = ['Hello', 'Dicoding', 'Dart'];

// List<dynamic>
List dynamicList = [1, 'Dicoding', true];
~~~

Banyaknya data di dalam list bisa kita panggil melalui properti **.length**.

Kita juga bisa menggunakan fungsi foreach untuk menampilkan data di dalam list.

~~~
stringList.forEach((s) => print(s));
~~~

Mekanisme di atas dikenal sebagai **lambda** atau **anonymous function**. 

Untuk menambahkan data ke dalam list, kita bisa menggunakan fungsi **add()** atau **insert()**. Fungsi add ini akan menambahkan data di akhir list.

~~~
stringList.add('Flutter');
stringList.insert(0, 'Programming');
// stringList = [Programming, Hello, Dicoding, Dart, Flutter]
~~~

Untuk mengubah nilai di dalam list, kita bisa langsung menginisialisasikan nilai baru sesuai indeks yang diinginkan.

~~~
stringList[1] = 'Application';
~~~

Sedangkan untuk menghapus data terdapat beberapa fungsi **remove**.

~~~
stringList.remove('Programming'); // Menghapus list dengan nilai Programming
stringList.removeAt(1);           // Menghapus list pada index ke-1
stringList.removeLast();          // Menghapus data list terakhir
stringList.removeRange(0, 2);     // Menghapus list mulai index ke-0 sampai ke-1 (indeks 2 masih dipertahankan)
~~~

### Spread Operator

Dart memiliki fitur menarik untuk menambahkan banyak nilai ke dalam List dengan cara yang singkat, yaitu **spread operator**.

Sesuai namanya “spread”, fitur ini digunakan untuk menyebarkan nilai di dalam collections menjadi beberapa elemen. Spread operator dituliskan dengan tiga titik (**...**).

~~~
var favorites = ['Seafood', 'Salad', 'Nugget', 'Soup'];
var others = ['Cake', 'Pie', 'Donut'];
var allFavorites = [favorites, others];
print(allFavorites);
 
/* output
[[Seafood, Salad, Nugget, Soup], [Cake, Pie, Donut]]
 */
~~~

Nilai List tidak akan tergabung, Alih-alih menggabungkan nilainya, variabel allFavorites menjadi List yang menampung dua List di dalamnya. Nah, dengan spread operator kita dapat menggabungkan kedua List di atas.

~~~
var favorites = ['Seafood', 'Salad', 'Nugget', 'Soup'];
var others = ['Cake', 'Pie', 'Donut'];
var allFavorites = [...favorites, ...others];
print(allFavorites);
 
/* output
[Seafood, Salad, Nugget, Soup, Cake, Pie, Donut]
 */
~~~

Untuk mengatasi List yang bisa bernilai null, kita dapat menggunakan null-aware spread operator (**...?**).

~~~
var list;
var list2 = [0, ...?list];
print(list2);
 
/* output
[0]
 */
~~~

## Set

Set merupakan sebuah collection yang hanya dapat menyimpan nilai yang unik. Ini akan berguna ketika Anda tidak ingin ada data yang sama alias duplikasi dalam sebuah collection.

~~~
var numberSet = {1, 4, 6};
Set<int> anotherSet = new Set.from([1, 4, 6, 4, 1]);

print(anotherSet);
// Output: {1, 4, 6}
~~~

Untuk menambahkan data ke dalam Set kita dapat memanfaatkan fungsi **add()** atau **addAll()**. Fungsi add akan menambah satu item ke dalam Set, sementara addAll digunakan untuk menambahkan beberapa item sekaligus.

~~~
numberSet.add(6);
numberSet.addAll({2, 2, 3});
~~~

Fungsi **remove()** untuk menghapus objek di dalam set yang diinginkan.

~~~
numberSet.remove(3);
~~~

Untuk menampilkan data pada indeks tertentu, gunakanlah fungsi **elementAt()**.

~~~
var numberSet = {1, 4, 6};
 
numberSet.add(6);
numberSet.addAll({2, 2, 3});
numberSet.remove(3);
  
print(numberSet.elementAt(2));
 
// Output: 6
~~~

Dart juga memiliki fungsi **union** dan **intersection** untuk mengetahui gabungan dan irisan dari 2 (dua) buah Set.

~~~
var setA = {1, 2, 4, 5};
var setB = {1, 5, 7};
 
var union = setA.union(setB);
var intersection = setA.intersection(setB);
 
print(union);
print(intersection);
 
// union: {1, 2, 4, 5, 7}
// intersection: {1, 5}
~~~

## Map

Map adalah sebuah collection yang dapat menyimpan data dengan format key-value.

~~~
var capital = {
  'Jakarta': 'Indonesia',
  'London': 'England',
  'Tokyo': 'Japan'
};
~~~

String yang berada pada sebelah kiri titik dua (:) adalah sebuah key, sedangkan yang di sebelah kanan merupakan value-nya. Lalu untuk mengakses nilai dari Map tersebut, kita bisa menggunakan key yang sudah dimasukkan.

~~~
print(capital['Jakarta']);
 
// Output: Indonesia
~~~

Kita dapat menampilkan key apa saja yang ada di dalam Map dengan menggunakan property **keys**.

~~~
var mapKeys = capital.keys;
 
// mapKeys = (Jakarta, London, Tokyo)
~~~

Sedangkan untuk mengetahui nilai apa saja yang ada di dalam Map kita bisa menggunakan property **values**.

~~~
var mapValues = capital.values;
 
// mapValues = (Indonesia, England, Japan)
~~~