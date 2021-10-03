package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_558:Array;
      
      private var var_1238:int;
      
      private var var_1417:Array;
      
      private var var_559:Array;
      
      private var var_1181:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1181 = _loc2_.isWrappingEnabled;
         var_1238 = _loc2_.wrappingPrice;
         var_1417 = _loc2_.stuffTypes;
         var_559 = _loc2_.boxTypes;
         var_558 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_558;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1417;
      }
      
      public function get price() : int
      {
         return var_1238;
      }
      
      public function get boxTypes() : Array
      {
         return var_559;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1181;
      }
   }
}
