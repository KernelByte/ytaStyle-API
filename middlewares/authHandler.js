// Funcion para la validacion de la llave
function checkApiKey(req, res, next){
  const apiKey = req.headers["api"];
  const { config } = require("./../config/config");

  // Validacion de la llave recivida
  if (apiKey === config.apiKey) {
    next();
  } else {
    next(res.status(500).json({
      message: "no esta autorizado"}
      )
    );
  }
}

module.exports = { checkApiKey }
