/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */

require('dotenv').config();


module.exports = {
  development: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME
    },
    pool: { min: 2, max: 20 },
    migrations: {
      directory: './migrations',
      tableName: 'knex_migrations'
    }
  },

  staging: {
    client: 'pg',
    connection: {
      host: 'localhost',
      port: 5432,
      user: 'cricket_admin',
      password: 'cricket_pass',
      database: 'cricket_app'
    },
    pool: { min: 2, max: 10 },
    migrations: {
      directory: './migrations',
      tableName: 'knex_migrations'
    }
  },

  production: {
    client: 'pg',
    connection: {
      host: 'localhost',
      port: 5432,
      user: 'cricket_admin',
      password: 'cricket_pass',
      database: 'cricket_app'
    },
    pool: { min: 2, max: 10 },
    migrations: {
      directory: './migrations',
      tableName: 'knex_migrations'
    }
  }
};
