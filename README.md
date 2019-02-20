# SoalShift_modul1_C16

NOMOR 1

![nomor1_bash](https://user-images.githubusercontent.com/36990542/53081647-d7183880-352d-11e9-8181-e5b4261114c7.png)


langkah pertama yaitu membuat sebuah file dengan nama "soal1.sh"
kemudian lakukan perintah "nano soal1.sh" pada terminal, dan tuliskan script seperti gambar diatas.

#!/bin/bash -> merupakan deklarasi untuk menjalankan fungsi bash.

no=1 -> variabel bernama no dengan value 1, nantinya akan digunakan untuk penamaan gambar hasil extractnya..

for file in nature/*.jpg -> melakukan iterasi seluruh file yang berekstensi .jpg pada folder nature..

do base64 -d "$file" | xxd -r > "pict"$no".jpg" -> mengdekode file satu per satu dengan base64 dan hasilnya diganti namanya menjadi "pict"$no".jpg" . $no berisi angka mulai dari 1 dan seterusnya.

let no++ -> meng-increment nilai variabel no.

done -> penutup iterasi for.

sesuai permintaan di soal, aturan crontab yang digunakan adalah sebagai berikut :
(screenshot aturan cron tab)
(penjelasan aturan cron tab)

jika aturan cron tab telah terpenuhi, maka foto-foto pada folder nature akan muncul pada folder dimana soal1.sh disimpan.


NOMOR 3
A.  ![nomor3a_bash](https://user-images.githubusercontent.com/36990542/53087761-79d6b400-353a-11e9-82af-54be0a36fcf3.png)


cat /dev/urandom -> perintah untuk mengambil sekumpulan karakter secara random.

tr -dc 'a-zA-Z0-9' -> menghapus karakter selain syarat yang ada didalam single quote ('...').

fold -w 12 -> terdiri dari 12 karakter.

head -n 1 -> mengambil baris pertama.

echo "$PASS" >> "password1.txt" -> mencetak isi variabel PASS , kemudian disimpan dalam file bernama password1.txt, tanda ">>" artinya setiap kali melakukan bash script tersebut, password random baru akan ditambahkan diakhir file tersebut.
