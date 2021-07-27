function handler(event) {
    var request = event.request;
    var cookies = request.cookies;
    var id = event.context.requestId.replace(/=+/g, '')

    if(!cookies['visitor_id']) {
      cookies['visitor_id'] = {
        value: id
      }
    }

    if(!cookies['visit_id']) {
      cookies['visit_id'] = {
        value: id
      }    
    }

    return request;
}
