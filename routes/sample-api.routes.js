const express = require('express'),
      router = express.Router();

const sample_country_service = require('../service/sample-country.service');
 

router.get('/', function(req, res, next) {
  res.json({hello:1});
});

router.post('/get-countries-with-name', function(req, res, next) {
  return sample_country_service
            .search_course_by_name(req)
            .then((result)=>{console.log('success');res.json(result)},
                  (err)=>{console.log(err);res.json(err)}
                );
            
});
 
module.exports = router;
