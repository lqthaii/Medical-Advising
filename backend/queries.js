const Pool = require("pg").Pool;
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "health_advice_development",
  password: "123456",
  port: 5432,
});

const login = (request, response) => {
  const { email, password } = request.body;
  pool.query(
    "SELECT * FROM users WHERE email = $1",
    [email],
    (error, results) => {
      if (error) {
        throw error;
      }
      if (results.rows[0] != null) {
        if (encrypted_password == password)
          response.status(201).json({ user: results.rows[0] });
      } else {
        response.status(401).json({ error: "Login false" });
      }
    }
  );
};

const register = (req, response) => {
  const { email, password } = req.body;
  pool.query(
    "INSERT INTO users (email, encrypted_password, created_at, updated_at) VALUES ($1, $2, $3, $4)",
    [email, password],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(201).json(results);
    }
  );
};

const getUsers = (request, response) => {
  pool.query("SELECT * FROM users ORDER BY id ASC", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

module.exports = {
  getUsers,
  login,
  register,
};
