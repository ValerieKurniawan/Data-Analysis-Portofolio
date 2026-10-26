## Problem
- Ketidakpastian strategi penetapan harga tiket dapat mengurangi minat audiens dan menggerus pendapatan bioskop
- Perlu pemetaan hubungan antara harga tiket, preferensi lokasi, alokasi anggaran, dan frekuensi kunjungan

## What to do
- Mengumpulkan dan membersihkan data survei dari 121 responden menggunakan bahasa pemrograman R
- Melakukan analisis deskriptif untuk mengidentifikasi modus dan distribusi jawaban pada setiap pernyataan kuesioner
- Menguji reliabilitas instrumen kuesioner menggunakan metrik Cronbach's Alpha untuk memastikan konsistensi internal
- Menerapkan Chi-Square Test untuk menguji independensi antar variabel kategorikal seperti harga tiket, lokasi, dan frekuensi kunjungan
- Menerapkan uji korelasi Spearman untuk mengukur kekuatan dan arah hubungan antar variabel numerik berskala Likert

## Insight
- Instrumen kuesioner memiliki nilai Cronbach's Alpha sebesar 0,851 yang menunjukkan reliabilitas sangat baik dan konsisten
- Terdapat hubungan signifikan antara kepuasan harga tiket dengan frekuensi kunjungan bioskop dalam 3 bulan terakhir
- Preferensi hari kunjungan didominasi oleh hari Sabtu dan lokasi bioskop terfavorit adalah South Tangerang
- Korelasi Spearman menunjukkan hubungan positif yang kuat antara kepuasan harga dengan kesediaan membayar harga fleksibel

## Recommendation
- Terapkan strategi harga fleksibel dan promo khusus pada hari kerja untuk menarik lebih banyak audiens
- Fokuskan promosi dan ekspansi bioskop di wilayah South Tangerang dan area urban lainnya
- Kembangkan program loyalitas berbasis alokasi anggaran hiburan bulanan untuk meningkatkan retensi audiens
- Lakukan survei berkala dengan ukuran sampel lebih besar untuk memperkuat validitas dan generalisasi temuan

## Tools
R Programming

## Skills
- Manipulasi Data: pembersihan data, konversi tipe data, penanganan nilai NA, dan pengelompokan variabel
- Analisis Deskriptif: modus, mean, median, dan distribusi data
- Visualisasi Data: grafik dengan ggplot2 
- Uji Reliabilitas Instrumen: pengukuran konsistensi internal kuesioner menggunakan Cronbach's Alpha
- Uji Chi-Square Goodness of Fit: menguji kesesuaian distribusi data kategorikal dengan harapan
- Uji Chi-Square Test of Independence: menguji hubungan antar variabel kategorikal secara berpasangan maupun gabungan
- Uji Korelasi Spearman: mengukur kekuatan dan arah hubungan antar variabel numerik serta kategorikal ordinal
