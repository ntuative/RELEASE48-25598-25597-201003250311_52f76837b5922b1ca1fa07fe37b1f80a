package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1776:int;
      
      private var var_1123:PetData;
      
      private var var_1775:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1776;
      }
      
      public function get petData() : PetData
      {
         return var_1123;
      }
      
      public function flush() : Boolean
      {
         var_1123 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1775;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1776 = param1.readInteger();
         var_1775 = param1.readInteger();
         var_1123 = new PetData(param1);
         return true;
      }
   }
}
