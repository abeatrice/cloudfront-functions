function handler(event) {
    var request = event.request;
    var cookies = request.cookies;
    var regex = /[^a-zA-Z0-9/_]+/g;
    if(!cookies['visitor_id']) {
        cookies['visitor_id'] = {
            value: event.context.requestId.replace(regex, '')
        }    
    }
    console.log(event);
    return request;
}
