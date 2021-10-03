package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1449:int = 2;
      
      public static const const_1602:int = 1;
      
      public static const const_1467:int = 0;
       
      
      private var var_1238:int;
      
      private var var_370:int;
      
      private var var_2375:int;
      
      private var _offerId:int;
      
      private var var_1941:int;
      
      private var var_1942:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1942 = param2;
         var_1941 = param3;
         var_1238 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1942;
      }
      
      public function get furniType() : int
      {
         return var_1941;
      }
      
      public function get price() : int
      {
         return var_1238;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
