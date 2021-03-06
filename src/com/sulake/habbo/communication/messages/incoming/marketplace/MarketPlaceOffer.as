package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1238:int;
      
      private var var_1943:int = -1;
      
      private var var_370:int;
      
      private var var_1756:int;
      
      private var var_1941:int;
      
      private var _offerId:int;
      
      private var var_1237:int;
      
      private var var_1942:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1942 = param2;
         var_1941 = param3;
         var_1238 = param4;
         var_370 = param5;
         var_1943 = param6;
         var_1756 = param7;
         var_1237 = param8;
      }
      
      public function get status() : int
      {
         return var_370;
      }
      
      public function get price() : int
      {
         return var_1238;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1943;
      }
      
      public function get offerCount() : int
      {
         return var_1237;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1941;
      }
      
      public function get averagePrice() : int
      {
         return var_1756;
      }
      
      public function get furniId() : int
      {
         return var_1942;
      }
   }
}
