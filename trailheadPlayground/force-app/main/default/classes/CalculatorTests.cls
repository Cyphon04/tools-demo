/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest

public class CalculatorTests {

    @IsTest
    static void testDivideByZero() {
        Integer numerator = 10;
        Integer denominator = 0;
        try {
            Test.startTest();
            Decimal result = Calculator.divide(numerator, denominator);
            Test.stopTest();
            System.assert(false, 'Expected an exception but none was thrown');
        } catch (Exception e) {
            System.assertEquals('You still can\'t divide by zero', e.getMessage(), 'Incorrect exception message');
            System.assertEquals('Calculator.CalculatorException', e.getTypeName(), 'Unexpected exception type');
        }
    }
    @IsTest
    static void testDivideByNonZero() {
        Integer numerator = 10;
        Integer denominator = 500;

        Decimal Result = Calculator.divide(numerator, denominator);
        System.assertEquals(50,Result,'Division Result is not Same');
        
    }


    @isTest
    static void testMultiplybyZero()
    {
        Integer a = 2;
        Integer b = 0;

        try {
            Test.startTest();
            Integer val = Calculator.multiply(a,b);
            Test.stopTest();
            System.assert(false,'Expected a multiplicaion error but none thrown');
        } catch (Exception e) {
            System.assertEquals('It doesn\'t make sense to multiply by zero', e.getMessage(), 'Incorrect exception message');
            System.assertEquals('Calculator.CalculatorException', e.getTypeName(), 'Unexpected exception type');
        }
    }

    @isTest
    static void testMultiplybyNonZero()
    {
        Integer a = 2;
        Integer b = 5;

        Integer val = Calculator.multiply(a,b);
        System.assertEquals(10,val,'Multiplication Value is not Same');
    }

    @IsTest

    static void testAddition() {
        Integer a = 10;
        Integer b = 5;
        Integer result = Calculator.add(a, b);
        System.assertEquals(15, result, 'Incorrect addition result');

    }
    @isTest
    static void testSubtract()
    {
        Integer a = 10;
        Integer b = 5;
        Integer result = Calculator.substract(a, b);
        System.assertEquals(5, result, 'Incorrect addition result');
    }
}