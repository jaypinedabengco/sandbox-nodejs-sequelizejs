const config    = require('config'),
      Sequelize = require('sequelize');

/**
 * If possible, put db username, password, db_name, host on environment, so that 
 * it won't show on code
 */
var sequelize = new Sequelize(
    config.db.name, 
    config.db.username, 
    config.db.password, {
        host: config.db.host,
        dialect: config.db.dialect,
        pool:config.db.pool,
        define: { 
            timestamps: false, 
            createdAt: false  
        }
});

const models = {
    country : sequelize.import('../models/country'),
}

module.exports = models;