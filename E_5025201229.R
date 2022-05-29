#NAMA   : Surya Abdillah
#NRP    : 5025201229
#KELAS  : PROBSTAT E

# PRAKTIKUM MODUL 2

#### [NOMOR 1] ####
# Menginsett data ke Rstudio
data = read.csv("C:/Users/LENOVO/Downloads/prak.csv")
data
# A
#   DATA SELISIH
selisih = data$Y - data$X
selisih
#   STANDAR DEVIASI
sd(selisih)
# B
t.test(data$Y, data$X, paired=TRUE)
# C
#   mencari nilai kritis dari t table, dengan df = 8, alpha = 0.05
qt(p = .05/2, df=8, lower.tail = FALSE)
#   didapatkan nilai kritis 2.306004. 
#Dari hal ini dapat kita simpulkan nilai t hitung > t kritis, yakni 7.6525 > 2.306004
#Sehingga hipotesis nol ditolak dan hipotesis alternatif diterima.
#   Hal ini menunjukkan bahwa terdapat pengaruh yang signifikan secara statistika 
#dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas A

#### [NOMOR 2] ####
#variabel-variabel
klaim_rata <- 20000
n <- 100
sample_rata <- 23500
sample_sd <- 3900
#menentukan H0 dan H1
# H0: mean >= 20000
# H1: mean < 20000

#menentukan tes statistik
# karena n > 30, maka kita gunakan tabel Z

#menentukan interval confidence dan poin kritis
# pada soal tidak disebutkan nilai interval confidence, sehingga akan dianggap 0.05
# menghitung nilai kritis
nilai_kritis <- qnorm(p=.05, lower.tail = FALSE)
nilai_kritis

#menghitung nilai statistik
z_score <- (sample_rata - klaim_rata) / (sample_sd * sqrt(n))
z_score

# A
if (abs(z_score) < abs(nilai_kritis)){
  print("SAYA SETUJU dengan KLAIM")
} else {
  print("SAYA TIDAK SETUJU dengan KLAIM")
}

# B
# variabel nilai_kritis menyimpan nilai kritis, di mana dalam soal ini
#didapatkan nilai 1.644854, angka ini akan menjadi jangkauan untuk menerima H0.
#Sedangkan, diluar jangkauan akan menolak H0. jangkauan: -1.644854 sampai 1.644854.
nilai_kritis
# variabel z_score menyimpan nilai Z dari perhitungan. Nilai ini akan dibandingkan
#dengan jangkauan penerimaan dari nilai_kritis. apabila berada dalam jangkauan, maka
#menerima H0. Sedangkan, apabila di luar jangkauan menolak H0.
# Dalam soal ini didapati nilai z 0.08974359
z_score

# C
# Karena nilai z dari perhitungan berada di dalam area "tidak tolak H0", maka
#dapat disimpulkan bahwa sample tidak memiliki cukup bukti untuk menolak H0 (menerima H0)
#Jadi, rata-rata mobil dikemudikan secara signifikan lebih dari 20000 km per tahun

#### [NOMOR 3] ####
#variabel-variabel
n_bandung <- 19
n_bali <- 27
mean_bandung <- 3.64
mean_bali <- 2.79
sd_bandung <- 1.67
sd_bali <- 1.32
alpha <- 0.05
df <- 2

# A: H0 dan H1
#H0: mean(Bandung) <= mean(Bali)
#H1: mean(Bandung) > mean(Bali)

# B: hitung sample statistik
#n(Bandung):  19 < 30 -> menggunakan t stat
#n(Bali): 27 < 30 -> menggunakan t stat
sample_bandung <- ((df+1) * n_bandung) / (df + 1 + n_bandung - 1)
sample_bandung

sample_bali <- ((df+1) * n_bali) / (df + 1 + n_bali - 1)
sample_bali
# C: lakukan uji statistik, df = 2
#A: bandung, B: Bali
install.packages("BSDA")
library("BSDA")
tsum.test(mean.x=mean_bandung, s.x = sd_bandung, n.x =n_bandung, 
          mean.y =mean_bali , s.y = sd_bali, n.y = n_bali, 
          alternative = "greater", 
          mu = 0, var.equal = TRUE,
          conf.level = (1-alpha))
