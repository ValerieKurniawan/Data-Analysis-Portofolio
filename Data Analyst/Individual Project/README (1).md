# Penerapan Meta-Clustering untuk Menghasilkan Cluster Gempa Bumi yang Lebih Optimal Dibandingkan K-Means dan DBSCAN

Individual Project IS388 - Data Analysis oleh Valerie Kurniawan. Proyek ini **melanjutkan [Group Project](../group-project)** dengan dataset yang sama, dengan menerapkan rekomendasi dari kelompok.

- Notebook: [`notebook/`](./notebook)
- Paper: [`report/Paper_Valerie_Kurniawan.pdf`](./report)

## Problem

Berangkat dari hasil dan keterbatasan Group Project:

- DBSCAN unggul pada Group Project, tetapi parameternya (eps dan min_samples) belum dioptimasi dan sangat memengaruhi hasil cluster
- K-Means sensitif terhadap outlier dan cenderung membentuk cluster bulat, sedangkan DBSCAN menyisakan titik noise yang tidak masuk cluster mana pun
- Tidak ada satu clustering tunggal yang dianggap paling baik untuk semua kebutuhan, sehingga hasil satu algoritma belum tentu stabil
- Data gempa bersifat geospasial dengan kepadatan tidak merata, sehingga perlu pendekatan yang lebih adaptif terhadap pola alaminya

## What to do

1. **Business Understanding:** mengaitkan analisis dengan mitigasi bencana (SDG 11 dan SDG 13) serta menetapkan tujuan untuk membandingkan K-Means, DBSCAN, dan Meta-Clustering
2. **Data Understanding:** memakai `usgs.csv` (75.810 baris, 22 kolom), memeriksa missing value, duplikasi (734), outlier (latitude 3.821 dan longitude 4.687), serta visualisasi sebaran, histogram latitude, dan histogram longitude
3. **Data Preparation:** feature selection (latitude dan longitude), sampling acak 1.827 baris, dan normalisasi dengan Standard Scaler
4. **Modelling:**
   - K-Means dengan Elbow Method (k = 4) dan DBSCAN sebagai base-level clustering
   - **Optimasi DBSCAN** dengan Grid Search atas eps (0.5, 0.7, 0.9) dan min_samples (3, 5), dengan parameter terbaik eps = 0.5 dan min_samples = 3
   - Menghitung Silhouette Score DBSCAN tanpa titik noise (label -1) menggunakan mask
   - **Meta-Clustering:** menggabungkan label K-Means dan DBSCAN dengan `np.column_stack()` menjadi stacked features, lalu mengelompokkannya ulang dengan DBSCAN terbaik, sehingga tiap titik punya label `kmeans_cluster`, `dbscan_cluster`, dan `final_cluster`
5. **Evaluation:** membandingkan K-Means, DBSCAN, DBSCAN tanpa outlier, dan Meta-Clustering dengan Silhouette Score

## Insight

| Model | Silhouette Score |
| --- | --- |
| K-Means | 0.823289 |
| DBSCAN | 0.899497 |
| DBSCAN tanpa outlier | 0.909743 |
| **Meta-Clustering** | **0.917243** |

- Meta-Clustering menghasilkan Silhouette Score tertinggi, sehingga menjadi metode terbaik dibandingkan K-Means, DBSCAN standar, maupun DBSCAN tanpa outlier
- Menghilangkan noise hanya sedikit menaikkan skor DBSCAN, sehingga outlier tidak berpengaruh besar terhadap kualitas pemisahan cluster
- Menggabungkan informasi centroid-based (K-Means) dan density-based (DBSCAN) menghasilkan struktur cluster akhir yang lebih stabil dan adaptif terhadap karakteristik geospasial gempa
- Peningkatan skor tergolong kecil (0.899 menjadi 0.917), tetapi konsisten dan sejalan dengan gagasan clustering of clusterings

## Recommendation

- Uji pendekatan yang sama pada data gempa Indonesia (misalnya data BMKG), karena dataset saat ini berasal dari USGS
- Tambahkan fitur lain seperti kedalaman dan magnitudo, serta perluas rentang Grid Search
- Bandingkan dengan algoritma dasar lain (misalnya OPTICS atau HDBSCAN) dan metrik evaluasi tambahan selain Silhouette Score
- Terapkan hasil Meta-Clustering ke aplikasi Streamlit dari Group Project agar bisa dipakai untuk pemetaan wilayah rawan gempa

## Tools

- Python dan Jupyter Notebook
- scikit-learn (K-Means, DBSCAN, StandardScaler, Silhouette Score), pandas, NumPy
- Kaggle (dataset USGS)

## Skills

- **Meta-Clustering dan Ensemble Clustering:** stacking label clustering dengan `np.column_stack()` dan re-clustering pada tingkat meta
- **Hyperparameter Tuning:** Grid Search untuk parameter eps dan min_samples DBSCAN berdasarkan Silhouette Score
- **Unsupervised Learning:** K-Means (Elbow Method) dan DBSCAN
- **Model Evaluation:** Silhouette Score, termasuk evaluasi tanpa noise menggunakan mask
- **Data Preparation:** feature selection, sampling, dan normalisasi dengan Standard Scaler
- **Exploratory Data Analysis:** missing value, duplikasi, outlier, scatter plot, histogram, dan boxplot
- **Research Writing:** paper format IEEE dengan kerangka CRISP-DM
