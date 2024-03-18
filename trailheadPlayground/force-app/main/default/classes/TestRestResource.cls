@RestResource(urlMapping='/Account')
global class TestRestResource {
    @HttpGet
    global static String getCaseById() {
        RestRequest request = RestContext.request;
        //getting the Response
        String str = request.requestBody.toString();
        System.debug('String-->'+str);
            //String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        return str;
    }
}