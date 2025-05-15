const mongoose = require('mongoose');

const petugasSchema = new mongoose.Schema({
  name: { type: String, required: true },
  hospitalId: { type: mongoose.Schema.Types.ObjectId, ref: 'Hospital' },
});

module.exports = mongoose.model('Petugas', petugasSchema);
