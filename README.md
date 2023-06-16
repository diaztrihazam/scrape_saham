
<div align="center">

# Scraping Data Saham Harian

</div>

<div align = "justify">
  
## :round_pushpin: Deskripsi
  
Perusahaan perbankan merupakan salah satu indeks yang diminati dalam pasar modal di Indonesia. Salah satu instrumen pasar modal yang paling populer adalah saham, yang merupakan surat berharga yang menjadi bukti kepemilikan atas suatu perusahaan. Terdapat banyak perusahaan perbankan yang ada di Indonesia, dengan beberapa jenis seperti bank milik pemerintah, bank swasta, hingga bank digital. Empat perusahaan bank terbesar adalah  PT Bank Central Asia Tbk (BBCA), PT Bank Negara Indonesia (Persero) Tbk (BBNI),PT Bank Rakyat Indonesia (Persero) Tbk (BBRI), dan PT Bank Mandiri (Persero) Tbk (BMRI).

Proses scraping akan dilakukan setiap hari setiap pukul 17.00 WIB, setelah waktu tutup perdagangan saham. Terdapat empat kode saham, yaitu BBCA, BBNI, BBRI, dan BMRI. Pada proses scraping, diambil data setiap hari dari masing-masing perusahaan perbankan. Data yang diambil adalah:

- *Date*       : tanggal perdagangan saham
- *Open*       : harga saham pembukaan
- *High*       : harga saham tertinggi
- *Low*        : harga saham terendah
- *Close*      : harga saham penutupan
- *Adj Close*  : harga saham penutupan setelah penyesuaian
- *Volume*     : jumlah saham atau kontrak yang diperdagangkan 

## :link: Link Data Scraping

Berikut merupakan link yang digunakan untuk scraping:

| kode |  url                     |
|:----:|:------------------------:|
| BBCA | https://finance.yahoo.com/quote/BBCA.JK/history?p=BBCA.JK |
| BBNI | https://finance.yahoo.com/quote/BBNI.JK/history?p=BBNI.JK |
| BBRI | https://finance.yahoo.com/quote/BBRI.JK/history?p=BBRI.JK |
| BMRI | https://finance.yahoo.com/quote/BMRI.JK/history?p=BMRI.JK |

## :link: Link RPubs

Berikut merupakan link publikasi RPubs:

| url |
|:---:|
| https://rpubs.com/diaztrihazam/scrape-saham |

## :round_pushpin: Status Badge

[![Daily Scraping Stocks](https://github.com/diaztrihazam/scrape_saham/actions/workflows/main.yml/badge.svg)](https://github.com/diaztrihazam/scrape_saham/actions/workflows/main.yml)

</div>
