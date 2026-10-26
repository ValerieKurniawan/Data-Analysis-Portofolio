# Perancangan dan Implementasi Model Analitik Power BI untuk Publikasi Scopus Universitas Multimedia Nusantara (2020-2025)

## Problem
- Data publikasi Scopus dan data dosen UMN tersimpan di file terpisah dengan struktur yang beda
- Terdapat duplikasi publikasi dan inkonsistensi penulisan nama dosen
- Satu publikasi dapat ditulis oleh banyak penulis, sehingga belum bisa analisis kontribusi dosen dan kolaborasi
- Belum ada analisis historis lintas waktu, fakultas, dan program studi, termasuk jumlah publikasi per kuartil (Q1-Q4) dan tren per program studi
- Perubahan atribut dosen (fakultas atau program studi) belum tercatat historisnya

## What to do
- Extract data
- Data cleansing: change data type, remove duplicate values
- Data Standarization: pemetaan jenis publikasi dan SJR percentile menjadi kuartil Q1-Q4
- Membentuk grain publication-author: memecah kolom Authors berdasarkan delimiter menjadi baris, jadi 1 baris mewakili 1 publikasi dengan 1 author 
- Mencocokkan author ke dosen UMN: menggunakan Fuzzy Join dan author yang tidak cocok dipetakan ke dosen Unknown
- Membatasi periode analisis: membuat parameter RangeStart (1 Januari 2020) dan RangeEnd (31 Desember 2025) lalu memfilter kolom Full Date
- Merancang star schema: fact public sebagai pusat dengan 9 tabel dimensi (publicationType, Faculty, Authors, dll)
- Membuat surrogate key
- Membuat DAX measures
- Membangun dashboard
- Menerapkan Row-Level Security (RLS): role per fakultas (FTI, FB, FSD, FIKOM) yang diuji dengan fitur View as

## Insight
- Total terdapat 602 publikasi Scopus UMN pada 2020-2025, dengan 73 publikasi Q1
- Publikasi Q1 terbanyak ada pada tahun 2023, dan FTI menjadi fakultas penghasil Q1 terbanyak pada tahun tersebut
- Program studi dengan jumlah publikasi terbanyak adalah DKV
- Terdapat 292 publikasi kolaboratif, dan 53% di antaranya berada di kuartil Q1-Q2
- Sebanyak 260 publikasi belum memiliki klasifikasi kuartil, sehingga perlu pengecekan atau pembaruan data
- Refresh di Power BI Service gagal karena sumber data berupa file lokal (Excel/CSV) yang tidak bisa diakses oleh layanan, sehingga scheduled refresh belum dapat berjalan

## Recommendation
- Tambahkan reconciliation checklist untuk late-arriving data, yaitu prosedur berkala untuk mengganti foreign key "Unknown" (-1) dengan dimension member yang valid
- Kembangkan dimensi waktu dan analitik lanjutan, seperti tren sitasi, produktivitas per dosen atau program studi, dan benchmarking per kuartil

## Tools
- Microsoft Power BI 
- DAX
  
## Skills
- Power Query data transformation: Removed Top Rows, Promoted Headers, Changed Type, Filtered Rows, Removed Columns, Reordered Columns, Renamed Columns, Removed Duplicates, Replaced Value, Capitalized Each Word, Split Column by Delimiter, Expand List, Custom Column, Add Index Column, Merge Queries, Append/Combine Queries
- Data preparation: handling null/kosong, normalisasi kategori, penghapusan gelar dan trimming nama, deduplikasi, mapping kuartil dari SJR percentile
- Fuzzy matching: Fuzzy Join untuk mencocokkan nama author Scopus dengan master data dosen
- Data warehouse modeling: star schema, fact table, conformed dimensions, grain publication-author, surrogate key, relasi many-to-one single-direction
- ETL dan parameter RangeStart dan RangeEnd
- DAX: DISTINCTCOUNT, CALCULATE, dan measure untuk KPI
- Data visualization dan dashboard: bar chart, line chart, KPI card, tabel, dan slicer
- Data governance: Row-Level Security (Manage Roles dan View as)
