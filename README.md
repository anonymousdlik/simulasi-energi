# 🧰 Simulasi Energi Package - Node-RED + Python + Grafana

## 📦 Struktur Proyek

```
simulasi-energi/
├── node_red_flow.json
├── generate_dataset.py
├── energy_dashboard_template.json
├── batch_generator.py
├── setup_node_red.sh   <-- installer otomatis Node.js + Node-RED
├── README.md
└── data/
    └── energy_data.csv
```

---

## 🚀 Instalasi Cepat Node.js + Node-RED di Ubuntu/WSL

Jalankan di terminal:

```bash
curl -O https://raw.githubusercontent.com/anonymousdlik/simulasi-energi/main/setup_node_red.sh
sudo bash setup_node_red.sh
```

## 🧩 Script Installer: `setup_node_red.sh`

```bash
#!/bin/bash
# ==========================================
# Node.js + Node-RED Installer for Ubuntu/WSL
# Author: Fadli Marabes (Universitas Bina Darma)
# ==========================================

echo "🚀 Memulai instalasi Node.js 20 dan Node-RED..."
sleep 2

if [ "$EUID" -ne 0 ]
  then echo "❌ Jalankan dengan sudo: sudo bash setup_node_red.sh"
  exit
fi

echo "🧹 Menghapus versi lama Node.js dan npm..."
apt remove -y nodejs npm
apt autoremove -y
rm -f /etc/apt/sources.list.d/nodesource.list

echo "🔗 Menambahkan repository NodeSource..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

echo "📦 Menginstal Node.js 20..."
apt install -y nodejs

echo "✅ Versi Node.js dan npm:"
node -v
npm -v

echo "⚙️ Menginstal Node-RED (global)..."
npm install -g --unsafe-perm node-red

echo "📂 Membuat direktori proyek Node-RED..."
mkdir -p ~/simulasi-energi/node-red
cd ~/simulasi-energi/node-red

echo "🚦 Menjalankan Node-RED pertama kali..."
echo "Buka browser: http://localhost:1880"
echo "Tekan CTRL+C untuk menghentikan Node-RED."
sleep 3
node-red
```

---

## 📖 README.md (cuplikan untuk GitHub)

````markdown
# ⚡ Simulasi Energi Node-RED + Python + Grafana

Repositori ini berisi proyek simulasi energi berbasis **Node-RED**, **Python**, dan **Grafana**, untuk memantau data suhu, arus, dan tegangan secara real-time serta batch.

## 🚀 Instalasi Cepat Node.js + Node-RED
Jalankan perintah di bawah ini untuk menginstal Node.js 20 dan Node-RED otomatis:

```bash
curl -O https://raw.githubusercontent.com/abonymousdlik/simulasi-energi/main/setup_node_red.sh
sudo bash setup_node_red.sh
````

## 📈 Komponen Utama

* **Node-RED** untuk akuisisi data dan dashboard real-time.
* **Python** (`generate_dataset.py`, `batch_generator.py`) untuk pembuatan dataset dan simulasi batch 90 hari.
* **Grafana** untuk visualisasi historis dan analitik energi.

## 🧠 Cara Jalankan

1. Jalankan Node-RED (`node-red` di terminal).
2. Impor `node_red_flow.json` ke editor Node-RED.
3. Jalankan `generate_dataset.py` untuk membuat dataset simulasi.
4. (Opsional) Gunakan `batch_generator.py` untuk data simulasi 90 hari.
5. Impor `energy_dashboard_template.json` ke Grafana.

---

📧 **Penulis:** Fadli Marabes
🏫 Universitas Bina Darma, Palembang
✉️ [fadllimarabes05@gmail.com](mailto:fadllimarabes05@gmail.com)

```
```
