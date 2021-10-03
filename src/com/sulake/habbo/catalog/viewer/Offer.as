package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_974:String = "price_type_none";
      
      public static const const_382:String = "pricing_model_multi";
      
      public static const const_478:String = "price_type_credits";
      
      public static const const_438:String = "price_type_credits_and_pixels";
      
      public static const const_411:String = "pricing_model_bundle";
      
      public static const const_414:String = "pricing_model_single";
      
      public static const const_521:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1329:String = "pricing_model_unknown";
      
      public static const const_352:String = "price_type_pixels";
       
      
      private var var_786:int;
      
      private var _offerId:int;
      
      private var var_787:int;
      
      private var var_387:String;
      
      private var var_556:String;
      
      private var var_1704:int;
      
      private var var_575:ICatalogPage;
      
      private var var_1148:String;
      
      private var var_386:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1148 = param1.localizationId;
         var_786 = param1.priceInCredits;
         var_787 = param1.priceInPixels;
         var_575 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_387;
      }
      
      public function get page() : ICatalogPage
      {
         return var_575;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1704 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_386;
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
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1148 = "";
         var_786 = 0;
         var_787 = 0;
         var_575 = null;
         if(var_386 != null)
         {
            var_386.dispose();
            var_386 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_556;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1704;
      }
      
      public function get priceInCredits() : int
      {
         return var_786;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_387 = const_414;
            }
            else
            {
               var_387 = const_382;
            }
         }
         else if(param1.length > 1)
         {
            var_387 = const_411;
         }
         else
         {
            var_387 = const_1329;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_387)
         {
            case const_414:
               var_386 = new SingleProductContainer(this,param1);
               break;
            case const_382:
               var_386 = new MultiProductContainer(this,param1);
               break;
            case const_411:
               var_386 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_387);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_786 > 0 && var_787 > 0)
         {
            var_556 = const_438;
         }
         else if(var_786 > 0)
         {
            var_556 = const_478;
         }
         else if(var_787 > 0)
         {
            var_556 = const_352;
         }
         else
         {
            var_556 = const_974;
         }
      }
   }
}
