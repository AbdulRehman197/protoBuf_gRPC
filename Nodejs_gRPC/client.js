const path = require("path");
const grpc = require("@grpc/grpc-js");
const protoLoader = require("@grpc/proto-loader");



const packageDefinition = protoLoader.loadSync(path.resolve(__dirname, "proto/greeting.proto")); 
const greeting = grpc.loadPackageDefinition(packageDefinition).greeting;

const client = new greeting.Greeter("localhost:3000", grpc.credentials.createInsecure());

client.sayHello({ name: "world" }, (err, response) => {
    if (err) {
        console.error(err);
        return;
    }
    console.log(response.message);
})