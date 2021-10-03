package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_513:ToolbarIconGroup;
      
      private var var_1046:Boolean = false;
      
      private var var_2061:String;
      
      private var var_813:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1048:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_31:String = "-1";
      
      private var var_95:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_712:String;
      
      private var var_1843:int;
      
      private var var_711:Timer;
      
      private var var_1517:Array;
      
      private var var_1049:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2309:Array;
      
      private var var_265:ToolbarBarMenuAnimator;
      
      private var var_424:ToolbarIconAnimator;
      
      private var var_589:Array;
      
      private var var_873:Array;
      
      private var var_874:String = "-1";
      
      private var var_2373:Boolean = true;
      
      private var var_1047:Array;
      
      private var var_1288:Timer;
      
      private var var_2062:int;
      
      private var var_83:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_589 = new Array();
         var_873 = new Array();
         var_2309 = new Array();
         var_1049 = new ToolbarIconBouncer(0.8,1);
         super();
         var_513 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_712 = param4;
         _events = param5;
         var_265 = param6;
         var_1288 = new Timer(40,40);
         var_1288.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_95 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_392,HabboWindowStyle.const_40,HabboWindowParam.const_41,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_95.background = true;
         var_95.mouseTreshold = 0;
         var_95.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_95.addChild(_window);
         _window.addEventListener(WindowEvent.const_44,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1517[var_1047.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_2062;
      }
      
      public function get iconId() : String
      {
         return var_712;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_813 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_31 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_95 == null || _window == null)
         {
            return;
         }
         var_95.width = _window.width;
         var_95.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_83 = (0 - 0) / 2;
            _y = var_813 + (0 - 0) / 2;
         }
         else
         {
            var_83 = var_813 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_95.x = var_83;
         var_95.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_95 != null)
         {
            var_95.dispose();
            var_95 = null;
         }
         var_589 = null;
         var_873 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_265 = null;
         var_424 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_589.indexOf(param1) < 0)
         {
            var_589.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_873.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1046)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_265)
               {
                  var_265.repositionWindow(var_712,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_54);
                  _loc4_.iconId = var_712;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1048;
                  }
               }
               break;
            case WindowMouseEvent.const_30:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_874;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_589.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_873[var_589.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1046 = param1;
         if(var_95 != null)
         {
            var_95.visible = var_1046;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_95 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_95.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_95.toolTipCaption = "${toolbar.icon.tooltip." + var_2061.toLowerCase() + "}";
         }
         var_95.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_265 != null)
         {
            var_265.animateWindowIn(this,param1,param2,var_712,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_424 != null && _window != null)
         {
            var_424.update(_window);
            if(var_424.hasNextState())
            {
               state = var_424.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1517 = new Array();
         var_1047 = new Array();
         var_2061 = param1.@id;
         var_2062 = int(param1.@window_offset_from_icon);
         var_1843 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1048 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_874 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1047.push(_loc5_.id);
               var_1517.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1048 == "-1")
                  {
                     var_1048 = _loc5_.id;
                  }
                  if(var_874 == "-1")
                  {
                     var_874 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_31 = var_874;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_265 != null)
         {
            var_265.hideWindow(param1,param2,var_712,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_265 != null)
         {
            var_265.positionWindow(this,param1,param2,var_712,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_265 != null)
         {
            var_265.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1046;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1049 != null && _window != null)
         {
            var_1049.update();
            _window.y = var_1049.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_711 != null)
         {
            var_711.stop();
            var_711 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1046)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_424 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_83,_y,_bitmapData);
            if(false)
            {
               var_711 = new Timer(_loc1_.timer);
               var_711.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_711.start();
            }
            if(_loc1_.bounce)
            {
               var_1049.reset(-7);
               var_1288.reset();
               var_1288.start();
            }
         }
         else
         {
            var_424 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1843 + var_513.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_31);
      }
      
      public function get window() : IWindow
      {
         return var_95;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_873[var_589.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_513;
      }
   }
}
