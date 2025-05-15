const express = require('express');
const nodemailer = require('nodemailer');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel');
const router = express.Router();

let otpCode = '';  // Tempat menyimpan OTP sementara

// Endpoint registrasi
router.post('/register', async (req, res) => {
  const { email, password } = req.body;

  // Hash password sebelum disimpan
  const hashedPassword = await bcrypt.hash(password, 12);

  // Menyimpan pengguna baru ke dalam database
  const newUser = new User({
    email,
    password: hashedPassword,
  });

  try {
    // Menyimpan pengguna
    await newUser.save();

    // Kirim OTP setelah registrasi
    otpCode = Math.floor(100000 + Math.random() * 900000); // Generate OTP 6 digit

    // Setup Nodemailer untuk mengirim OTP
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'your-email@gmail.com', // Ganti dengan email yang valid
        pass: 'your-email-password',   // Ganti dengan password email yang valid
      },
    });

    const mailOptions = {
      from: 'your-email@gmail.com',
      to: email,
      subject: 'Kode OTP untuk Registrasi',
      text: `Kode OTP Anda adalah: ${otpCode}`,
    };

    // Kirim email dengan OTP
    await transporter.sendMail(mailOptions);

    res.status(200).json({ message: 'Registrasi berhasil, OTP telah dikirim ke email Anda' });

  } catch (err) {
    res.status(500).json({ error: 'Terjadi kesalahan saat registrasi' });
  }
});

// Mengirimkan OTP via email (apabila diperlukan untuk request OTP lagi)
router.post('/send-otp', async (req, res) => {
  const { email } = req.body;
  
  // Generate OTP 6 digit
  otpCode = Math.floor(100000 + Math.random() * 900000); 

  // Setup Nodemailer
  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'your-email@gmail.com', // Ganti dengan email yang valid
      pass: 'your-email-password',   // Ganti dengan password email yang valid
    },
  });

  const mailOptions = {
    from: 'your-email@gmail.com',
    to: email,
    subject: 'Kode OTP untuk Registrasi',
    text: `Kode OTP Anda adalah: ${otpCode}`,
  };

  try {
    await transporter.sendMail(mailOptions);
    res.status(200).json({ message: 'OTP telah dikirim' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengirim OTP' });
  }
});

// Verifikasi OTP
router.post('/otp/verify', (req, res) => {
  const { otp } = req.body;

  // Verifikasi OTP yang dimasukkan dengan OTP yang dikirimkan
  if (otp === otpCode.toString()) {
    res.status(200).json({ message: 'OTP berhasil diverifikasi' });
  } else {
    res.status(400).json({ error: 'OTP tidak valid' });
  }
});

module.exports = router;
