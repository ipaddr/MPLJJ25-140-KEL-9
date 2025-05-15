const express = require('express');
const Patient = require('../models/patientModel');
const authMiddleware = require('../middleware/authMiddleware'); // Middleware untuk verifikasi JWT
const router = express.Router();

// Endpoint untuk mengambil data pasien
router.get('/patient', authMiddleware, async (req, res) => {
  try {
    const patients = await Patient.find();  // Mengambil semua data pasien
    res.status(200).json(patients);
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil data pasien' });
  }
});

module.exports = router;
