var AMQP_URL  = process.env.AMQP_URL;
var WORKDIR   = process.env.WORKDIR;
var S3_BUCKET = process.env.S3_BUCKET;
var S3_PATH   = process.env.S3_PATH;

exports.amqp_url = AMQP_URL;

 //S3 storage
 exports.options = {
     "storage": "s3",
     "bucket": S3_BUCKET,
     "prefix": S3_PATH
 };

//exports.options = {
//    "storage": "local",
//    "workdir": "/data/0.1/input"
//};


// NFS storage
// exports.options = {
//     "storage": "nfs",
//     "workdir": "/path/where/workflow/data/is",
// }


// Local storage
// exports.options = {
//     "storage": "local"
//     "workdir": "/path/where/workflow/data/is",
// }