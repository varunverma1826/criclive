const fs = require('fs');
const path = require('path');
/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
    const sql = fs.readFileSync(path.join(__dirname, '../sql/init_schema.sql')).toString();
    return knex.raw(sql);
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
    const sql = fs.readFileSync(path.join(__dirname, '../sql/drop_schema.sql')).toString();
    return knex.raw(sql);
};
