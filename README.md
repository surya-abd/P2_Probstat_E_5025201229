# P2_Probstat_E_5025201229
- Nama : Surya Abdillah
- NRP : 5025201229
- Kelas : Probabilitas dan Statistika E

## _Soal 1_
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas  
<img width="186" alt="image" src="https://user-images.githubusercontent.com/103357229/170876957-7645c0fd-be11-42aa-94e6-f7a3c7e32b6c.png">
Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70
> Mengambil data set ke R. data set bisa di lihat pada folder di repository. untuk path bisa disesuaikan
```sh
data = read.csv("C:/Users/LENOVO/Downloads/prak.csv")
data
```
<img width="61" alt="image" src="https://user-images.githubusercontent.com/103357229/170878094-d0441306-b6e7-491b-9c6a-a27d6db2b4f4.png">
### 1.A.
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
> mendapatkan data selisih
```sh
selisih = data$Y - data$X
selisih
```
<img width="196" alt="image" src="https://user-images.githubusercontent.com/103357229/170878081-9228d090-8773-4788-b169-8b43120683fa.png">
> Untuk mendapatkan standar deviasinya, dapat digunakan fungsi `sd()`

```sh
sd(selisih)
```
<img width="92" alt="image" src="https://user-images.githubusercontent.com/103357229/170878221-abfd0f0a-056f-4a78-809e-9342f2247897.png">
### 1.B.
carilah nilai t (p-value)
> nilai t(p-value) dapat kita cari menggunakan fungsi `t.test`

```sh
t.test(data$Y, data$X, paired=TRUE)
```
<img width="389" alt="image" src="https://user-images.githubusercontent.com/103357229/170878253-cf42fdf6-3ab6-4e99-9002-abc8be28f353.png">
jadi didapatkan nilai t(p-value) adalah 7.6525
### 1.C.
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”
> mencari nilai kritis dari t table, dengan df = 8, alpha = 0.05

```sh
qt(p = .05/2, df=8, lower.tail = FALSE)
```
<img width="240" alt="image" src="https://user-images.githubusercontent.com/103357229/170878392-ad03f49f-e2df-4bbb-9d0d-13fb1bb1442a.png">
didapatkan nilai kritis 2.306004. Dari hal ini dapat kita simpulkan nilai t hitung > t kritis, yakni 7.6525 > 2.306004 Sehingga hipotesis nol ditolak dan hipotesis alternatif diterima. 
Hal ini menunjukkan bahwa terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A
## _Soal 2_
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).
> Memasukkan variabel-variabel yang diketahui, Karena dalam soal tidak diketahui confidence level, maka nilai confidence level akan diset menjadi 5% (alpha)

```sh
klaim_rata <- 20000
n <- 100
sample_rata <- 23500
sample_sd <- 3900
```

> Melakukan uji statistik
> Menentukan H0 dan H1
H0: mean >= 20000
H1: mean < 20000
> menentukan tes statistik

karena n > 30, maka kita gunakan tabel Z
> menentukan interval confidence dan poin kritis

pada soal tidak disebutkan nilai interval confidence, sehingga akan dianggap 0.05
> menghitung nilai kritis

```sh
nilai_kritis <- qnorm(p=.05, lower.tail = FALSE)
nilai_kritis
```
> menghitung nilai statistik

```sh
z_score <- (sample_rata - klaim_rata) / (sample_sd * sqrt(n))
z_score
```

### 2.A.
Apakah Anda setuju dengan klaim tersebut?
> saya akan setuju dengan klaim apabila nilai z hitung lebih kecil dari nilai kritis.

Ya, SAYA SETUJU dengan KLAIM
```sh
if (abs(z_score) < abs(nilai_kritis)){
  print("SAYA SETUJU dengan KLAIM")
} else {
  print("SAYA TIDAK SETUJU dengan KLAIM")
}
```

### 2.B.
Jelaskan maksud dari output yang dihasilkan!
> variabel nilai_kritis menyimpan nilai kritis, di mana dalam soal ini didapatkan nilai 1.644854, angka ini akan menjadi jangkauan untuk menerima H0. Sedangkan, diluar jangkauan akan menolak H0. jangkauan: -1.644854 sampai 1.644854.

