package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_596:RoomObjectLocationCacheItem = null;
      
      private var var_163:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_596 = new RoomObjectLocationCacheItem(param1);
         var_163 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_596;
      }
      
      public function dispose() : void
      {
         if(var_596 != null)
         {
            var_596.dispose();
            var_596 = null;
         }
         if(var_163 != null)
         {
            var_163.dispose();
            var_163 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_163;
      }
   }
}
