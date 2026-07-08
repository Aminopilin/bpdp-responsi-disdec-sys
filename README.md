# bpdp-responsi-disdec-sys
Nama : Aulia Rachmi Liunsanda <br>
NIM : 235410009
Kelas : Informatika 1

soal Responsi
1. Dengan menggunakan Docker, jalankan YugabyteDB dan kemudian buat 2 tabel dengan nama bebas dan isi kolom bebas. Isikan masing-masing 5 data. Buktikan bahwa 2 tabel dibuat dan data juga telah diisikan. Anda bisa menggunakan ysqlsh atau YugabyteDB UI.
docker-running
   <img width="922" height="377" alt="image" src="https://github.com/user-attachments/assets/6750656a-6a4b-4d84-8d45-652284d53519" />
   Screenshot ini menunjukkan bahwa container YugabyteDB berhasil dijalankan menggunakan Docker. Terlihat container dengan status Up, yang menandakan database siap digunakan.
membuat tabel
<img width="582" height="300" alt="image" src="https://github.com/user-attachments/assets/f2637e22-52a8-4cd4-b937-3162147dd562" />
Screenshot ini menunjukkan proses pembuatan dua tabel, yaitu mahasiswa dan matakuliah, menggunakan perintah CREATE TABLE pada YugabyteDB. Kedua tabel berhasil dibuat tanpa error.
<img width="497" height="618" alt="image" src="https://github.com/user-attachments/assets/fe9d0fa9-7d72-48bd-ad8f-25467d71220a" />
Screenshot ini menampilkan hasil perintah SELECT * FROM mahasiswa;. dan SELECT * FROM matakuliah;. Terlihat terdapat 5 data mahasiswa dan data mata kuliah yang berhasil disimpan ke dalam tabel sebagai bukti proses insert data berhasil.
   
2. Buatlah REST API menggunakan Python yang akan mengekspos data yang telah anda buat tersebut menggunakan Python. Hasil bisa diakses melalui browser atau headless tool (curl) dalam format JSON.

   <img width="953" height="143" alt="image" src="https://github.com/user-attachments/assets/2ac05671-54f7-481e-9469-87cd6448d533" />

   <img width="958" height="547" alt="image" src="https://github.com/user-attachments/assets/67618da5-fdcc-4258-ab2e-63bbf07370f0" />

   <img width="953" height="547" alt="image" src="https://github.com/user-attachments/assets/948c0865-27d0-47bc-8836-bb36b24842aa" />
Screenshot ini menunjukkan bahwa REST API berbasis Python (Flask) berhasil dijalankan. Data dari tabel mahasiswa ditampilkan dalam format JSON dan dapat diakses melalui browser menggunakan endpoint http://localhost:5000/mahasiswa.
test curll
<img width="1425" height="572" alt="image" src="https://github.com/user-attachments/assets/ff38c107-9ef6-4b30-8da5-7669a02624d7" />
<img width="1427" height="577" alt="image" src="https://github.com/user-attachments/assets/7cc2c918-3358-4ed5-bbcb-e88eb5846a74" />
Screenshot ini menunjukkan hasil pengujian REST API menggunakan perintah curl di PowerShell. Respons yang diterima berupa data JSON, sehingga membuktikan bahwa endpoint API dapat diakses melalui aplikasi headless sesuai ketentuan soal.

3. Pilihlah blockchain L1 selain Solana. Jelaskan mekanisme konsensus yang digunakan dan buat diagram mekanisme konsensus blockchain tersebut.
   
Mekanisme Konsensus Ethereum: Gasper (PoS)
Ethereum menggunakan mekanisme konsensus bernama Gasper, gabungan dari dua protokol:
1. LMD-GHOST (Latest Message Driven Greediest Heaviest Observed SubTree) menentukan cabang (fork) mana yang menjadi kepala rantai (head of chain) yang sah, berdasarkan bobot atestasi validator terbaru.
2. Casper FFG (Friendly Finality Gadget) mekanisme untuk finalisasi, yaitu mengunci blok agar tidak bisa diubah lagi (irreversible).

Alur kerja singkat
1. Waktu dibagi menjadi slot (12 detik) dan epoch (32 slot, ~6,4 menit).
2. Setiap slot, satu validator dipilih secara acak (berbobot jumlah stake, minimal 32 ETH) untuk menjadi proposer dan mengusulkan blok baru.
3. Validator lain yang tergabung dalam committee memberikan atestasi (vote) yang menyatakan blok mana yang mereka anggap sah.
4. Atestasi ini menjadi dasar bagi LMD-GHOST untuk memilih fork terbaik secara real-time.
5. Setiap akhir epoch, Casper FFG memilih checkpoint (blok pertama tiap epoch). Jika ⅔ dari total stake mengatestasi sebuah checkpoint, checkpoint tersebut jadi justified; jika dua checkpoint berurutan justified, checkpoint pertama menjadi finalized.
6. Validator yang berbuat curang (misalnya menandatangani dua blok konflik/"double vote") akan terkena slashing — sebagian stake-nya disita.

Alur diagram
<img width="725" height="795" alt="image" src="https://github.com/user-attachments/assets/462c48b9-f79a-429c-b826-17132dd11fa5" />

Alur konsensus Ethereum PoS (Gasper):
1. Staking — validator mengunci minimal 32 ETH untuk ikut serta.
2. Pemilihan proposer — setiap slot (12 detik), satu validator dipilih acak (berbobot stake) untuk mengusulkan blok.
3. Atestasi committee — validator lain dalam committee memvalidasi dan memberi vote (atestasi) atas blok tersebut.
4. LMD-GHOST (fork choice) — atestasi ini dipakai untuk menentukan cabang rantai mana yang "terberat" dan menjadi kepala rantai yang sah, secara real-time.
5. Casper FFG — justifikasi — di akhir tiap epoch (32 slot, ~6,4 menit), jika ⅔ dari total stake mengatestasi sebuah checkpoint, checkpoint itu menjadi justified.
6. Casper FFG — finalisasi — jika dua checkpoint berurutan sama-sama justified, checkpoint pertama menjadi finalized — tidak bisa diubah lagi kecuali ⅓ total stake bersedia kena slashing.
7. Slashing — jika validator terbukti curang (misalnya menandatangani dua blok yang saling bertentangan pada slot yang sama, "double vote"), sebagian stake-nya disita dan validator tersebut dikeluarkan dari jaringan.