```sh
nilai_kritis
```
> variabel z_score menyimpan nilai Z dari perhitungan. Nilai ini akan dibandingkan dengan jangkauan penerimaan dari nilai_kritis. apabila berada dalam jangkauan, maka menerima H0. Sedangkan, apabila di luar jangkauan menolak H0. Dalam soal ini didapati nilai z 0.08974359

```sh
z_score
```
<img width="91" alt="image" src="https://user-images.githubusercontent.com/103357229/170878955-dbc5cc13-c8fd-4518-8ecc-a4a80281ab7e.png">

### 2.C.
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
> Karena nilai z dari perhitungan berada di dalam area "tidak tolak H0", maka dapat disimpulkan bahwa sample tidak memiliki cukup bukti untuk menolak H0 (menerima H0) Jadi, `rata-rata mobil dikemudikan secara signifikan lebih dari 20000 km per tahun`

## _Soal 3_
 Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.
<img width="377" alt="image" src="https://user-images.githubusercontent.com/103357229/170877233-3f932f61-60c7-4bb2-b70e-1683f008dde8.png">
Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :
> Memasukkan variabel-variabel yang diketahui

```sh
n_bandung <- 19
n_bali <- 27
mean_bandung <- 3.64
mean_bali <- 2.79
sd_bandung <- 1.67
sd_bali <- 1.32
alpha <- 0.05
df <- 2
```

### 3.A.
H0 dan H1
> H0: mean(Bandung) <= mean(Bali). H1: mean(Bandung) > mean(Bali)

### 3.B.
Hitung Sampel Statistik
```sh
#n(Bandung):  19 < 30 -> menggunakan t stat
#n(Bali): 27 < 30 -> menggunakan t stat
sample_bandung <- ((df+1) * n_bandung) / (df + 1 + n_bandung - 1)
sample_bandung

sample_bali <- ((df+1) * n_bali) / (df + 1 + n_bali - 1)
sample_bali
```
<img width="385" alt="image" src="https://user-images.githubusercontent.com/103357229/170879264-494acd66-3009-44f0-a0f7-f192c5852883.png">
Didapati nilai 2.714286 untuk sampel bandung dan 2.793103 untuk sampel bali
### 3.C.
Lakukan Uji Statistik (df =2)
> apabila library BSDA belum diinstall, maka dapat jalankan code berikut:

```sh
install.packages("BSDA")
```
> lanjutkan dengan code berikut:

```sh
library("BSDA")
tsum.test(mean.x=mean_bandung, s.x = sd_bandung, n.x =n_bandung, 
          mean.y =mean_bali , s.y = sd_bali, n.y = n_bali, 
          alternative = "greater", 
          mu = 0, var.equal = TRUE,
          conf.level = (1-alpha))
```
<img width="391" alt="image" src="https://user-images.githubusercontent.com/103357229/170879388-20c13324-a474-4d00-842d-d00a99a9b031.png">
didapatkan hasil nilai-t = 1.9267, p-value = 0.03024
### 3.D.
Nilai Kritikal
> Untuk mencari nilai kritis, kita dapat memanfaatkan fungsi `qt`

```sh
nilai2_kritis <- qt(p = alpha/2, df = 2, lower.tail = FALSE)
nilai2_kritis
```
<img width="361" alt="image" src="https://user-images.githubusercontent.com/103357229/170879458-00826d59-b271-4382-90d6-e5ec0a790b88.png">
### 3.E.
Keputusan
> Karena nilai-t hitung lebih kecil dari titik kritis (nilai-t hitung berada dalam jangkauan area menerima H0) maka tidak ada bukti yang cukup untuk menolak H0
### 3.F.
Kesimpulan
> Rata-rata nilai saham di Bandung lebih kecil atau sama dengan di Bali

## _Soal 4_
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing.
Jika :
[data set](https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt)
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama
Maka Kerjakan atau Carilah:
> Memasukkan data set ke R

