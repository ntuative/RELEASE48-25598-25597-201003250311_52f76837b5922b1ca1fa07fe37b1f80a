package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1323:BigInteger;
      
      private var var_590:BigInteger;
      
      private var var_1540:BigInteger;
      
      private var var_1541:BigInteger;
      
      private var var_2139:BigInteger;
      
      private var var_1663:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1323 = param1;
         var_1540 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2139.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1541 = new BigInteger();
         var_1541.fromRadix(param1,param2);
         var_2139 = var_1541.modPow(var_590,var_1323);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1663.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1323.toString() + ",generator: " + var_1540.toString() + ",secret: " + param1);
         var_590 = new BigInteger();
         var_590.fromRadix(param1,param2);
         var_1663 = var_1540.modPow(var_590,var_1323);
         return true;
      }
   }
}
