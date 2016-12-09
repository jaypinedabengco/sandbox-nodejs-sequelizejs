const Promise = require('promise');

const sequelize_models  = require('../db/sequelize-models'),
      country_model     = sequelize_models.country;

var services = {
    search_course_by_name : search_course_by_name
}

module.exports = services;

return;

////////

/********************************
 * search course by name
*********************************/
function search_course_by_name(req){
    var _keyword = req.body.name;

    if ( !_keyword )
        return Promise.reject('name is required');

    return country_model    
                .findAll({
                    where : {
                        name : {
                            $like : '%' + _keyword + '%'
                        }
                    }
                })
                .then(result => {console.log(result); return result});    
}