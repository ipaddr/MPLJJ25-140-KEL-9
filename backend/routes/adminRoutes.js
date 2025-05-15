const express = require('express');
const Hospital = require('../models/hospitalModel');  // Model untuk rumah sakit
const Petugas = require('../models/petugasModel');    // Model untuk petugas
const router = express.Router();

// Endpoint untuk menambah rumah sakit
router.post('/add-hospital', async (req, res) => {
  const { name, address } = req.body;

  const newHospital = new Hospital({ name, address });

  try {
    await newHospital.save();
    res.status(200).json({ message: 'Rumah sakit berhasil ditambahkan' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal menambah rumah sakit' });
  }
});

// Endpoint untuk menambah petugas rumah sakit
router.post('/add-petugas', async (req, res) => {
  const { name, hospitalId } = req.body;

  const newPetugas = new Petugas({ name, hospitalId });

  try {
    await newPetugas.save();
    res.status(200).json({ message: 'Petugas berhasil ditambahkan' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal menambah petugas' });
  }
});

module.exports = router;
