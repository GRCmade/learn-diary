function test(){
    console.log('test');
    onMapReady(()=>{
        console.log("onMapReady");
    })
}
test()