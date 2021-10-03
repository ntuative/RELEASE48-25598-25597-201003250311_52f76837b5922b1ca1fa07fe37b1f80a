package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1588:GarbageMonitor = null;
      
      private var var_1359:int = 0;
      
      private var var_1257:Boolean = false;
      
      private var var_2021:String = "";
      
      private var var_1587:String = "";
      
      private var var_366:Number = 0;
      
      private var var_1362:int = 10;
      
      private var var_2332:Array;
      
      private var var_634:int = 0;
      
      private var var_1360:int = 60;
      
      private var var_1089:int = 0;
      
      private var var_1088:int = 0;
      
      private var var_2024:String = "";
      
      private var var_2240:Number = 0;
      
      private var var_1363:int = 1000;
      
      private var var_2241:Boolean = true;
      
      private var var_2242:Number = 0.15;
      
      private var var_144:IHabboConfigurationManager = null;
      
      private var var_2022:String = "";
      
      private var var_1361:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2332 = [];
         super();
         var_1587 = Capabilities.version;
         var_2021 = Capabilities.os;
         var_1257 = Capabilities.isDebugger;
         var_2022 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1588 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1359 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1588.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1588.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get method_17() : int
      {
         return var_366;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1360 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1587;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1088;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1363)
         {
            ++var_1089;
            _loc3_ = true;
         }
         else
         {
            ++var_634;
            if(var_634 <= 1)
            {
               var_366 = param1;
            }
            else
            {
               _loc4_ = Number(var_634);
               var_366 = var_366 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1359 > var_1360 * 1000 && var_1361 < var_1362)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_366);
            _loc5_ = true;
            if(var_2241 && var_1361 > 0)
            {
               _loc6_ = differenceInPercents(var_2240,var_366);
               if(_loc6_ < var_2242)
               {
                  _loc5_ = false;
               }
            }
            var_1359 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2240 = var_366;
               if(sendReport())
               {
                  ++var_1361;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1362 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1363 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_2022,var_1587,var_2021,var_2024,var_1257,_loc4_,_loc3_,var_1088,var_366,var_1089);
            _connection.send(_loc1_);
            var_1088 = 0;
            var_366 = 0;
            var_634 = 0;
            var_1089 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_144 = param1;
         var_1360 = int(var_144.getKey("performancetest.interval","60"));
         var_1363 = int(var_144.getKey("performancetest.slowupdatelimit","1000"));
         var_1362 = int(var_144.getKey("performancetest.reportlimit","10"));
         var_2242 = Number(var_144.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2241 = Boolean(int(var_144.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
