const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const authRoutes = require('./routes/authRoutes');
const adminRoutes = require('./routes/adminRoutes');
const riwayatRoutes = require('./routes/riwayatRoutes');
const jadwalRoutes = require('./routes/jadwalRoutes');  // Import rute jadwal
const userRoutes = require('./routes/userRoutes');  // Rute untuk pengelolaan pengguna
const db = require('./config/db');
const patientRoutes = require('./routes/patientRoutes');  // Rute untuk pasien

const app = express();

app.use(bodyParser.json());
app.use('/api', authRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api', riwayatRoutes);
app.use('/api', jadwalRoutes);  // Menambahkan rute jadwal
// Gunakan route untuk pengelolaan pengguna (update profil)
app.use('/api/user', userRoutes);
// Gunakan route untuk data pasien
app.use('/api/patient', patientRoutes);

app.listen(3000, () => {
  console.log('Server running on port 3000');
});
