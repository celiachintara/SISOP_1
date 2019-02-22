# SoalShift_modul1_C16

# NOMOR 1

![nomer1_bash](https://user-images.githubusercontent.com/36990542/53146700-c8865b80-35d7-11e9-94ae-8ece434cc947.jpg)


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

![nomer1_crontab](https://user-images.githubusercontent.com/36990542/53197276-6fa4da80-364c-11e9-946e-44178f4e70de.jpg)

14 pertama menunjukkan menit ke-14.

14 kedua menunjukkan jam ke-14.

14 ketiga menunjukkan tanggal 14.

2 menunjukkan bulan 2 yaitu februari.

* menunjukkan hari apa saja.

untuk crontab yang kedua menunjukkan bebas pada menit berapa saja, jam berapa saja, tanggal berapa saja, bulan februari, dan hari ke-5 yaitu hari Jumat.

jika aturan cron tab telah terpenuhi, maka foto-foto tersebut akan muncul pada home.

![nomor1_foto](https://user-images.githubusercontent.com/36990542/53142066-21002d80-35c5-11e9-9811-bdf91e1bf8a9.png)



# NOMOR 2
![nomer2](https://user-images.githubusercontent.com/36990542/53225061-5aaa6480-36a9-11e9-8db7-b7f6b8bcf41e.jpg)

untuk mencari jawaban poin a, digunakan perintah sebagai berikut :
awk -F , 'NR > 1 && max < $10 && $7 == "2012" { max = $1 }
END { print max }' WA_Sales_Products_2012-14.csv

untuk mencari jawaban pon b, digunakan perintah sebagai berikut :
awk -F, '{ if($1=="United States" && $7=="2012") x[$4] += $10;} 
END{for(i in x) print x[i]","i}' WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2 , $1}'

setelah disorting dengan sort -n -r , digunakan head -n 3 untuk mengambil 3 produk teratas. kemudian yang akan dicetak yaitu nama produk dan total penjualannya.

untuk mencari jawaban poin c, digunakan perintah sebagai berikut :
awk -F, '{ if($1=="United States" && $7=="2012" && 
( $4=="Personal Accessories" || $4=="Outdoor Protection" || $4=="Camping Equipment") ) x[$6] += $10;} 
END { for(i in x) print x[i]","i}' WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2 , $1}'

sama seperti poin b, namun ada tambahan kondisi yaitu kita akan mengambil data dimana kolom ke-4 nya memiliki nilai "Personal Accessories" atau "Camping Equipment" atau "Outdoor Protection".
kemudian yang akan dicetak yaitu  nama produk dan total penjualannya.

![nomer2jawaban](https://user-images.githubusercontent.com/36990542/53225580-22a42100-36ab-11e9-85ad-9b38521df142.jpg)



# NOMOR 3

A.

![nomer3a_bash](https://user-images.githubusercontent.com/36990542/53147092-164f9380-35d9-11e9-8345-6315952c80d5.jpg)


cat /dev/urandom -> perintah untuk mengambil sekumpulan karakter secara random.

tr -dc 'a-zA-Z0-9' -> menghapus karakter selain syarat yang ada didalam single quote ('...').

fold -w 12 -> terdiri dari 12 karakter.

head -n 1 -> mengambil baris pertama.

echo "$PASS" >> "password1.txt" -> mencetak isi variabel PASS , kemudian disimpan dalam file bernama password1.txt, tanda ">>" artinya setiap kali melakukan bash script tersebut, password random baru akan ditambahkan diakhir file tersebut.

![nomer3a_ls](https://user-images.githubusercontent.com/36990542/53147125-2798a000-35d9-11e9-826a-2b373bd30d3d.jpg)

![nomer3a_pass](https://user-images.githubusercontent.com/36990542/53147169-4ac34f80-35d9-11e9-82bd-331df0b57fd9.jpg)

setelah melakukan bash soal3a.sh lagi, maka akan ditambahkan password random baru diakhir file tersebut, seperti gambar dibawah ini.

![nomer3a_pass2](https://user-images.githubusercontent.com/36990542/53147220-76ded080-35d9-11e9-84b9-8cc77e20a312.jpg)


B dan C

![nomer3bcd_bash](https://user-images.githubusercontent.com/36990542/53147331-dd63ee80-35d9-11e9-8344-62720fe868c7.jpg)

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

jika diantara file password1.txt - password4.txt , misalnya file password2.txt dihapus, saat kita melakukan bash soal3bcd.sh maka file yang akan muncul yaitu file dengan nama password2.txt terlebih dahulu untuk melengkapi urutan nama filenya. jika dilakukan bash lagi setelah itu, barulah file yang akan muncul yaitu file dengan nama password5.txt dan seterusnya.

![nomer3bcd_ls](https://user-images.githubusercontent.com/36990542/53147730-09cc3a80-35db-11e9-8e9a-5d7eb480b891.jpg)

![nomer3bcd_ls2](https://user-images.githubusercontent.com/36990542/53147892-7ba48400-35db-11e9-8719-1bfe209e7a70.jpg)


D. 

cat /dev/urandom -> perintah untuk mengambil sekumpulan karakter secara random.


# NOMOR 4

![nomer4_waktu](https://user-images.githubusercontent.com/36990542/53227712-9f39fe00-36b1-11e9-9e0a-bfb6f99c11f8.jpg)

perintah diatas digunakan untuk mengambil waktu(jam) , waktu(HH:MM) , dan tanggal.
kemudian disimpan dalam file .txt sendiri-sendiri.
setelah itu kita membuat variable dan mengakses isi file .txt tadi untuk digunakan didalam script.

![nomer4_enkripsi](https://user-images.githubusercontent.com/36990542/53228370-91857800-36b3-11e9-98fd-c6f6d421a22f.jpg)

Untuk enkripsi, script diatas digunakan untuk mengatur batas bawah a ke huruf lainnya dengan mengubah desimal ke ASCII, kemudian menentukan batas atas z ke huruf lainnya dengan mengubah kode ASCII menjadi desimal dan mengembalikannya ke ASCII lagi.

kemudian, mengatur batas bawah A ke huruf lainnya dengan mengubah desimal menjadi ASCII, dan mengatur batas atas Z ke huruf lainnya dengan mengubahnya dari ASCII menjadi desimal dan dikembalikan lagi ke ASCII

kemudian, hasil akan disimpan ke dalam sebuah file .txt dengan format penamaan sesuai waktu dan tanggal yang sudah kita peroleh dari script diatas.

![nomer4_dekripsi](https://user-images.githubusercontent.com/36990542/53228667-723b1a80-36b4-11e9-837c-d69bf4abf50d.jpg)

Untuk dekripsi, kita akan mengubah lagi batas bawah huruf kecil dari desimal ke ASCII, dan batas atas huruf kecil dari ASCII ke desimal dan dikembalikan lagi ke ASCII. Begitu juga untuk batas bawah dan batas atas huruf besarnya.

kemudian hasil dekripsi diatas akan disimpan ke dalam sebuah file .txt dengan format penamaan menggunakan waktu dan tanggal yang kita peroleh dari script diatas serta ditambahkan kata -dekripsi sebagai pembedanya.

![nomer4_cron](https://user-images.githubusercontent.com/36990542/53228827-02795f80-36b5-11e9-9e2d-2e43a7725fbf.jpg)

sesuai perintah soal, backup file syslog dilakukan setiap jam. Maka kita buatkan crontab dengan aturan 0 * * * * , yang artinya script soal4.sh akan dijalankan setiap menit ke 0 untuk sembarang jam,hari,tanggal,dan bulan.

# NOMOR 5

A.

![nomer5a_bash](https://user-images.githubusercontent.com/36990542/53150928-5f591500-35e4-11e9-85cf-3e122f2bf43f.jpg)

mencetak log yang mengandung kata "cron" atau "CRON" dan tidak mencetak log yang mengandung kata "sudo".

![nomer5a_cron](https://user-images.githubusercontent.com/36990542/53150939-65e78c80-35e4-11e9-8d97-f2ed95c7921d.jpg)

![nomer5a_cron2](https://user-images.githubusercontent.com/36990542/53150952-6d0e9a80-35e4-11e9-9691-27db4b142049.jpg)

![nomer5a_sudo](https://user-images.githubusercontent.com/36990542/53150965-7861c600-35e4-11e9-9f89-0061890dc8a1.jpg)


B.

![nomer5b_bash](https://user-images.githubusercontent.com/36990542/53151091-d9899980-35e4-11e9-891f-03b26a0020ca.jpg)

ada tambahan && (NF<13) yang membatasi bawah jumlah fieldnya harus kurang dari 13 yang dapat ditampilkan.

![nomer5b](https://user-images.githubusercontent.com/36990542/53151104-e0181100-35e4-11e9-96cc-03f73ab12df2.jpg)


C.

![nomer5c_bash](https://user-images.githubusercontent.com/36990542/53151262-53ba1e00-35e5-11e9-9daa-468e86805d8b.jpg)

ada tambahan >> /home/celiachintara/SISOP/prak1/soal5.log , ini akan membuat sebuah file bernama soal5.log dan berisikan log-log yang diminta.

![nomer5c_ls](https://user-images.githubusercontent.com/36990542/53151308-78ae9100-35e5-11e9-98ad-e4f8ad4aa933.jpg)

![nomer5c_log](https://user-images.githubusercontent.com/36990542/53151327-8106cc00-35e5-11e9-8f8f-644be5d11993.jpg)


D.

![nomer5d](https://user-images.githubusercontent.com/36990542/53197367-a24ed300-364c-11e9-89e4-e0d4e5898689.jpg)


2-30/6 artinya mulai menit ke-2 sampai menit ke-30 setiap 6 menit sekali.
* kedua sampai kelima artinya bebas di semua jam, tanggal, bulan, dan hari.
