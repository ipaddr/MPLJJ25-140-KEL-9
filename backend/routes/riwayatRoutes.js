const express = require('express');
const Riwayat = require('../models/riwayatModel');  // Model riwayat pemeriksaan
const router = express.Router();

// Endpoint untuk mengambil riwayat pemeriksaan pasien
router.get('/riwayat', async (req, res) => {
  try {
    const riwayat = await Riwayat.find();  // Mengambil data riwayat dari MongoDB
    res.status(200).json(riwayat);
  } catch (err) {
    res.status(500).json({ error: 'Terjadi kesalahan dalam mengambil riwayat pemeriksaan' });
  }
});

module.exports = router;
