const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
  const token = req.header('Authorization');
  if (!token) {
    return res.status(401).json({ error: 'Akses ditolak, token tidak ditemukan' });
  }

  try {
    const decoded = jwt.verify(token, 'secretkey');
    req.user = decoded.userId;
    next();
  } catch (err) {
    res.status(401).json({ error: 'Token tidak valid' });
  }
};

module.exports = authMiddleware;
