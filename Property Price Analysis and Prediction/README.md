## Problem
- Ketidakpastian harga properti membuat pembeli, penjual, dan investor berisiko salah mengambil keputusan, misalnya membeli di atas harga pasar
- Pasar properti semakin kompleks akibat urbanisasi dan pertumbuhan ekonomi, sehingga harga sulit diperkirakan secara manual
- Harga dipengaruhi banyak karakteristik fisik dan lokasi yang saling berinteraksi, dengan pola hubungan yang tidak selalu linear
- Linear Regression sederhana dan mudah diinterpretasi, tetapi terbatas dalam menangkap hubungan non-linear antar variabel

## What to do
- Tahapan CRISP-DM mulai dari Business Understanding hingga Deployment
- Melakukan EDA dengan bar chart distribusi dan line chart tren rata-rata harga terhadap tiap variabel
- Membagi data 80% train dan 20% test, lalu melatih model Linear Regression dan Boosted Tree Regressor (XGBoost) menggunakan GCP BigQuery ML
- Mengevaluasi kedua model dengan RMSE dan R²
- Membandingkan harga aktual dan prediksi lewat tabel dan scatter plot

## Insight
- Luas tanah dan luas bangunan berbanding lurus dengan harga, sedangkan jarak ke pusat bisnis berbanding terbalik dengan harga
- Jumlah kamar tidur, kamar mandi, dan garasi tidak menunjukkan pola yang konsisten terhadap harga, dan tahun pembangunan membentuk pola non-linear
- Linear Regression menghasilkan R² 59% dan RMSE 0.13, dengan banyak prediksi yang jauh dari harga aktual
- Boosted Tree Regressor (XGBoost) menghasilkan R² 79% dan RMSE 0.04, dengan titik prediksi yang lebih rapat mengikuti garis diagonal pada scatter plot

## Recommendation
- Gunakan Boosted Tree Regressor (XGBoost) untuk prediksi harga properti berdasarkan karakteristik fisik dan lokasi yang kompleks
- Gunakan model ensemble learning ketika data memiliki banyak variabel dan hubungan non-linear
- Linear Regression untuk kasus yang lebih sederhana
  
## Tools
- Google BigQuery ML

## Skills
- Machine Learning: Linear Regression dan Boosted Tree Regressor (XGBoost) di BigQuery ML
- Data Preparation: feature engineering, handling missing value, dan data splitting 80/20
- Exploratory Data Analysis: bar chart distribusi dan line chart tren harga per variabel
- Model Evaluation: RMSE, R², tabel aktual vs prediksi, dan scatter plot
- Data Science Framework: CRISP-DM
