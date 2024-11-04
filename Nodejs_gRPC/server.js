const path = require("path");
const grpc = require("@grpc/grpc-js");
const protoLoader = require("@grpc/proto-loader");



const packageDefinition = protoLoader.loadSync(path.resolve(__dirname, "proto/greeting.proto")); 
const greeting = grpc.loadPackageDefinition(packageDefinition).greeting;

    function main() {
        const server = new grpc.Server();
        server.addService(greeting.Greeter.service, {
            SayHello: (call, callback) => {
                callback(null, {
                    message: "hi " + call.request.name,
                });
            }   
        });
        
        server.bindAsync("0.0.0.0:50051", grpc.ServerCredentials.createInsecure(), (err, port) => {
            if (err) {
                console.error(err);
                return;
            }
            console.log(`Server started, listening on ${port}`);
           
        });
       
    
    }

main();

