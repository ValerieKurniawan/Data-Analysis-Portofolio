# Perancangan dan Implementasi Model Analitik Power BI untuk Publikasi Scopus Universitas Multimedia Nusantara (2020-2025)

## Problem

- Data publikasi Scopus dan data dosen UMN tersimpan di beberapa file terpisah dengan struktur dan kualitas data yang berbeda-beda
- Terdapat duplikasi publikasi dan inkonsistensi penulisan nama dosen, sehingga nama author sulit dicocokkan dengan master data dosen
- Satu publikasi dapat ditulis oleh banyak penulis, sehingga struktur data operasional belum mendukung analisis kontribusi dosen dan kolaborasi
- Belum ada analisis historis lintas waktu, fakultas, dan program studi, termasuk jumlah publikasi per kuartil (Q1-Q4) dan tren per program studi
- Perubahan atribut dosen (fakultas atau program studi) belum tercatat historisnya

## What to do

1. **Extract**: mengimpor dua sumber data (System of Record), yaitu Publications at Multimedia Nusantara University 2020-2025 dan Lecturers Data - August 2025, ke Power BI tanpa modifikasi awal
2. **Cleansing data publikasi**: menghapus baris header/metadata di atas tabel, mempromosikan header, mengubah tipe data, lalu memfilter publikasi yang Title atau Authors-nya kosong
3. **Standardisasi publikasi**: menormalisasi jenis publikasi menjadi Journal, Conference, Book, atau Other dengan custom column, dan memetakan SJR percentile menjadi kuartil Q1 (≥75), Q2 (≥50), Q3 (≥25), selain itu Q4
4. **Membentuk grain publication-author**: memecah kolom Authors berdasarkan delimiter lalu mengekspansinya menjadi baris, sehingga satu baris mewakili satu publikasi dengan satu author
5. **Cleansing master data dosen**: menggabungkan tabel dosen dari empat fakultas (FB, FIKOM, FSD, FTI), merapikan nama dengan Proper Case, mengganti nilai yang bervariasi, menghapus gelar dan prefix (Prof., Dr., Ir., Drs., Dra.), menghapus duplikat, dan menurunkan Faculty dari Study Program
6. **Mencocokkan author ke dosen UMN**: menggunakan Fuzzy Join (IgnoreCase, IgnoreSpace, dengan threshold), dan author yang tidak cocok dipetakan ke dosen Unknown (LecturerID = -1)
7. **Membatasi periode analisis**: membuat parameter RangeStart (1 Januari 2020) dan RangeEnd (31 Desember 2025) lalu memfilter kolom Full Date
8. **Merancang star schema**: membuat satu tabel fakta FactPublication_SCD dengan 9 tabel dimensi (conformed dimensions) dan relasi many-to-one single-direction dari dimensi ke fakta
9. **Membuat surrogate key**: memberi key pada tiap dimensi, misalnya A001, F01, SP01, L001, PT01, V001, Y01, Q01, PUB01
10. **Menerapkan SCD Type 2 pada dimensi dosen**: membentuk snapshot dosen lalu versi historis dengan EffectiveStartDate, EffectiveEndDate, IsCurrent, dan LecturerSK
11. **Menangani late-arriving data**: menambahkan dimension member "Unknown" (key = -1) pada seluruh dimensi agar data fakta tetap bisa direlasikan
12. **Membuat DAX measures**: PublicationCount, AuthorCount, jumlah publikasi per kuartil, publikasi kolaboratif, dan measure untuk data quality
13. **Membangun dashboard**: Quartile Performance, Program Trends, dan Collaboration Analysis
14. **Menerapkan Row-Level Security (RLS)**: role per fakultas (FTI, FB, FSD, FIKOM) yang diuji dengan fitur View as
15. **Validasi dan monitoring**: membuat halaman Data Quality & Validation (publication count, unknown keys, unmapped quartile) dan mengecek Refresh History di Power BI Service

## Insight

- Total terdapat 602 publikasi Scopus UMN pada 2020-2025, dengan 73 publikasi Q1
- Publikasi Q1 terbanyak ada pada tahun 2023, dan FTI menjadi fakultas penghasil Q1 terbanyak pada tahun tersebut
- Program studi dengan jumlah publikasi terbanyak adalah DKV
- Terdapat 292 publikasi kolaboratif, dan 53% di antaranya berada di kuartil Q1-Q2
- Sebanyak 260 publikasi belum memiliki klasifikasi kuartil, sehingga perlu pengecekan atau pembaruan data
- Refresh di Power BI Service gagal karena sumber data berupa file lokal (Excel/CSV) yang tidak bisa diakses oleh layanan, sehingga scheduled refresh belum dapat berjalan

## Recommendation

- Perkuat master data author dan dosen dengan aturan pembersihan nama yang lebih ketat atau mapping table khusus
- Tambahkan reconciliation checklist untuk late-arriving data, yaitu prosedur berkala untuk mengganti foreign key "Unknown" (-1) dengan dimension member yang valid
- Kembangkan dimensi waktu dan analitik lanjutan, seperti tren sitasi, produktivitas per dosen atau program studi, dan benchmarking per kuartil
- Tingkatkan reliability refresh di Power BI Service, misalnya dengan sumber data yang dapat diakses layanan dan incremental refresh pada tabel fakta

## Tools

- Microsoft Power BI (Power BI Desktop dan Power BI Service)
- Power Query (M language)
- DAX
- Microsoft Excel
- Scopus (sumber data publikasi)

## Skills

- **Power Query data transformation**: Removed Top Rows, Promoted Headers, Changed Type, Filtered Rows, Removed Columns, Reordered Columns, Renamed Columns, Removed Duplicates, Replaced Value, Capitalized Each Word, Split Column by Delimiter, Expand List, Custom Column, Add Index Column, Merge Queries, Append/Combine Queries
- **Data cleansing dan standardisasi**: handling null/kosong, normalisasi kategori, penghapusan gelar dan trimming nama, deduplikasi, mapping kuartil dari SJR percentile
- **Fuzzy matching**: Fuzzy Join untuk mencocokkan nama author Scopus dengan master data dosen
- **Data warehouse modeling**: star schema, fact table, conformed dimensions, grain publication-author, surrogate key, relasi many-to-one single-direction
- **Slowly Changing Dimension (SCD) Type 2**: pembuatan versi historis dosen dengan effective date dan flag IsCurrent
- **ETL**: proses extract, transform, load yang repeatable menggunakan Power Query, termasuk parameter RangeStart dan RangeEnd
- **Late-arriving data handling**: dimension member Unknown (key = -1)
- **DAX**: DISTINCTCOUNT, CALCULATE, dan measure untuk KPI
- **Data visualization dan dashboard**: bar chart, line chart, KPI card, tabel, dan slicer
- **Data governance**: Row-Level Security (Manage Roles dan View as), data quality dan validation page, refresh monitoring
