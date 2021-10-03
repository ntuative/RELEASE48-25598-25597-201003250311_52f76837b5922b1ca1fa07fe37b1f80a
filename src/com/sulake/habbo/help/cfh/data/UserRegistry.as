package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1054:int = 80;
       
      
      private var var_473:Map;
      
      private var var_662:String = "";
      
      private var var_1187:Array;
      
      public function UserRegistry()
      {
         var_473 = new Map();
         var_1187 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_473.getValue(var_1187.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_662;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_473.getValue(param1) != null)
         {
            var_473.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_662);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_662 == "")
         {
            var_1187.push(param1);
         }
         var_473.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_473;
      }
      
      public function unregisterRoom() : void
      {
         var_662 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_473.length > const_1054)
         {
            _loc1_ = var_473.getKey(0);
            var_473.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_662 = param1;
         if(var_662 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
