require('dotenv').config();

const config = {
  env: process.env.NODE_ENV || 'dev',
  port: process.env.PORT || 3000,
  dbUser: process.env.DB_USER,
  dbHost: process.env.DB_HOST,
  dbPassword: process.env.DB_PASS,
  dbDataBase: process.env.DB_DATA_BASE,
  dbPort: process.env.DB_PORT,
  apiKey: process.env.API_KEY,
  jwtSecret: process.env.JWT_SECRET,
  jwtSecret_recovery: process.env.JWT_SECRET_RECOVERY,
  user_email: process.env.EMAIL,
  pass_email: process.env.PASS_EMAIL,
};

module.exports = { config };
