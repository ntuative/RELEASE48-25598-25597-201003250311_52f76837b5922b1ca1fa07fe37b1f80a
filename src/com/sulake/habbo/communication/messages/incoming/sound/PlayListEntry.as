package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1635:int;
      
      private var var_1647:int = 0;
      
      private var var_1645:String;
      
      private var var_1646:int;
      
      private var var_1648:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1635 = param1;
         var_1646 = param2;
         var_1648 = param3;
         var_1645 = param4;
      }
      
      public function get length() : int
      {
         return var_1646;
      }
      
      public function get name() : String
      {
         return var_1648;
      }
      
      public function get creator() : String
      {
         return var_1645;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1647;
      }
      
      public function get id() : int
      {
         return var_1635;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1647 = param1;
      }
   }
}
