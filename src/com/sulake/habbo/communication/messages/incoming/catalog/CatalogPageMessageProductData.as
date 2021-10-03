package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_203:String = "e";
      
      public static const const_74:String = "i";
      
      public static const const_81:String = "s";
       
      
      private var var_1030:String;
      
      private var var_1264:String;
      
      private var var_1263:int;
      
      private var var_2224:int;
      
      private var var_1031:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1264 = param1.readString();
         var_2224 = param1.readInteger();
         var_1030 = param1.readString();
         var_1031 = param1.readInteger();
         var_1263 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1031;
      }
      
      public function get productType() : String
      {
         return var_1264;
      }
      
      public function get expiration() : int
      {
         return var_1263;
      }
      
      public function get furniClassId() : int
      {
         return var_2224;
      }
      
      public function get extraParam() : String
      {
         return var_1030;
      }
   }
}
