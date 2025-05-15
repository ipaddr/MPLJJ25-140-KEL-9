// models/patientModel.js
const mongoose = require('mongoose');

const patientSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  name: { type: String, required: true },
  age: { type: Number, required: true },
  diagnosis: { type: String, required: true },
  // data pasien lainnya
});

module.exports = mongoose.model('Patient', patientSchema);
