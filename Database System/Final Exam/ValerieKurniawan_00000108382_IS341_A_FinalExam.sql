-- Sub-CLO081-9
-- a. List all donors along with their total number of donations and total donation amount.
CREATE VIEW view_donatur_donasi AS
SELECT 
    dtr.idDonatur,
    dtr.namaDonatur,
    dtr.emailDonatur,
    COUNT(dns.idDonasi) AS jumlahDonasi,
    SUM(dns.nominalDonasi) AS totalDonasi
FROM 
    donatur dtr
LEFT JOIN 
    donasi dns ON dtr.idDonatur = dns.idDonatur
GROUP BY 
    dtr.idDonatur, dtr.namaDonatur, dtr.emailDonatur;

-- b. Generate a financial summary report showing donation allocations, total donations, usage percentage, and total orphans.
CREATE VIEW view_ringkasan_donasi_dan_alokasi AS
SELECT
    mankeu.idManajerKeuangan,
    mankeu.namaManajerKeuangan,
    alodns.namaKategori,
    alodns.totalBiaya,
    (SELECT SUM(dns.nominalDonasi) FROM donasi dns) AS totalDonasiPanti,
    (alodns.totalBiaya * 100.0 / (SELECT SUM(dns.nominalDonasi) FROM donasi dns)) AS PersentaseDonasiTerpakai,
    (SELECT COUNT(anak.idAnak) FROM anakpanti anak) AS TotalAnakPanti
FROM alokasidonasi alodns
JOIN manajerkeuanganpanti mankeu
    ON alodns.idManajerKeuangan = mankeu.idManajerKeuangan
JOIN userapp users
    ON mankeu.peran = users.peran;
