package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class PetCommandTool
   {
       
      
      private var var_671:int;
      
      private var var_339:Timer;
      
      private var var_340:IFrameWindow;
      
      private var _widget:InfostandWidget;
      
      private var var_983:Map;
      
      private const const_1635:int = 1100;
      
      private var var_1847:String;
      
      private var var_38:IFrameWindow;
      
      public function PetCommandTool(param1:InfostandWidget)
      {
         super();
         _widget = param1;
         var_983 = new Map();
         var_339 = new Timer(const_1635);
         var_339.addEventListener(TimerEvent.TIMER,onButtonDisableTimeout);
      }
      
      private function onWindowDesktopResized(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_38 && true)
         {
            _loc2_ = param1.window;
            _loc3_ = new Rectangle();
            var_38.getGlobalRectangle(_loc3_);
            if(_loc3_.x > _loc2_.width)
            {
               var_38.x = _loc2_.width - 0;
               var_38.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.x + _loc3_.width <= 0)
            {
               var_38.x = 0;
               var_38.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.y > _loc2_.height)
            {
               var_38.y = 0;
               var_38.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.y + _loc3_.height <= 0)
            {
               var_38.y = 0;
               var_38.getGlobalRectangle(_loc3_);
            }
         }
      }
      
      public function showWindow(param1:Boolean) : void
      {
         if(param1)
         {
            if(var_38 == null)
            {
               createCommandWindow();
            }
            var_38.visible = true;
         }
         else if(var_38 != null)
         {
            var_38.visible = false;
         }
         var_339.stop();
      }
      
      private function requestEnabledCommands(param1:int) : void
      {
         var _loc2_:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_655,param1);
         _widget.messageListener.processWidgetMessage(_loc2_);
      }
      
      public function dispose() : void
      {
         if(var_339)
         {
            var_339.stop();
            var_339 = null;
         }
         if(_widget)
         {
            _widget = null;
         }
         if(var_38)
         {
            var_38.dispose();
         }
         var_38 = null;
         if(var_340)
         {
            var_340.dispose();
         }
         var_340 = null;
      }
      
      private function updateCommandButtonsViewState(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(var_38 == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new Array();
         }
         var _loc3_:int = 0;
         do
         {
            _loc4_ = "btn_cmd_" + _loc3_;
            _loc2_ = var_38.findChildByName(_loc4_) as IButtonWindow;
            if(_loc2_ == null)
            {
               break;
            }
            if(param1.indexOf(_loc3_) > -1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
            _loc3_++;
         }
         while(_loc2_ != null);
         
         var_339.stop();
      }
      
      public function setEnabledCommands(param1:int, param2:Array) : void
      {
         var_983.remove(param1);
         var_983.add(param1,param2);
         if(param1 != var_671)
         {
            return;
         }
         updateCommandButtonsViewState(param2);
         var_339.stop();
      }
      
      public function isVisible() : Boolean
      {
         if(var_38 == null)
         {
            return false;
         }
         return var_38.visible;
      }
      
      private function onInfoWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               var_340.visible = false;
            }
         }
      }
      
      private function openInfoWindow() : void
      {
         var _loc1_:* = null;
         if(var_340 == null)
         {
            _loc1_ = _widget.assets.getAssetByName("pet_commands_info") as XmlAsset;
            var_340 = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
            if(var_340 == null)
            {
               throw new Error("Failed to construct command info window from XML!");
            }
            var_340.x = 200;
            var_340.procedure = onInfoWindowProcedure;
         }
         else
         {
            var_340.visible = true;
         }
      }
      
      private function onButtonDisableTimeout(param1:TimerEvent) : void
      {
         var _loc2_:Array = var_983.getValue(var_671) as Array;
         updateCommandButtonsViewState(_loc2_);
         var_339.stop();
      }
      
      private function onCommandWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               var_38.visible = false;
            }
            else if(param2.name == "description_link")
            {
               openInfoWindow();
            }
            else if(param2.name == "avatar_image")
            {
               _widget.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_412,var_671));
            }
            else if(param2.name.indexOf("btn_cmd_") > -1)
            {
               _loc4_ = int(param2.name.substring(8));
               _loc5_ = "pet.command." + _loc4_;
               _loc6_ = _widget.localizations.getKey(_loc5_);
               _loc7_ = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_518,var_671,var_1847 + " " + _loc6_);
               _widget.messageListener.processWidgetMessage(_loc7_);
               updateCommandButtonsViewState(new Array());
               var_339.start();
            }
         }
      }
      
      public function showCommandToolForPet(param1:int, param2:String, param3:BitmapData = null) : void
      {
         if(var_671 == param1)
         {
            return;
         }
         var_671 = param1;
         var_1847 = param2;
         if(var_38 == null)
         {
            return;
         }
         var _loc4_:ITextWindow = var_38.findChildByName("pet_name") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.text = param2;
         }
         var _loc5_:IBitmapWrapperWindow = var_38.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc5_ != null)
         {
            _loc5_.bitmap = param3;
            _loc5_.width = param3.width;
            _loc5_.height = param3.height;
            _loc5_.invalidate();
         }
         var _loc6_:Array = var_983.getValue(param1) as Array;
         if(_loc6_ == null)
         {
            updateCommandButtonsViewState(new Array());
            requestEnabledCommands(var_671);
         }
         else
         {
            updateCommandButtonsViewState(_loc6_);
         }
      }
      
      private function createCommandWindow() : void
      {
         var _loc1_:XmlAsset = _widget.assets.getAssetByName("pet_commands") as XmlAsset;
         var_38 = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
         if(var_38 == null)
         {
            throw new Error("Failed to construct command window from XML!");
         }
         var_38.setParamFlag(WindowParam.const_88,true);
         var_38.context.getDesktopWindow().addEventListener(WindowEvent.const_44,onWindowDesktopResized);
         var_38.procedure = onCommandWindowProcedure;
         var_38.x = 80;
      }
   }
}
