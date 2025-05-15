// controllers/patientController.js
const Patient = require('../models/patientModel');  // Model untuk data pasien

// Fungsi untuk mendapatkan data pasien berdasarkan userId
const getPatientDataByUserId = async (userId) => {
  try {
    const patientData = await Patient.findOne({ userId: userId });
    return patientData;
  } catch (err) {
    throw new Error('Terjadi kesalahan saat mengambil data pasien');
  }
};

module.exports = { getPatientDataByUserId };
