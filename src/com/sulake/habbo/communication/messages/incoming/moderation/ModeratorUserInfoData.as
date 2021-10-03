package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1922:int;
      
      private var var_1920:int;
      
      private var var_1923:int;
      
      private var _userName:String;
      
      private var var_1921:int;
      
      private var var_1925:int;
      
      private var var_1924:int;
      
      private var _userId:int;
      
      private var var_641:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1925 = param1.readInteger();
         var_1921 = param1.readInteger();
         var_641 = param1.readBoolean();
         var_1923 = param1.readInteger();
         var_1920 = param1.readInteger();
         var_1922 = param1.readInteger();
         var_1924 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1924;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_641;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1921;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1920;
      }
      
      public function get cautionCount() : int
      {
         return var_1922;
      }
      
      public function get cfhCount() : int
      {
         return var_1923;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1925;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
