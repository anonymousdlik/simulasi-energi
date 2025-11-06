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
