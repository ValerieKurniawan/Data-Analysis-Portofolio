## Problem
- Data survei mahasiswa yang kompleks yang bisa terjadi kesalahan dalam analisis statistik
- Ketidakjelasan pola distribusi data dan hubungan antar variabel 
- Kuesioner survei belum teruji reliabilitasnya 

## What to do
- Klasifikasi semua variabel ke dalam tipe kategorikal dan numerik serta menentukan skala pengukurannya secara tepat
- Hitung ukuran pemusatan data dan membuat visualisasi distribusi data menggunakan bahasa pemrograman R
- Uji kesesuaian distribusi dan hubungan antar variabel kategorikal menggunakan uji Chi-Square Goodness of Fit dan Test of Independence
- Uji normalitas data numerik menggunakan metode Shapiro-Wilk untuk menentukan kesesuaian distribusi probabilitas
- Uji konsistensi internal kuesioner survei menggunakan metrik Cronbach's Alpha untuk memastikan reliabilitas instrumen penelitian

## Insight
- Mayoritas variabel numerik seperti IPK dan durasi olahraga terbukti tidak terdistribusi secara normal sehingga memerlukan pendekatan statistik non-parametrik
- Terdapat korelasi signifikan antara kebiasaan tidur dengan frekuensi olahraga dan fakultas dengan frekuensi olahraga yang menunjukkan pola perilaku mahasiswa
- Instrumen kuesioner pada data survei memiliki nilai reliabilitas yang sangat rendah sehingga pertanyaan dinilai tidak konsisten 

## Tools
R Programming

## Skills
- Manipulasi Data: pembersihan dan pembacaan dataset menggunakan package readr
- Pemetaan Variabel: data kategorikal dan numerik
- Analisis Deskriptif:  mean, median, dan mode 
- Visualisasi Data: package ggplot2
- Uji Inferensial Kategorikal: Chi-Square Goodness of Fit dan Test of Independence
- Uji Distribusi Probabilitas: Shapiro-Wilk test
- Uji Reliabilitas Instrumen: Cronbach's Alpha