```sh
data4 = read.delim("C:/Users/LENOVO/Downloads/onewayanova.txt", header = TRUE, sep = "\t", dec = ".")
data4
```
<img width="113" alt="image" src="https://user-images.githubusercontent.com/103357229/170879538-201cd874-d600-4a38-aa2b-36d8af8c8b09.png">
### 4.A.
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
> Apabila library ggpubr belum terinstall, maka dapat diinstall dengan code berikut:

```sh
install.packages("ggpubr")
```
> Lalu dapat dilanjutkan dengan code berikut

```sh
library("ggpubr")
ggboxplot(data4, x = "Group", y = "Length",
          color = "Group", 
          palette = c("#00AFBB","#E7B800","#FC4E07"),
          order = c("1", "2", "3"), 
          ylab = "Length", xlab = "Treatment")
```
![image](https://user-images.githubusercontent.com/103357229/170879670-23852138-8e4f-46da-a354-e613fe333be1.png)
keberadaan outlier ditandakan dengan adanya lingkaran  (data) yang berada diluar kotak grupnya. Dalam kasus ini tidak ada lingkaran di luar grup, sehingga bisa dikatakan bahwa tidak ada outlier

### 4.B.
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
> untuk melakukan anova, kita dapat menggunakan fungsi `aov` dan memanggil fungsi `summary` untuk melihat rincian terkait hasil anova

```sh
anova = aov(Length ~ Group, data = data4)
summary(anova)
```
<img width="262" alt="image" src="https://user-images.githubusercontent.com/103357229/170879771-463ecc5a-2441-47af-a0fa-920efff900c5.png">
> homogeneity of variance menggunakan `bartlett test` dengan H0: variance sama dan H1: variance berbeda-beda

```sh
result = bartlett.test(Length ~ Group, data = data4)
print(result)
```
<img width="329" alt="image" src="https://user-images.githubusercontent.com/103357229/170879871-f5dd84d0-c732-40cf-aa82-59d98b73bdeb.png">
dari bartlett test di atas, didapatkan nilai p-value sebesar 0.8054, di mana nilai ini lebih besar dari pada alpha (0.05), sehingga menerima H0 dalam arti lain, tidak ada bukti yang cukup  untuk menunjukkan ketiga grup memiliki variance yang berbeda. (nilai variance ketiga grup sama). ketiga variance homogen
> mengambil nilai P

```sh
summary(anova)[[1]][1,5]
```
<img width="165" alt="image" src="https://user-images.githubusercontent.com/103357229/170880039-f5b4c5e7-715f-4485-aa31-f4f07c55f56f.png">
### 4.C.
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
> dapat menggunakan fungsi `lm` untuk membuat model linear

```sh
model_1 <- lm(Length ~ Group, data = data4)
summary(model_1)
```
<img width="396" alt="image" src="https://user-images.githubusercontent.com/103357229/170880067-d1a3364a-d75f-4dc6-8223-e48f8f013e2b.png">
> membuat plot titik

```sh
plot(data4$Length, data4$Group, main = "model 1")
```
<img width="441" alt="image" src="https://user-images.githubusercontent.com/103357229/170880203-05cd8246-d218-494b-b21c-69e6f3b7b59b.png">
### 4.D.
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?
> Dari hasil poin C didapatkan nilai p-value sebesar 0.6400532 karena nilai p-value lebih besa dari alpha (0.05), maka menerima H0 dengan kata lain tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

### 4.E.
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.
> Menambahkan faktor

```sh
data4.aov.factor = aov(Length ~ factor(Group), data = data4)
summary(data4.aov.factor)
```
<img width="374" alt="image" src="https://user-images.githubusercontent.com/103357229/170880286-406ed582-ef09-4983-82ef-fcf2def67f93.png">
> TUKEY. bisa menggunakan fungsi `TukeyHSD`

```sh
TukeyHSD(data4.aov.factor)
```
<img width="333" alt="image" src="https://user-images.githubusercontent.com/103357229/170880349-9f267a6a-824a-4eec-8c9e-9770620ad655.png">
Dari Tukey HSD, didapatkan 2 perbedaan data yang lebih kecil dari alpha (0.05) yang berarti menolak H0, yakni data 2-1, dan data 3-2.  Sedangkan data 3-1 lebih besar dari alpha (0.05), yang berarti menerima H0
Apabila diperhatikan, hasil dari kedua metode seperti berlawanan. Namun, pada dasarnya kedua metode ini memang memiliki tujuannya masing-masing. Sehingga, hasil dari kedua metode ini memang tidak bisa dibandingkan

### 4.F.
Visualisasikan data dengan ggplot2
> titik

```sh
plot(data4$Length, data4$Group, main = "model 1")
```
> box menggunakna ggplot2. bila ggplot2 belum terinstall dapat gunakan command berikut

```sh
install.packages("ggplot2")
```
> lanjutkan code beirkut untuk plotting

```sh
library(ggplot2)
plant.df = PlantGrowth
data4$Group = factor(data4$Group,labels = c("1","2","3"))

attach(data4)
ggplot(data4,aes(Group,Length,fill=Group))+geom_boxplot(aes(reorder(Group,Length,median)),color="blue",notch = F)
```
<img width="439" alt="image" src="https://user-images.githubusercontent.com/103357229/170880521-3260eb82-be67-4a32-b960-c35fa08373c9.png">

## _Soal 5_
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:
[data set](https://drive.google.com/file/d/1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ/view)
> Memasukkan data set ke dalam R

```sh
GTL <- read.csv("C:/Users/LENOVO/Downloads/GTL.csv")
GTL
```
<img width="117" alt="image" src="https://user-images.githubusercontent.com/103357229/170880667-0dbc0614-f1d1-40fa-858e-935cb19162a6.png">
### 5.A.
Buatlah plot sederhana untuk visualisasi data
> dapat menggunakan fungsi `qplot`

```sh
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```
<img width="440" alt="image" src="https://user-images.githubusercontent.com/103357229/170880764-8f4fd252-17df-472b-b1f4-071917d5b2b5.png">
### 5.B.
Lakukan uji ANOVA dua arah
> memeriksa struktur data. dengan fungsi `str`

```sh
str(GTL)
```
<img width="355" alt="image" src="https://user-images.githubusercontent.com/103357229/170880895-ee95e2aa-5fea-4ad4-a1ff-c97f4ad3e91c.png">
> karena data set, belum merubah tipe data Glass dan Temp menjadi tipe factor dengan cara berikut:

```sh
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```
<img width="443" alt="image" src="https://user-images.githubusercontent.com/103357229/170880925-ea48d1f1-8819-43db-adc4-0f399d9cba7a.png">
> melakukan ANOVA dengan fungsi `aov`

```sh
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
<img width="376" alt="image" src="https://user-images.githubusercontent.com/103357229/170880986-a4a9fb4d-2d46-4e05-baba-2799ed71ee70.png">

### 5.C.
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

```sh
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
<img width="161" alt="image" src="https://user-images.githubusercontent.com/103357229/170881012-c537a626-e654-4bfc-982d-c50f1031f745.png">
### 5.D.
Lakukan uji Tukey
```sh
tukey <- TukeyHSD(anova)
print(tukey)
```
<img width="345" alt="image" src="https://user-images.githubusercontent.com/103357229/170881070-dddaac4e-047b-4149-8799-874a8535b05f.png">
### 5.E.
Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
> untuk menjalankan code berikut, diperlukan install multcompView

```sh
install.packages("multcompView")
```
> Lanjutkan dengan code berikut:

```sh
library("multcompView")
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
<img width="190" alt="image" src="https://user-images.githubusercontent.com/103357229/170881385-a3b9f87b-faa4-4d20-b4e4-d5fc08a0f835.png">

Berikut adalah contoh daftar package dan fungsi yang dapat digunakan (dapat pula menggunakan contoh lainnya)
- Packages: readr, ggplot2, multcompView, dplyr
- Function: aov, TukeyHSD, qplot, group_by, summarise, multcompLetters4

