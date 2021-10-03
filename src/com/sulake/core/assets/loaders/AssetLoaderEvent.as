package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_870:String = "AssetLoaderEventUnload";
      
      public static const const_45:String = "AssetLoaderEventError";
      
      public static const const_916:String = "AssetLoaderEventOpen";
      
      public static const const_823:String = "AssetLoaderEventProgress";
      
      public static const const_891:String = "AssetLoaderEventStatus";
      
      public static const const_34:String = "AssetLoaderEventComplete";
       
      
      private var var_370:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_370 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_370;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_370);
      }
   }
}
