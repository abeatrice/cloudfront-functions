function handler(event) {
    var response = event.response;
    var cookieAttributes = 'path=/;';

    var oneYear = new Date();
    oneYear.setTime(oneYear.getTime() + 365 * 24 * 60 * 60 * 1000);

    if(event.request.cookies.visitor_id) {
        response.cookies['visitor_id'] = {
            value: event.request.cookies.visitor_id.value,
            attributes: `expires=${oneYear.toUTCString()}; max-age=31536000; ${cookieAttributes}`
        }    
    }

    var thirtyMin = new Date();
    thirtyMin.setTime(thirtyMin.getTime() + 30 * 60 * 1000);
    
    if(event.request.cookies.visit_id) {
        response.cookies['visit_id'] = {
            value: event.request.cookies.visit_id.value,
            attributes: `expires=${thirtyMin.toUTCString()}; max-age=1800; ${cookieAttributes}`
        }    
    }

    console.log(event);
    return response;
}
