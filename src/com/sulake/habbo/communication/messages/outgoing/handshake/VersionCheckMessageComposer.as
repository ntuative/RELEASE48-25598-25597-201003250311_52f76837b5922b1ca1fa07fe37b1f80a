package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1852:String;
      
      private var var_1349:String;
      
      private var var_1851:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1851 = param1;
         var_1349 = param2;
         var_1852 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1851,var_1349,var_1852];
      }
      
      public function dispose() : void
      {
      }
   }
}
