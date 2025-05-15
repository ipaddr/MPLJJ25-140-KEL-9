const mongoose = require('mongoose');

const riwayatSchema = new mongoose.Schema({
  patientId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  name: { type: String, required: true },
  date: { type: Date, required: true },
  result: { type: String, required: true },
});

module.exports = mongoose.model('Riwayat', riwayatSchema);