#didapatkan hasil nilai-t = 1.9267, p-value = 0.03024

# D: nilai kritikal
nilai2_kritis <- qt(p = alpha/2, df = 2, lower.tail = FALSE)
nilai2_kritis

# E: keputusan
# Karena nilai-t hitung lebih kecil dari titik kritis 
#(nilai-t hitung berada dalam jangkauan area menerima H0)
#maka tidak ada bukti yang cukup untuk menolak H0

# F: kesimpulan
# Rata-rata nilai saham di Bandung lebih kecil atau 
#sama dengan di Bali


#### [NOMOR 4] ####
#variabel
data4 = read.delim("C:/Users/LENOVO/Downloads/onewayanova.txt", header = TRUE, sep = "\t", dec = ".")
data4
#H0: Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

# A
install.packages("ggpubr")
library("ggpubr")
ggboxplot(data4, x = "Group", y = "Length",
          color = "Group", 
          palette = c("#00AFBB","#E7B800","#FC4E07"),
          order = c("1", "2", "3"), 
          ylab = "Length", xlab = "Treatment")
# keberadaan outlier ditandakan dengan adanya lingkaran  (data) yang berada
#diluar kotak grupnya. Dalam kasus ini tidak ada lingkaran di luar grup, sehingga
#bisa dikatakan bahwa tidak ada outlier

# B
anova = aov(Length ~ Group, data = data4)
summary(anova)
# homogeneity of variance
#H0: variance sama
#H1: variance berbeda-beda
result = bartlett.test(Length ~ Group, data = data4)
print(result)
# dari bartlett test di atas, didapatkan nilai p-value sebesar 0.8054, di mana
#nilai ini lebih besar dari pada alpha (0.05), sehingga menerima H0
#dalam arti lain, tidak ada bukti yang cukup  untuk menunjukkan
#ketiga grup memiliki variance yang berbeda. (nilai variance ketiga grup sama)
#ketiga variance homogen
#P-value
summary(anova)[[1]][1,5]

# C
model_1 <- lm(Length ~ Group, data = data4)
summary(model_1)
#titik
plot(data4$Length, data4$Group, main = "model 1")

# D
# Dari hasil poin C didapatkan nilai p-value sebesar 0.6400532
# karena nilai p-value lebih besa dari alpha (0.05), maka menerima H0
#dengan kata lain tidak ada perbedaan panjang antara ketiga spesies atau
#rata-rata panjangnya sama

# E
data4.aov.factor = aov(Length ~ factor(Group), data = data4)
summary(data4.aov.factor)

TukeyHSD(data4.aov.factor)
# Dari Tukey HSD, didapatkan 2 perbedaan data yang lebih kecil dari alpha (0.05)
#yang berarti menolak H0, yakni data 2-1, dan data 3-2. 
#Sedangkan data 3-1 lebih besar dari alpha (0.05), yang berarti menerima H0
# Apabila diperhatikan, hasil dari kedua metode seperti berlawanan. Namun, pada
#dasarnya kedua metode ini memang memiliki tujuannya masing-masing. Sehingga, 
#hasil dari kedua metode ini memang tidak bisa dibandingkan

# F
#titik
plot(data4$Length, data4$Group, main = "model 1")
#box
library(ggplot2)
plant.df = PlantGrowth
data4$Group = factor(data4$Group,labels = c("1","2","3"))

attach(data4)
ggplot(data4,aes(Group,Length,fill=Group))+geom_boxplot(aes(reorder(Group,Length,median)),color="blue",notch = F)


#### [NOMOR 5] ####
GTL <- read.csv("C:/Users/LENOVO/Downloads/GTL.csv")
head(GTL)

str(GTL)
# A
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
# B
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
# C
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
# D
tukey <- TukeyHSD(anova)
print(tukey)
# E
install.packages("multcompView")

library("multcompView")
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
