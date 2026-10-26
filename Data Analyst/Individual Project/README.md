# Penerapan Meta-Clustering untuk Menghasilkan Cluster Gempa Bumi yang Lebih Optimal Dibandingkan K-Means dan DBSCAN
Proyek ini melanjutkan dari Group Project dengan menerapkan rekomendasi dari kelompok


## Problem
- DBSCAN unggul pada Group Project, tetapi parameternya (eps dan min_samples) belum dioptimasi dan sangat memengaruhi hasil cluster
- K-Means sensitif terhadap outlier dan cenderung membentuk cluster bulat, sedangkan DBSCAN menyisakan titik noise yang tidak masuk cluster mana pun
- Data gempa bersifat geospasial dengan kepadatan tidak merata, sehingga perlu pendekatan yang lebih adaptif terhadap pola alaminya

## What to do
- Optimasi DBSCAN dengan Grid Search
- Meta-Clustering dengan menggabungkan label K-Means dan DBSCAN menjadi stacked features
- Mengelompokkannya ulang dengan DBSCAN terbaik

## Insight
- Meta-Clustering menghasilkan Silhouette Score tertinggi sebesar 0.91724, sedangkan K-Means (0.823289), DBSCAN (0.899497), dan DBSCAN tanpa outlier (0.909743).
- Penghapusan outlier sedikit meningkatkan skor DBSCAN 
- Peningkatan kualitas cluster melalui kombinasi pendekatan berbasis centroid dan kepadatan
 
## Recommendation
- Uji pendekatan yang sama pada data gempa Indonesia (data BMKG), karena dataset saat ini berasal dari USGS
- Tambahkan fitur lain seperti kedalaman dan magnitudo

## Tools
- Python 

## Skills
- Meta-Clustering dengan stacking label clustering 
- Hyperparameter Tuning dengan Grid Search 
- Unsupervised Learning: K-Means (Elbow Method) dan DBSCAN
