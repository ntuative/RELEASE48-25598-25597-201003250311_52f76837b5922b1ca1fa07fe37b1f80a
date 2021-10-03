package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_395:String;
      
      private var var_1609:int;
      
      private var var_2201:String;
      
      private var var_1022:int;
      
      private var var_1201:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1201;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1201 = param1.readInteger();
         var_2201 = param1.readString();
         var_1609 = param1.readInteger();
         var_395 = param1.readString();
         var_1022 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2201;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_395;
      }
      
      public function get petType() : int
      {
         return var_1022;
      }
      
      public function get level() : int
      {
         return var_1609;
      }
   }
}
