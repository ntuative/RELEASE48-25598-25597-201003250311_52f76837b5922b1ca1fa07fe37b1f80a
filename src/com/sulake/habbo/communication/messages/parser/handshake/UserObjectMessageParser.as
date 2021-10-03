package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_395:String;
      
      private var var_2293:String;
      
      private var var_2297:int;
      
      private var var_2295:int;
      
      private var var_1341:String;
      
      private var var_1153:String;
      
      private var _name:String;
      
      private var var_467:int;
      
      private var var_796:int;
      
      private var var_2296:int;
      
      private var var_2231:int;
      
      private var var_2294:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2295;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1153;
      }
      
      public function get customData() : String
      {
         return this.var_2293;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_467;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2297;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2294;
      }
      
      public function get figure() : String
      {
         return this.var_395;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2231;
      }
      
      public function get sex() : String
      {
         return this.var_1341;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_395 = param1.readString();
         this.var_1341 = param1.readString();
         this.var_2293 = param1.readString();
         this.var_1153 = param1.readString();
         this.var_2296 = param1.readInteger();
         this.var_2294 = param1.readString();
         this.var_2297 = param1.readInteger();
         this.var_2295 = param1.readInteger();
         this.var_2231 = param1.readInteger();
         this.var_796 = param1.readInteger();
         this.var_467 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2296;
      }
      
      public function get respectLeft() : int
      {
         return this.var_796;
      }
   }
}
