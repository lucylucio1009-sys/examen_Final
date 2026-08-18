function fn() {
  var env = karate.env || 'cert';
  karate.log('Ambiente de ejecución: ' + env);

  var config = {
    env: env,
    baseURL: 'http://localhost:3000',
    pathUsuarios: '/usuarios',
    pathConsultaUsuarios: '/usuarios',

  };

  if (env == 'dev') {
    config.baseURL = 'http://localhost:3000';
  } else if (env == 'cert') {
    config.baseURL = 'http://localhost:3000';
  } else {
    karate.fail('Ambiente no soportado: ' + env);
  }

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);

  return config;
}