# Car Dealership Sales Processing and Commission Calculation (Excel)
Practice case with simulated data from a fictional dealer (Dravik Mobilari), March-May 2025

## Problem
- Transaksi hanya tercatat dengan kode (kode area + kode produk) dan jumlah unit
- Merek, model, tipe, harga, dan area dealer ada di sheet acuan, sehingga harus dicocokkan manual
- Metode pembayaran, diskon, harga total, dan komisi punya aturan berbeda, sehingga rawan salah hitung
- Belum ada ringkasan penjualan per area, metode pembayaran, dan bulan

## What to do
- Pisahkan kode transaksi menjadi kode area dan kode produk (LEFT, MID)
- Ambil merek, model, tipe, dan harga dengan XLOOKUP
- Ambil area dealer dengan VLOOKUP
- Tentukan metode pembayaran dengan nested IF (Leasing ≥ Rp350 juta, Kredit ≥ Rp200 juta, Cash di bawahnya)
- Hitung diskon (MPV 3%, SUV 4%, Hatchback 1,5%), harga total, dan komisi (Leasing 2%, Kredit 1,5%, Cash 1%)
- Rekonsiliasi total dengan SUMIFS dan grand total PivotTable, plus cek duplikat dan lookup gagal
- Buat PivotTable, bar chart, dan slicer bulan

## Insight
- 39 transaksi (291 unit) menghasilkan penjualan Rp76,28 miliar dan komisi Rp1,21 miliar 
- Penjualan terus turun dari Maret hingga Mei
- Mitsubishi mendominasi nilai penjualan, dengan Pajero Sport sebagai model terbesar dan Honda Brio unggul dalam jumlah unit
- Bandung menjadi area terbesar, sedangkan Medan terendah (12,4%)
- Leasing menyumbang 38,7% penjualan dan komisi 10 transaksi
- Susanto menjadi sales terbaik (Rp23,88 miliar), sedangkan Darma terendah (Rp9,35 miliar)

## Recommendation
- Evaluasi penurunan penjualan, terutama di Bandung dan Yogyakarta
- Tingkatkan penjualan di Medan dan evaluasi stok model bernilai tinggi
- Optimalkan strategi Leasing karena kontribusi penjualannya besar
- Gunakan tabel parameter untuk tarif diskon dan komisi
- Ubah data menjadi Excel Table agar rumus dan PivotTable otomatis diperbarui

## Tools
- Microsoft Excel

## Skills
- Lookup: XLOOKUP, VLOOKUP, LEFT, MID
- Rumus logika: nested IF
- Rekonsiliasi dan validasi: SUMIFS, COUNTIF, check cells
- Reporting: PivotTable, chart, slicer
