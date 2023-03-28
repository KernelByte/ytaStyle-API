// Nos traemos a express
const express = require('express');
// Ejecutamos el metodo de express
const app = express();
// Nos traemos la funcion de autentificacion
const { checkApiKey } = require("./middlewares/authHandler");
//const passport = require('passport')
//app.use(passport.initialize());

// Nos traemos el middleware de errores
const { logErrors, errorHandler, boomErrorHandler, ormErrorHandler } = require('./middlewares/errorHandler');

// Nos traemos a la libreria de cors
//const cors = require("cors");
//require('./utils/auth');
//Traemos las rutas modularizadas
const routerApi = require('./routes');


// Añadimos el puerto por el que escuchara la app
const port = 3000;
// usamos middleware para recibir formato json en la app
app.use(express.json());
// hacemos uso de cors - Permisos por dominio
// const whitelist = ["http://localhost:8080","https://myapp.co"];
/*const options = {
  origin: (origin, callback) => {
    if (whitelist.includes(origin) || !origin) {
      callback(null, true);
    } else {
      callback(new Error('Acceso no permitido'));
    }
  },
};*/
//app.use(cors(options));

/*app.get('/prueba', checkApiKey, (request, response) => {
  response.send('Otra Ruta.');
});*/

//iniciamos la app en la siguiente ruta
app.get('/', (request, response) => {
  response.send('Inicio del server en Express.');
});

routerApi(app);
// Middleware se usa despues del router de la aplicacion
app.use(logErrors);
app.use(boomErrorHandler);
app.use(errorHandler);
app.use(ormErrorHandler);


// Se le indica el puerto a la app
app.listen(port, () => {
  console.log('Mi puerto es: ' + port);
});
