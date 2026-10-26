# Studi Komparatif Algoritma K-Means dan DBSCAN dalam Clustering Paling Optimal pada Dataset Gempa Bumi
Group Project IS388 - Data Analysis oleh Kelompok 2 (Valerie Kurniawan, Evelyn Gracia, Kelvinia).


## Problem
- Gempa bumi terjadi tanpa prediksi yang jelas
- Pemilihan algoritma clustering yang tepat 

## What to do
- Business Understanding 
- Data Understanding
- Data Preparation: feature selection, data reduction, normalisasi dengan Standard Scaler 
- Modelling:
   - K-Means: menentukan jumlah cluster dengan Elbow Method (k = 4), lalu clustering dan profil rata-rata tiap cluster
   - DBSCAN: membentuk cluster berdasarkan kepadatan, menghasilkan 8 cluster dan titik noise (label -1)
- Evaluation dengan Silhouette Score
- Deployment dengan aplikasi Streamlit

## Insight
- DBSCAN menghasilkan Silhouette Score tertinggi (0.899497) dibandingkan K-Means (0.823289)
- Hasil ini menjawab ambiguitas pada penelitian Arafat (2023): DBSCAN unggul secara metrik maupun secara bentuk cluster
- DBSCAN cocok untuk data gempa karena membentuk cluster tidak beraturan mengikuti pola kepadatan, mendeteksi noise, dan tidak perlu menentukan jumlah cluster di awal
- K-Means cenderung membentuk cluster bulat dan sensitif terhadap outlier, sehingga kurang cocok untuk pola persebaran gempa

## Recommendation
- Optimasi parameter DBSCAN (eps dan min_samples) secara sistematis, misalnya dengan Grid Search, karena pada tahap ini parameter belum dioptimasi
- Evaluasi kualitas cluster dengan dan tanpa titik noise untuk melihat pengaruh outlier terhadap Silhouette Score
- Kombinasikan K-Means dan DBSCAN (ensemble atau meta-clustering) agar struktur cluster lebih stabil dibandingkan algoritma tunggal
- Pantau dan evaluasi ulang model secara berkala karena pola gempa berubah dari waktu ke waktu

Rekomendasi ini yang diterapkan pada Individual Project 

## Tools
- Python 
- Streamlit

## Skills
- EDA
- Unsupervised Learning: K-Means (Elbow Method) dan DBSCAN (density-based clustering)
