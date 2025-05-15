const express = require('express');
const Jadwal = require('../models/jadwalModel');  // Model jadwal pemeriksaan
const router = express.Router();

// Endpoint untuk mengambil jadwal pemeriksaan pasien
router.get('/jadwal', async (req, res) => {
  try {
    const jadwal = await Jadwal.find();  // Mengambil data jadwal dari MongoDB
    res.status(200).json(jadwal);
  } catch (err) {
    res.status(500).json({ error: 'Terjadi kesalahan dalam mengambil jadwal pemeriksaan' });
  }
});

module.exports = router;
