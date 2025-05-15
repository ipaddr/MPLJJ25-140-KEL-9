const express = require('express');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel');
const authMiddleware = require('../middleware/authMiddleware');  // Import middleware untuk autentikasi JWT
const router = express.Router();

// Endpoint untuk update profil
router.put('/update-profile', authMiddleware, async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findById(req.user);  // Mengambil user berdasarkan userId yang ada di request (dari token)

    if (email) user.email = email;  // Jika ada email baru, update
    if (password) user.password = await bcrypt.hash(password, 12);  // Jika ada password baru, hash password dan update

    await user.save();  // Menyimpan perubahan

    res.status(200).json({ message: 'Profil berhasil diperbarui' });
  } catch (err) {
    res.status(500).json({ error: 'Terjadi kesalahan saat memperbarui profil' });
  }
});

module.exports = router;
