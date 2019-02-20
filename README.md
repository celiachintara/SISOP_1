# SoalShift_modul1_C16

NOMOR 1

![nomor1_bash](https://user-images.githubusercontent.com/36990542/53089413-1733e700-353f-11e9-8dea-0877f723e6e3.png)



langkah pertama yaitu lakukan perintah pada terminal "unzip nature.zip".

setelah folder nature.zip ter-extract, pindahkan seluruh file .jpg nya ke home. pastikan pada home tidak ada file berekstensi .jpg lainnya.

selanjutnya, membuat sebuah file dengan nama "soal1.sh"
kemudian lakukan perintah "nano soal1.sh" pada terminal, dan tuliskan script seperti gambar diatas.

#!/bin/bash -> merupakan deklarasi untuk menjalankan fungsi bash.

no=1 -> variabel bernama no dengan value 1, nantinya akan digunakan untuk penamaan gambar hasil extractnya..

for file in *.jpg -> melakukan iterasi seluruh file yang berekstensi .jpg yang ada pada home.

do base64 -d "$file" | xxd -r > "pict"$no".jpg" -> mengdekode file satu per satu dengan base64 dan hasilnya diganti namanya menjadi "pict"$no".jpg" . $no berisi angka mulai dari 1 dan seterusnya.

let no++ -> meng-increment nilai variabel no.

done -> penutup iterasi for.

sesuai permintaan di soal, aturan crontab yang digunakan adalah sebagai berikut :

![nomor1_cron](https://user-images.githubusercontent.com/36990542/53089637-b527b180-353f-11e9-94df-d682e82be0bd.png)


14 pertama menunjukkan menit ke-14.

14 kedua menunjukkan jam ke-14.

14 ketiga menunjukkan tanggal 14.

2 menunjukkan bulan 2 yaitu februari.

5 menunjukkan hari jumat.

jika aturan cron tab telah terpenuhi, maka foto-foto tersebut akan muncul pada folder dimana soal1.sh disimpan.


NOMOR 2

![nomor2a_bash](https://user-images.githubusercontent.com/36990542/53113603-9263c000-3574-11e9-83ae-690112122ef1.png)





NOMOR 3

A.

![nomor3a_bash](https://user-images.githubusercontent.com/36990542/53087761-79d6b400-353a-11e9-82af-54be0a36fcf3.png)


cat /dev/urandom -> perintah untuk mengambil sekumpulan karakter secara random.

tr -dc 'a-zA-Z0-9' -> menghapus karakter selain syarat yang ada didalam single quote ('...').

fold -w 12 -> terdiri dari 12 karakter.

head -n 1 -> mengambil baris pertama.

echo "$PASS" >> "password1.txt" -> mencetak isi variabel PASS , kemudian disimpan dalam file bernama password1.txt, tanda ">>" artinya setiap kali melakukan bash script tersebut, password random baru akan ditambahkan diakhir file tersebut.


![nomor3_bash](https://user-images.githubusercontent.com/36990542/53090255-6713ad80-3541-11e9-99c8-832cde3d647a.png)

B dan C

number=0 -> variabel bernama number dengan nilai 0, digunakan untuk menentukan nilai variable suffix.

suffix=1 -> variable bernama suffix dengan nilai 1, nantinya digunakana untuk penamaan file .txt nya.

while test -e "password$suffix.txt" -> mengecek selama file dengan nama tersebut ada, maka perintah didalamnya dijalankan.

do ((++number)) -> meng-increment nilai variable number.

suffix="$( printf -- '%d' "$number")" -> mengganti nilai suffix dengan nilai number (yang dapat dipastikan bahwa file dengan nama "password$number.txt" belum ada).

done -> penutup iterasi while.

cat /dev/urandom -> perintah untuk mengambil sekumpulan karakter secara random.

tr -dc 'a-zA-Z0-9' -> menghapus karakter selain syarat yang ada didalam single quote ('...').

fold -w 12 -> terdiri dari 12 karakter.

head -n 1 -> mengambil baris pertama.

echo "$PASS" >> "password$suffix.txt" -> mencetak isi variabel PASS , kemudian disimpan dalam file bernama "password$suffix.txt".


D. cat /dev/urandom -> perintah untuk mengambil sekumpulan karakter secara random.


NOMOR 4
(penjelasan nomor 4)


NOMOR 5
