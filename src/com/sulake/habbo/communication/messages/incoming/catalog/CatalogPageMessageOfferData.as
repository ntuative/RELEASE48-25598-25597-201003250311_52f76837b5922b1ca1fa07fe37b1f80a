package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_812:Array;
      
      private var var_786:int;
      
      private var var_1148:String;
      
      private var _offerId:int;
      
      private var var_787:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1148 = param1.readString();
         var_786 = param1.readInteger();
         var_787 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_812 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_812.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_812;
      }
      
      public function get priceInCredits() : int
      {
         return var_786;
      }
      
      public function get localizationId() : String
      {
         return var_1148;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_787;
      }
   }
}
