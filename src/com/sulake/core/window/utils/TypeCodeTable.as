package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_538;
         param1["bitmap"] = const_510;
         param1["border"] = const_706;
         param1["border_notify"] = const_1369;
         param1["button"] = const_463;
         param1["button_thick"] = const_684;
         param1["button_icon"] = const_1159;
         param1["button_group_left"] = const_733;
         param1["button_group_center"] = const_534;
         param1["button_group_right"] = const_608;
         param1["canvas"] = const_645;
         param1["checkbox"] = const_593;
         param1["closebutton"] = const_1003;
         param1["container"] = const_323;
         param1["container_button"] = const_680;
         param1["display_object_wrapper"] = const_561;
         param1["dropmenu"] = const_448;
         param1["dropmenu_item"] = const_390;
         param1["frame"] = const_290;
         param1["frame_notify"] = const_1274;
         param1["header"] = const_595;
         param1["icon"] = const_952;
         param1["itemgrid"] = const_989;
         param1["itemgrid_horizontal"] = const_364;
         param1["itemgrid_vertical"] = const_605;
         param1["itemlist"] = const_923;
         param1["itemlist_horizontal"] = const_334;
         param1["itemlist_vertical"] = const_326;
         param1["maximizebox"] = const_1208;
         param1["menu"] = const_1256;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_873;
         param1["minimizebox"] = const_1308;
         param1["notify"] = const_1152;
         param1["null"] = const_703;
         param1["password"] = const_513;
         param1["radiobutton"] = const_670;
         param1["region"] = const_392;
         param1["restorebox"] = const_1138;
         param1["scaler"] = const_542;
         param1["scaler_horizontal"] = const_1228;
         param1["scaler_vertical"] = const_1355;
         param1["scrollbar_horizontal"] = const_442;
         param1["scrollbar_vertical"] = const_574;
         param1["scrollbar_slider_button_up"] = const_841;
         param1["scrollbar_slider_button_down"] = const_857;
         param1["scrollbar_slider_button_left"] = const_807;
         param1["scrollbar_slider_button_right"] = const_986;
         param1["scrollbar_slider_bar_horizontal"] = const_832;
         param1["scrollbar_slider_bar_vertical"] = const_972;
         param1["scrollbar_slider_track_horizontal"] = const_907;
         param1["scrollbar_slider_track_vertical"] = const_876;
         param1["scrollable_itemlist"] = const_1300;
         param1["scrollable_itemlist_vertical"] = const_369;
         param1["scrollable_itemlist_horizontal"] = const_994;
         param1["selector"] = const_522;
         param1["selector_list"] = const_591;
         param1["submenu"] = const_873;
         param1["tab_button"] = const_599;
         param1["tab_container_button"] = const_949;
         param1["tab_context"] = const_444;
         param1["tab_content"] = const_943;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_732;
         param1["input"] = const_586;
         param1["toolbar"] = const_1262;
         param1["tooltip"] = const_332;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
