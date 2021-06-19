function handler(event) {
    var response = event.response;
    var cookies = response.cookies;
    
    var maxAge = 365 * 24 * 60 * 60;
    var date = new Date();
    date.setTime(date.getTime() + 365 * 24 * 60 * 60 * 1000);
    
    if(event.request.cookies.visitor_id) {
        cookies['visitor_id'] = {
            value: event.request.cookies.visitor_id.value,
            attributes: `expires=${date.toUTCString()};max-age=${maxAge}`
        }    
    }
    
    console.log(event);
    return response;
}
