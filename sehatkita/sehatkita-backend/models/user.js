const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

// Definisikan Schema User
const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
});

// Enkripsi password sebelum menyimpannya
userSchema.pre('save', async function(next) {
  if (!this.isModified('password')) return next();
  try {
    this.password = await bcrypt.hash(this.password, 10); // Enkripsi password
    next();
  } catch (error) {
    next(error); // Tangani error jika ada
  }
});

// Verifikasi password saat login
userSchema.methods.comparePassword = async function(password) {
  try {
    return await bcrypt.compare(password, this.password); // Bandingkan password
  } catch (error) {
    throw new Error('Password comparison failed');
  }
};

module.exports = mongoose.model('User', userSchema);
