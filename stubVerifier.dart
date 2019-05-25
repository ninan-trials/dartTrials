import 'dart:convert' show JSON;
import 'dart:io';
import "package:json_schema/json_schema.dart";

main() {
	var jsonAsString = new File('/Users/ninanjohn/pam/store_replenishment_app/stub/response_json/store_replenishment/GET_suppliers.json').readAsStringSync();
	var json = JSON.decode(jsonAsString);

	Schema.createSchemaFromUrl('/data/services/contracts/mobile_cache_data_service/mobile_cache_data/GET_suppliers.json')
    .then((schema) {
      var validator = new Validator(schema);
      bool validates = validator.validate(json);
      if(!validates) {
        print("Errors: ${validator.errors}");
      } else {
        print('$json:\nvalidates succesfully!');
      }
});	
}


// import 'dart:convert' show JSON;
// import 'dart:io';
// import "package:json_schema/json_schema.dart";

// main() {
// 	var jsonAsString = 
// 		new File('/Users/ninanjohn/pam/store_replenishment_service/stub/response_json/store_assortment_service/consolidated_store_articles/71912_71913.json')
// 		.readAsStringSync();
	
// 	var json = JSON.decode(jsonAsString);

// 	Schema.createSchemaFromUrl('/Users/ninanjohn/pam/store_assortment_service/contracts/contract_files/store_replenishment/GET_consolidated_articles.json')
//     .then((schema) {
//       var validator = new Validator(schema);
//       bool validates = validator.validate(json);
//       if(!validates) {
//         print("Errors: ${validator.errors}");
//       } else {
//         print('$json:\nvalidate success');
//       }
// });	
// }