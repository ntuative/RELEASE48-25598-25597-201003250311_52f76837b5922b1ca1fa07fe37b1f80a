package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_1998:int;
      
      private var var_1147:int;
      
      private var _type:int;
      
      private var var_1999:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return var_1999;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         var_1998 = param1;
      }
      
      public function get duration() : int
      {
         return var_1147;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         var_1999 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1147 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return var_1998;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
   }
}
