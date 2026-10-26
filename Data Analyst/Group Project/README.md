# Studi Komparatif Algoritma K-Means dan DBSCAN dalam Clustering Paling Optimal pada Dataset Gempa Bumi

Group Project IS388 - Data Analysis, dikerjakan oleh Kelompok 2 (Evelyn Gracia, Kelvinia, Valerie Kurniawan).

- Notebook: [`notebook/`](./notebook)
- Laporan: [`report/Laporan_Kelompok_2.pdf`](./report)
- Aplikasi Streamlit: https://datnal-final-74avpxsqk89s5jq6c7m6dd.streamlit.app/

## Problem

- Gempa bumi terjadi tanpa prediksi yang jelas, sehingga pemahaman pola lokasi kejadiannya penting untuk mitigasi bencana dan penentuan wilayah rawan
- Pemilihan algoritma clustering sangat menentukan hasil karena tiap algoritma punya performa berbeda tergantung karakteristik data
- Penelitian terdahulu ambigu: Arafat (2023) menemukan Silhouette Score K-Means (0,570) lebih tinggi dari DBSCAN (0,486), padahal mayoritas penelitian lain menyatakan DBSCAN lebih unggul
- Dataset berukuran besar (75.810 baris) sehingga perlu perhatian pada efisiensi komputasi

## What to do

1. **Business Understanding:** merumuskan masalah dan tujuan, serta mengaitkannya dengan SDG 11 dan SDG 13
2. **Data Understanding:** memahami 22 kolom dataset USGS, lalu memeriksa kualitas data
   - Missing value dengan `isnull().sum()` (hasil: tidak ada)
   - Duplikasi (734 baris) dan outlier (3.821 pada latitude, 4.687 pada longitude), keduanya dipertahankan karena gempa wajar berulang di lokasi yang sama dan outlier adalah informasi seismik yang nyata
   - Visualisasi sebaran lokasi gempa (scatter plot) dan histogram latitude serta longitude
3. **Data Preparation:**
   - Feature selection: hanya memakai latitude dan longitude
   - Data reduction: sampling acak 1.827 baris dari 75.810 dengan `random_state` agar hasil bisa direplikasi
   - Normalisasi dengan Standard Scaler (rata-rata 0, simpangan baku 1), dibuktikan dengan perbandingan boxplot sebelum dan sesudah scaling
4. **Modelling:**
   - K-Means: menentukan jumlah cluster dengan Elbow Method (k = 4), lalu clustering dan profil rata-rata tiap cluster
   - DBSCAN: membentuk cluster berdasarkan kepadatan, menghasilkan 8 cluster dan titik noise (label -1)
5. **Evaluation:** membandingkan kedua algoritma dengan Silhouette Score
6. **Deployment:** membangun aplikasi Streamlit dengan upload CSV, pilihan model (K-Means atau DBSCAN), scatter plot cluster, bar chart distribusi cluster, dan tabel data

## Insight

- DBSCAN menghasilkan Silhouette Score tertinggi (0.899497) dibandingkan K-Means (0.823289)
- Hasil ini menjawab ambiguitas pada penelitian Arafat (2023): DBSCAN unggul secara metrik maupun secara bentuk cluster
- DBSCAN cocok untuk data gempa karena membentuk cluster tidak beraturan mengikuti pola kepadatan, mendeteksi noise, dan tidak perlu menentukan jumlah cluster di awal
- Gempa terkonsentrasi pada longitude -150 hingga -100 dan 100 hingga 150, dengan latitude paling padat di sekitar 20° hingga 60°
- K-Means cenderung membentuk cluster bulat dan sensitif terhadap outlier, sehingga kurang cocok untuk pola persebaran gempa

## Recommendation

- Optimasi parameter DBSCAN (eps dan min_samples) secara sistematis, misalnya dengan Grid Search, karena pada tahap ini parameter belum dioptimasi
- Evaluasi kualitas cluster dengan dan tanpa titik noise untuk melihat pengaruh outlier terhadap Silhouette Score
- Kombinasikan K-Means dan DBSCAN (ensemble atau meta-clustering) agar struktur cluster lebih stabil dibandingkan algoritma tunggal
- Pantau dan evaluasi ulang model secara berkala karena pola gempa berubah dari waktu ke waktu

> Rekomendasi ini yang diterapkan pada [Individual Project](../individual-project).

## Tools

- Python dan Jupyter Notebook
- scikit-learn (K-Means, DBSCAN, StandardScaler, Silhouette Score), pandas, NumPy
- Streamlit
- Kaggle (dataset USGS)

## Skills

- **Data Mining Framework:** CRISP-DM dari Business Understanding hingga Deployment
- **Exploratory Data Analysis:** pengecekan missing value, duplikasi, outlier, scatter plot, histogram, dan boxplot
- **Data Preparation:** feature selection, data reduction (random sampling), dan normalisasi dengan Standard Scaler
- **Unsupervised Learning:** K-Means (Elbow Method) dan DBSCAN (density-based clustering)
- **Model Evaluation:** Silhouette Score untuk membandingkan kualitas cluster
- **Deployment:** dashboard interaktif dengan Streamlit
- **Geospatial Data Analysis:** memetakan pola persebaran gempa berdasarkan latitude dan longitude
