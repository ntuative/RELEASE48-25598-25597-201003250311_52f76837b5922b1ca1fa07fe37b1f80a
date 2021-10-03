package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_120;
         param1["bound_to_parent_rect"] = const_88;
         param1["child_window"] = const_967;
         param1["embedded_controller"] = const_329;
         param1["resize_to_accommodate_children"] = const_60;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_633;
         param1["mouse_dragging_target"] = const_227;
         param1["mouse_dragging_trigger"] = const_283;
         param1["mouse_scaling_target"] = const_248;
         param1["mouse_scaling_trigger"] = const_357;
         param1["horizontal_mouse_scaling_trigger"] = const_220;
         param1["vertical_mouse_scaling_trigger"] = const_201;
         param1["observe_parent_input_events"] = const_896;
         param1["optimize_region_to_layout_size"] = const_389;
         param1["parent_window"] = const_990;
         param1["relative_horizontal_scale_center"] = const_162;
         param1["relative_horizontal_scale_fixed"] = const_122;
         param1["relative_horizontal_scale_move"] = const_309;
         param1["relative_horizontal_scale_strech"] = const_259;
         param1["relative_scale_center"] = const_846;
         param1["relative_scale_fixed"] = const_506;
         param1["relative_scale_move"] = const_953;
         param1["relative_scale_strech"] = const_982;
         param1["relative_vertical_scale_center"] = const_153;
         param1["relative_vertical_scale_fixed"] = const_116;
         param1["relative_vertical_scale_move"] = const_324;
         param1["relative_vertical_scale_strech"] = const_260;
         param1["on_resize_align_left"] = const_581;
         param1["on_resize_align_right"] = const_354;
         param1["on_resize_align_center"] = const_452;
         param1["on_resize_align_top"] = const_531;
         param1["on_resize_align_bottom"] = const_437;
         param1["on_resize_align_middle"] = const_467;
         param1["on_accommodate_align_left"] = const_802;
         param1["on_accommodate_align_right"] = const_429;
         param1["on_accommodate_align_center"] = const_578;
         param1["on_accommodate_align_top"] = const_867;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_700;
         param1["route_input_events_to_parent"] = const_455;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_824;
         param1["scalable_with_mouse"] = const_964;
         param1["reflect_horizontal_resize_to_parent"] = const_465;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_250;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
