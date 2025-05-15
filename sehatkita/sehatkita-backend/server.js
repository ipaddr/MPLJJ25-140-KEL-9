const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors'); // Import CORS
require('dotenv').config();

// Inisialisasi aplikasi Express
const app = express();

// Middleware
app.use(express.json());
app.use(cors());  // Mengaktifkan CORS

// Rute Auth
const authRoutes = require('./routes/auth');
app.use('/api/auth', authRoutes);

// Menghubungkan ke MongoDB
mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.log('Error connecting to MongoDB: ', err));

// Menjalankan server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
