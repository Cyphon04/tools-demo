/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public  class ExternalSearchTests {
    @IsTest
  static void testPositiveMocking() {
    // GIVEN
    HTTPMockFactory mock = new HTTPMockFactory(
      200,
      'OK',
      'I found it!',
      new Map<String, String>()
    );
    Test.setMock(HttpCalloutMock.class, mock);
    // WHEN
    Test.startTest();
      String result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    // THEN
    Assert.areEqual('I found it!', result, 'Expected to receive mock response');
  }
  static void testNegativeMocking() {
    HttpMockFactory mock = new HttpMockFactory(500, 'Internal Server Error', 'server issue!', new Map<String,String>());
    Test.setMock(HttpCalloutMock.class, mock);
    String result;
    try {
        Test.startTest();
            result = ExternalSearch.googleIt('server issue');
        Test.stopTest();
        System.assertEquals('server issue!', result); 
    } catch (Exception e) {
        
    }
    
  }
}