package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2282:Boolean;
      
      private var var_2284:int;
      
      private var var_2285:Boolean;
      
      private var var_1394:String;
      
      private var var_1153:String;
      
      private var var_1612:int;
      
      private var var_1638:String;
      
      private var var_2283:String;
      
      private var var_1637:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1612 = param1.readInteger();
         this.var_1394 = param1.readString();
         this.var_1638 = param1.readString();
         this.var_2282 = param1.readBoolean();
         this.var_2285 = param1.readBoolean();
         param1.readString();
         this.var_2284 = param1.readInteger();
         this.var_1637 = param1.readString();
         this.var_2283 = param1.readString();
         this.var_1153 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1153;
      }
      
      public function get avatarName() : String
      {
         return this.var_1394;
      }
      
      public function get avatarId() : int
      {
         return this.var_1612;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2282;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2283;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1637;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2285;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1638;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2284;
      }
   }
}
